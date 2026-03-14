from django.db import transaction

from payment.models import Payment
from payment.services import MtnMomoClient


def process_momo_payment_check(payment):
    client = MtnMomoClient()
    data = client.get_request_status(payment.provider_reference)
    status = (data.get("status") or "").upper()

    with transaction.atomic():
        payment = Payment.objects.select_for_update().get(pk=payment.pk)

        payment.provider_status = status
        payment.provider_payload = data
        payment.save(update_fields=["provider_status", "provider_payload"])

        if status == "SUCCESSFUL":
            if payment.status != Payment.STATUS_CONFIRMED:
                payment.confirm(payload=data)
            result = "confirmed"

        elif status in {"FAILED", "REJECTED", "TIMEOUT"}:
            payment.fail(payload=data, provider_status=status)
            result = "failed"

        else:
            payment.mark_pending(payload=data)
            result = "pending"

    return {
        "result": result,
        "status": status,
        "data": data,
        "payment_id": payment.id,
    }
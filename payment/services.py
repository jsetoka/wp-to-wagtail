# payments/services.py
from datetime import timedelta
import base64
import uuid
import requests

from django.conf import settings
from django.utils import timezone

from payment.models import MomoAccessToken


class MtnMomoError(Exception):
    pass


class MtnMomoClient:
    def __init__(self):
        self.base_url = settings.MTN_MOMO_BASE_URL.rstrip("/")
        self.subscription_key = settings.MTN_MOMO_COLLECTION_PRIMARY_KEY
        self.api_user = settings.MTN_MOMO_API_USER
        self.api_key = settings.MTN_MOMO_API_KEY
        self.target_env = settings.MTN_MOMO_TARGET_ENV
        self.callback_url = getattr(settings, "MTN_MOMO_CALLBACK_URL", "")

    def _common_headers(self):
        return {
            "Ocp-Apim-Subscription-Key": self.subscription_key,
            "X-Target-Environment": self.target_env,
        }

    def apiuser(self, reference_id, key):
        url = f"{self.base_url}/v1_0/apiuser/{reference_id}/apikey"
        headers = {
            "Cache-Control": "no-cache",
            "Ocp-Apim-Subscription-Key": key,
        }

        response = requests.post(url, headers=headers, timeout=30)

        try:
            data = response.json()
        except ValueError:
            raise MtnMomoError(f"Réponse API user invalide: {response.text}")

        if response.status_code not in (200, 201):
            raise MtnMomoError(f"Création apiKey échouée: {response.status_code} - {response.text}")

        return data["apiKey"]

    def create_momo_user(self, ref_id):
        url = f"{self.base_url}/v1_0/apiuser"
        headers = {
            "Content-Type": "application/json",
            "Cache-Control": "no-cache",
            "X-Reference-Id": ref_id,
            "Ocp-Apim-Subscription-Key": self.subscription_key,
        }
        body = {
            "providerCallbackHost": "string",
        }

        response = requests.post(url, json=body, headers=headers, timeout=30)

        if response.status_code != 201:
            raise MtnMomoError(f"Création apiuser échouée: {response.status_code} - {response.text}")

        apikey = self.apiuser(ref_id, self.subscription_key)
        return {"apiuser": ref_id, "apikey": apikey}

    def get_access_token(self, reference_id=None):
        token_obj = MomoAccessToken.objects.filter(
            provider="mtn_cg",
            target_env=self.target_env,
        ).first()

        now = timezone.now()

        if token_obj and token_obj.expires_at > now:
            return token_obj.access_token

        api_user = self.api_user
        api_key = self.api_key

        # Sandbox dynamique, seulement si nécessaire
        if self.target_env.lower() == "sandbox":
            if not reference_id:
                reference_id = str(uuid.uuid4())
            user = self.create_momo_user(reference_id)
            api_user = user["apiuser"]
            api_key = user["apikey"]

        raw = f"{api_user}:{api_key}".encode("utf-8")
        auth = base64.b64encode(raw).decode("utf-8")

        url = f"{self.base_url}/collection/token/"
        headers = {
            "Authorization": f"Basic {auth}",
            "Ocp-Apim-Subscription-Key": self.subscription_key,
        }

        response = requests.post(url, headers=headers, timeout=30)

        if response.status_code != 200:
            raise MtnMomoError(
                f"Impossible d'obtenir le token MTN: {response.status_code} - {response.text}"
            )

        data = response.json()
        access_token = data["access_token"]
        expires_in = int(data.get("expires_in", 3600))
        expires_at = now + timedelta(seconds=max(expires_in - 60, 60))

        if token_obj is None:
            token_obj = MomoAccessToken(
                provider="mtn_cg",
                api_user=api_user,
                target_env=self.target_env,
            )

        token_obj.access_token = access_token
        token_obj.expires_at = expires_at
        token_obj.save()

        return access_token

    def request_to_pay(self, *, payment, phone_number, payer_message, payee_note):
        url = f"{self.base_url}/collection/v1_0/requesttopay"
        ref_id = str(uuid.uuid4())

        token = self.get_access_token(ref_id)

        headers = {
            **self._common_headers(),
            "Authorization": f"Bearer {token}",
            "X-Reference-Id": ref_id,
            "Content-Type": "application/json",
        }

        payload = {
            "amount": str(payment.amount),
            "currency": settings.MTN_MOMO_CURRENCY,
            "externalId": str(payment.id),
            "payer": {
                "partyIdType": "MSISDN",
                "partyId": phone_number,
            },
            "payerMessage": payer_message[:160],
            "payeeNote": payee_note[:160],
        }

        if self.callback_url:
            payload["callbackUrl"] = self.callback_url

        response = requests.post(url, json=payload, headers=headers, timeout=30)

        if response.status_code not in (202, 201):
            raise MtnMomoError(f"Echec requestToPay: {response.status_code} - {response.text}")

        return {
            "reference_id": ref_id,
            "status_code": response.status_code,
            "body": response.text,
        }

    def get_request_status(self, reference_id):
        token = self.get_access_token()

        url = f"{self.base_url}/collection/v1_0/requesttopay/{reference_id}"
        headers = {
            **self._common_headers(),
            "Authorization": f"Bearer {token}",
        }

        response = requests.get(url, headers=headers, timeout=30)
        if response.status_code != 200:
            raise MtnMomoError(
                f"Impossible de lire le statut MTN: {response.status_code} - {response.text}"
            )
        return response.json()
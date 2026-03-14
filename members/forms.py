# members/forms.py
from django import forms
from .models import MemberAnnualDues, AnnualFee

class MemberAnnualDuesForm(forms.ModelForm):
    class Meta:
        model = MemberAnnualDues
        fields = ["fee", "status", "amount_due"]

        labels = {
            "fee": "Cotisation annuelle",
            "status": "Statut",
            "amount_due": "Montant dû",
        }

        widgets = {
            "fee": forms.Select(attrs={"class": "form-select"}),
            "status": forms.Select(attrs={"class": "form-select"}),
            "amount_due": forms.NumberInput(attrs={"class": "form-control"}),
        }

    def __init__(self, *args, **kwargs):
        self.member = kwargs.pop("member", None)
        super().__init__(*args, **kwargs)

        if self.member:
            existing_fee_ids = self.member.dues.values_list("fee_id", flat=True)
            self.fields["fee"].queryset = AnnualFee.objects.exclude(id__in=existing_fee_ids)

    def save(self, commit=True):
        obj = super().save(commit=False)

        if obj.fee_id and not obj.amount_due:
            obj.amount_due = obj.fee.amount

        if commit:
            obj.save()

        return obj
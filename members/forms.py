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
    

from django import forms
from django.contrib.auth import get_user_model

User = get_user_model()


class MemberProfileUpdateForm(forms.ModelForm):
    first_name = forms.CharField(
        label="Prénom",
        max_length=150,
        required=False,
        widget=forms.TextInput(attrs={"class": "form-control"}),
    )
    last_name = forms.CharField(
        label="Nom",
        max_length=150,
        required=False,
        widget=forms.TextInput(attrs={"class": "form-control"}),
    )
    email = forms.EmailField(
        label="Adresse email",
        required=False,
        widget=forms.EmailInput(attrs={"class": "form-control", "readonly": "readonly"}),
    )

    class Meta:
        model = User
        fields = ["first_name", "last_name", "email"]

    def save(self, commit=True):
        user = super().save(commit=commit)
        return user
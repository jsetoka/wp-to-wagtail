# adhesions/forms.py

from django import forms
from .models import Application, ApplicationDocument
from .choices import ApplicationType, DocumentType


class ApplicationStartForm(forms.Form):
    application_type = forms.ChoiceField(choices=ApplicationType.choices)


class PersonalInfoForm(forms.ModelForm):
    class Meta:
        model = Application
        fields = [
            "first_name",
            "last_name",
            "date_of_birth",
            "place_of_birth",
            "gender",
            "nationality",
        ]
        widgets = {
            "first_name": forms.TextInput(attrs={
                "class": "block w-full rounded-2xl border border-slate-300 px-4 py-3 text-slate-900 placeholder-slate-400 focus:border-slate-900 focus:outline-none focus:ring-0",
                "placeholder": "Entrez le prénom",
            }),
            "last_name": forms.TextInput(attrs={
                "class": "block w-full rounded-2xl border border-slate-300 px-4 py-3 text-slate-900 placeholder-slate-400 focus:border-slate-900 focus:outline-none focus:ring-0",
                "placeholder": "Entrez le nom",
            }),
            "date_of_birth": forms.DateInput(attrs={
                "class": "block w-full rounded-2xl border border-slate-300 px-4 py-3 text-slate-900 focus:border-slate-900 focus:outline-none focus:ring-0",
                "type": "date",
            }),
            "place_of_birth": forms.TextInput(attrs={
                "class": "block w-full rounded-2xl border border-slate-300 px-4 py-3 text-slate-900 placeholder-slate-400 focus:border-slate-900 focus:outline-none focus:ring-0",
                "placeholder": "Ville ou localité de naissance",
            }),
            "gender": forms.TextInput(attrs={
                "class": "block w-full rounded-2xl border border-slate-300 px-4 py-3 text-slate-900 placeholder-slate-400 focus:border-slate-900 focus:outline-none focus:ring-0",
                "placeholder": "Ex. Masculin / Féminin",
            }),
            "nationality": forms.TextInput(attrs={
                "class": "block w-full rounded-2xl border border-slate-300 px-4 py-3 text-slate-900 placeholder-slate-400 focus:border-slate-900 focus:outline-none focus:ring-0",
                "placeholder": "Nationalité",
            }),
        }


class ContactInfoForm(forms.ModelForm):

    class Meta:
        model = Application
        fields = [
            "phone",
            "email",
            "address",
        ]

        widgets = {
            "phone": forms.TextInput(attrs={
                "class": "w-full rounded-xl border border-slate-300 px-4 py-3",
                "placeholder": "+242 06 000 0000",
            }),
            "email": forms.EmailInput(attrs={
                "class": "w-full rounded-xl border border-slate-300 px-4 py-3",
                "placeholder": "email@example.com",
            }),
            "address": forms.Textarea(attrs={
                "class": "w-full rounded-xl border border-slate-300 px-4 py-3",
                "rows": 3,
                "placeholder": "Adresse complète",
            }),
        }


class ProfessionalInfoForm(forms.ModelForm):
    class Meta:
        model = Application
        fields = [
            "profession",
            "specialization",
            "employer",
            "professional_address",
            "biography",
        ]
        widgets = {
            "profession": forms.TextInput(attrs={
                "class": "w-full rounded-xl border border-slate-300 px-4 py-3",
                "placeholder": "Ex. Ingénieur civil",
            }),
            "specialization": forms.TextInput(attrs={
                "class": "w-full rounded-xl border border-slate-300 px-4 py-3",
                "placeholder": "Ex. Génie informatique",
            }),
            "employer": forms.TextInput(attrs={
                "class": "w-full rounded-xl border border-slate-300 px-4 py-3",
                "placeholder": "Entreprise, cabinet ou organisation",
            }),
            "professional_address": forms.Textarea(attrs={
                "class": "w-full rounded-xl border border-slate-300 px-4 py-3",
                "rows": 3,
                "placeholder": "Adresse professionnelle",
            }),
            "biography": forms.Textarea(attrs={
                "class": "w-full rounded-xl border border-slate-300 px-4 py-3",
                "rows": 5,
                "placeholder": "Présentez votre parcours et vos expériences principales",
            }),
        }


class ApplicationDocumentForm(forms.ModelForm):
    class Meta:
        model = ApplicationDocument
        fields = ["document_type", "file"]
        widgets = {
            "document_type": forms.Select(attrs={
                "class": "w-full rounded-xl border border-slate-300 px-4 py-3 bg-white",
            }),
            "file": forms.ClearableFileInput(attrs={
                "class": "block w-full rounded-xl border border-slate-300 bg-white px-4 py-3 text-sm text-slate-700",
            }),
        }

    def clean_file(self):
        file = self.cleaned_data["file"]
        allowed_extensions = ["pdf", "jpg", "jpeg", "png"]
        ext = file.name.split(".")[-1].lower()
        if ext not in allowed_extensions:
            raise forms.ValidationError("Format de fichier non autorisé.")
        if file.size > 10 * 1024 * 1024:
            raise forms.ValidationError("Le fichier dépasse 10 Mo.")
        return file
# adhesions/choices.py

from django.db import models


class ApplicationType(models.TextChoices):
    NATIONAL = "NATIONAL", "National"
    FOREIGNER = "FOREIGNER", "Étranger"
    COMPANY = "COMPANY", "Entreprise"


class ApplicationStatus(models.TextChoices):
    DRAFT = "DRAFT", "Brouillon"
    SUBMITTED = "SUBMITTED", "Soumis"
    INCOMPLETE = "INCOMPLETE", "Incomplet"
    UNDER_REVIEW = "UNDER_REVIEW", "En vérification"
    PENDING_COMMISSION = "PENDING_COMMISSION", "En commission"
    APPROVED = "APPROVED", "Approuvé"
    REJECTED = "REJECTED", "Rejeté"
    REGISTERED = "REGISTERED", "Inscrit"

class OICGroup(models.TextChoices):
    CANDIDATE = "OIC_CANDIDATE", "Candidat"
    ADMIN = "OIC_ADMIN", "OIC Admin"
    REVIEWER = "OIC_REVIEWER", "OIC Reviewer"
    SUPERVISOR = "OIC_SUPERVISOR", "OIC Supervisor"

class DocumentType(models.TextChoices):
    PHOTO = "PHOTO", "Photo d'identité"
    ID_CARD = "ID_CARD", "Carte d'identité"
    PASSPORT = "PASSPORT", "Passeport"
    DIPLOMA = "DIPLOMA", "Diplôme"
    NATIONALITY_CERTIFICATE = "NATIONALITY_CERTIFICATE", "Certificat de nationalité"
    CRIMINAL_RECORD = "CRIMINAL_RECORD", "Casier judiciaire"
    CV = "CV", "CV"
    EMPLOYMENT_CERTIFICATE = "EMPLOYMENT_CERTIFICATE", "Attestation d'emploi"
    OTHER = "OTHER", "Autre"


class DocumentStatus(models.TextChoices):
    PENDING = "PENDING", "En attente"
    VALID = "VALID", "Valide"
    INVALID = "INVALID", "Invalide"
# members/services.py
from datetime import timedelta
from django.utils import timezone
import hashlib
from .models import AnnualFee, MemberProfile, MemberAnnualDues, MomoAccessToken
import base64
import uuid
import requests
from django.conf import settings
from django.http import JsonResponse
from django.core.cache import cache

def create_dues_for_year(year: int):
    fee = AnnualFee.objects.get(year=year)
    members = MemberProfile.objects.filter(is_active_member=True)

    created = 0
    for m in members:
        obj, was_created = MemberAnnualDues.objects.get_or_create(
            member=m,
            fee=fee,
            defaults={"amount_due": fee.amount},
        )
        if was_created:
            created += 1
    return created



# members/services/mtn_momo.py
class MtnMomoError(Exception):
    pass


class MtnMomoClient:
    def __init__(self):
        self.base_url = settings.MTN_MOMO_BASE_URL.rstrip("/")
        self.subscription_key = settings.MTN_MOMO_COLLECTION_PRIMARY_KEY
        self.api_user = settings.MTN_MOMO_API_USER
        self.api_key = settings.MTN_MOMO_API_KEY
        self.target_env = settings.MTN_MOMO_TARGET_ENV
        self.callback_url = settings.MTN_MOMO_CALLBACK_URL

    def _common_headers(self):
        return {
            "Ocp-Apim-Subscription-Key": self.subscription_key,
            "X-Target-Environment": self.target_env,
        }
    

    def apiuser(self, url, reference_id, key):
        url = f"{self.base_url}/v1_0/apiuser/{reference_id}/apikey"
        headers = {
            "Cache-Control": "no-cache",
            "Ocp-Apim-Subscription-Key": key
        }
        params = {
            "X-Reference-Id": reference_id
        }    
        try:
            response = requests.post(url, headers=headers)
            try:
                data = response.json()
                apiKey = data["apiKey"]
                return apiKey
            except ValueError:
                data = {"raw_response": response.text}

            return JsonResponse(data, status=response.status_code)

        except Exception as e:
            return JsonResponse({"error": str(e)}, status=500)


    #@csrf_exempt  # (à retirer en production ou remplacer par vérification CSRF)
    def create_momo_user(self, ref_id):

        url = f"{self.base_url}/v1_0/apiuser"
        headers = {
            "Content-Type": "application/json",
            "Cache-Control": "no-cache",
            "X-Reference-Id": ref_id, 
            "Ocp-Apim-Subscription-Key": self.subscription_key
        }
        body = {
            "providerCallbackHost": "string"  # Ton URL callback
        }
        print("URL", url)
        try:
            response = requests.post(url, json=body, headers=headers)

            if (response.status_code==201):
                apikey = self.apiuser(url, ref_id, self.subscription_key)
                #settings.MOMO_CLIENT_ID=ref_id
                #settings.MOMO_CLIENT_SECRET=apikey
            else:
                apikey=""

            return ({'apiuser': ref_id, 'apikey': apikey})
        except Exception as e:
            return ({"error": str(e), "status":500})


    def _token_cache_key(self):
        #return f"momo_access_token_{self.target_env}_{self.api_user}"
        return f"momo_access_token"



    def get_access_token(self, reference_id):
        token_obj = MomoAccessToken.objects.filter(
            provider="mtn_cg",
            api_user=reference_id,
            target_env=self.target_env,
        ).first()
        print ("TOKEN", reference_id, token_obj)
        now = timezone.now()

        if token_obj and token_obj.expires_at > now:
            return token_obj.access_token

        raw = f"{self.api_user}:{self.api_key}".encode("utf-8")
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
                api_user=self.api_user,
                target_env=self.target_env,
            )

        token_obj.access_token = access_token
        token_obj.expires_at = expires_at
        token_obj.save()

        return access_token

    def get_access_tokenOLD(self):
        cache_key = self._token_cache_key()

        token = cache.get(cache_key)

        print ("TOKEN EN CACHE", token, cache_key)
        if token:
            return token


        raw = f"{self.api_user}:{self.api_key}".encode("utf-8")
        auth = base64.b64encode(raw).decode("utf-8")

        url = f"{self.base_url}/collection/token/"
        headers = {
            "Authorization": f"Basic {auth}",
            "Ocp-Apim-Subscription-Key": self.subscription_key,
        }

        response = requests.post(url, headers=headers, timeout=30)

        print ("TOK", response)
        if response.status_code != 200:
            raise MtnMomoError(
                f"Impossible d'obtenir le token MTN: {response.status_code} - {response.text}"
            )

        data = response.json()

        token = data["access_token"]
        expires_in = int(data.get("expires_in", 3600))

        cache.set(cache_key, token, timeout=max(expires_in - 60, 60))

        print ("NOUVEAU TOKEN", token)

        return token
    

    def request_to_pay(self, *, payment, phone_number, payer_message, payee_note):
        url = f"{self.base_url}/collection/v1_0/requesttopay"
        ref_id = str(uuid.uuid4())
        #----------------------------------------------
        # Cas de sandbox
        #---------------------------------------------
        user = self.create_momo_user(ref_id)
        self.api_user=user['apiuser']
        self.api_key=user['apikey']
        #---------------------------------------------
    
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

        # MoMo renvoie souvent 202 Accepted quand la demande est bien reçue
        if response.status_code not in (202, 201):
            raise MtnMomoError(f"Echec requestToPay: {response.status_code} - {response.text}")

        return {
            "reference_id": ref_id,
            "status_code": response.status_code,
            "body": response.text,
        }

    def get_request_status(self, reference_id):


        token = self.get_access_token(reference_id)

        url = f"{self.base_url}/collection/v1_0/requesttopay/{reference_id}"
        headers = {
            **self._common_headers(),
            "Authorization": f"Bearer {token}",
        }

        response = requests.get(url, headers=headers, timeout=30)
        if response.status_code != 200:
            raise MtnMomoError(f"Impossible de lire le statut MTN: {response.status_code} - {response.text}")
        return response.json()
   def get_access_token(self):
        cache_key = self._token_cache_key()

        token = cache.get(cache_key)

        print ("TOKEN EN CACHE", token)
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

        print ("TOK", response.status_code)
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
    
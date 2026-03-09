#!/usr/bin/env bash
set -Eeuo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/backup.env"

CHECK_DB="${1:-$DB_RESTORE_NAME}"

echo "[INFO] Vérification de la base : ${CHECK_DB}"

DB_EXISTS=$(docker exec -e PGPASSWORD="${DB_PASSWORD}" "${POSTGRES_CONTAINER}" \
  psql -U "${DB_USER}" -d postgres -tAc "SELECT 1 FROM pg_database WHERE datname='${CHECK_DB}'")

if [ "${DB_EXISTS}" != "1" ]; then
  echo "[ERROR] La base ${CHECK_DB} n'existe pas."
  exit 1
fi

echo "[INFO] Liste des tables"
docker exec -e PGPASSWORD="${DB_PASSWORD}" "${POSTGRES_CONTAINER}" \
  psql -U "${DB_USER}" -d "${CHECK_DB}" -c "\dt"

echo "[INFO] Vérification de quelques tables applicatives"

docker exec -e PGPASSWORD="${DB_PASSWORD}" "${POSTGRES_CONTAINER}" \
  psql -U "${DB_USER}" -d "${CHECK_DB}" -c "SELECT COUNT(*) AS django_users FROM auth_user;" \
  || true

docker exec -e PGPASSWORD="${DB_PASSWORD}" "${POSTGRES_CONTAINER}" \
  psql -U "${DB_USER}" -d "${CHECK_DB}" -c "SELECT COUNT(*) AS applications_count FROM adhesions_application;" \
  || true

docker exec -e PGPASSWORD="${DB_PASSWORD}" "${POSTGRES_CONTAINER}" \
  psql -U "${DB_USER}" -d "${CHECK_DB}" -c "SELECT COUNT(*) AS documents_count FROM adhesions_applicationdocument;" \
  || true

echo "[OK] Vérification terminée"
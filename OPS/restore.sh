#!/usr/bin/env bash
set -Eeuo pipefail

if [ $# -lt 1 ]; then
  echo "Usage: $0 <dump_file> [restore_db_name]"
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/backup.env"

DUMP_FILE="$1"
RESTORE_DB_NAME="${2:-$DB_RESTORE_NAME}"

if [ ! -f "${DUMP_FILE}" ]; then
  echo "[ERROR] Fichier introuvable : ${DUMP_FILE}"
  exit 1
fi

echo "[INFO] Vérification de l'existence de la base cible : ${RESTORE_DB_NAME}"

DB_EXISTS=$(docker exec -e PGPASSWORD="${DB_PASSWORD}" "${POSTGRES_CONTAINER}" \
  psql -U "${DB_USER}" -d postgres -tAc "SELECT 1 FROM pg_database WHERE datname='${RESTORE_DB_NAME}'")

if [ "${DB_EXISTS}" = "1" ]; then
  echo "[INFO] La base ${RESTORE_DB_NAME} existe déjà, suppression..."
  docker exec -e PGPASSWORD="${DB_PASSWORD}" "${POSTGRES_CONTAINER}" \
    psql -U "${DB_USER}" -d postgres -c "SELECT pg_terminate_backend(pid) FROM pg_stat_activity WHERE datname='${RESTORE_DB_NAME}' AND pid <> pg_backend_pid();"

  docker exec -e PGPASSWORD="${DB_PASSWORD}" "${POSTGRES_CONTAINER}" \
    dropdb -U "${DB_USER}" "${RESTORE_DB_NAME}"
fi

echo "[INFO] Création de la base ${RESTORE_DB_NAME}"
docker exec -e PGPASSWORD="${DB_PASSWORD}" "${POSTGRES_CONTAINER}" \
  createdb -U "${DB_USER}" "${RESTORE_DB_NAME}"

echo "[INFO] Restauration du dump dans ${RESTORE_DB_NAME}"
cat "${DUMP_FILE}" | docker exec -i -e PGPASSWORD="${DB_PASSWORD}" "${POSTGRES_CONTAINER}" \
  pg_restore -U "${DB_USER}" -d "${RESTORE_DB_NAME}" --clean --if-exists

echo "[OK] Restauration terminée dans ${RESTORE_DB_NAME}"
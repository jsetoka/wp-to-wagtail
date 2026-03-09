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

export PGPASSWORD="${DB_PASSWORD}"

echo "[INFO] Suppression base de restauration si elle existe"
dropdb \
  --if-exists \
  -h "${DB_HOST}" \
  -p "${DB_PORT}" \
  -U "${DB_USER}" \
  "${RESTORE_DB_NAME}"

echo "[INFO] Création base de restauration : ${RESTORE_DB_NAME}"
createdb \
  -h "${DB_HOST}" \
  -p "${DB_PORT}" \
  -U "${DB_USER}" \
  "${RESTORE_DB_NAME}"

echo "[INFO] Restauration depuis ${DUMP_FILE}"
pg_restore \
  -h "${DB_HOST}" \
  -p "${DB_PORT}" \
  -U "${DB_USER}" \
  -d "${RESTORE_DB_NAME}" \
  --clean \
  --if-exists \
  "${DUMP_FILE}"

echo "[OK] Restauration terminée dans ${RESTORE_DB_NAME}"
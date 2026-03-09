#!/usr/bin/env bash
set -Eeuo pipefail

if [ $# -lt 1 ]; then
  echo "Usage: $0 <db_name>"
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/backup.env"

CHECK_DB="$1"

export PGPASSWORD="${DB_PASSWORD}"

echo "[INFO] Vérification de la base : ${CHECK_DB}"

psql \
  -h "${DB_HOST}" \
  -p "${DB_PORT}" \
  -U "${DB_USER}" \
  -d "${CHECK_DB}" \
  -c "\dt"

psql \
  -h "${DB_HOST}" \
  -p "${DB_PORT}" \
  -U "${DB_USER}" \
  -d "${CHECK_DB}" \
  -c "SELECT COUNT(*) AS applications_count FROM adhesions_application;"

psql \
  -h "${DB_HOST}" \
  -p "${DB_PORT}" \
  -U "${DB_USER}" \
  -d "${CHECK_DB}" \
  -c "SELECT COUNT(*) AS documents_count FROM adhesions_applicationdocument;"

echo "[OK] Vérification terminée"
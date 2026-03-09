#!/usr/bin/env bash
set -Eeuo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/backup.env"

TIMESTAMP="$(date +%F_%H-%M-%S)"
DB_BACKUP_DIR="${BACKUP_DIR}/db"
LOG_DIR="${BACKUP_DIR}/logs"
BACKUP_FILE="${DB_BACKUP_DIR}/${APP_NAME}_${DB_NAME}_${TIMESTAMP}.dump"

mkdir -p "${DB_BACKUP_DIR}" "${LOG_DIR}"

export PGPASSWORD="${DB_PASSWORD}"

echo "[INFO] Début backup PostgreSQL : ${DB_NAME}"
pg_dump \
  -h "${DB_HOST}" \
  -p "${DB_PORT}" \
  -U "${DB_USER}" \
  -d "${DB_NAME}" \
  -Fc \
  -f "${BACKUP_FILE}"

echo "[INFO] Backup créé : ${BACKUP_FILE}"

echo "[INFO] Nettoyage des backups > ${RETENTION_DAYS} jours"
find "${DB_BACKUP_DIR}" -type f -name "*.dump" -mtime +"${RETENTION_DAYS}" -delete

echo "[OK] Backup PostgreSQL terminé"
#!/usr/bin/env bash
set -Eeuo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/backup.env"

TIMESTAMP="$(date +%F_%H-%M-%S)"
DB_BACKUP_DIR="${BACKUP_DIR}/db"
LOG_DIR="${BACKUP_DIR}/logs"
BACKUP_FILE="${DB_BACKUP_DIR}/${APP_NAME}_${DB_NAME}_${TIMESTAMP}.dump"

mkdir -p "${DB_BACKUP_DIR}" "${LOG_DIR}"

echo "[INFO] Début backup PostgreSQL : ${DB_NAME}"

docker exec \
  -e PGPASSWORD="${DB_PASSWORD}" \
  "${DB_RESTORE_NAME:-postgres-db}" \
  pg_dump \
    -U "${DB_USER}" \
    -d "${DB_NAME}" \
    -Fc \
> "${BACKUP_FILE}"

echo "[INFO] Backup créé : ${BACKUP_FILE}"

echo "[INFO] Nettoyage des backups > ${RETENTION_DAYS} jours"
find "${DB_BACKUP_DIR}" -type f -name "*.dump" -mtime +"${RETENTION_DAYS}" -delete

echo "[OK] Backup PostgreSQL terminé"
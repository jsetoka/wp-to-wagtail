#!/usr/bin/env bash
set -Eeuo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/backup.env"

TIMESTAMP="$(date +%F_%H-%M-%S)"
MEDIA_BACKUP_DIR="${BACKUP_DIR}/media"
ARCHIVE_FILE="${MEDIA_BACKUP_DIR}/${APP_NAME}_media_${TIMESTAMP}.tar.gz"

mkdir -p "${MEDIA_BACKUP_DIR}"

if [ ! -d "${MEDIA_DIR}" ]; then
  echo "[WARN] MEDIA_DIR introuvable : ${MEDIA_DIR}"
  exit 0
fi

echo "[INFO] Début backup des médias : ${MEDIA_DIR}"
tar -czf "${ARCHIVE_FILE}" -C "$(dirname "${MEDIA_DIR}")" "$(basename "${MEDIA_DIR}")"

echo "[INFO] Archive créée : ${ARCHIVE_FILE}"

echo "[INFO] Nettoyage des archives médias > ${RETENTION_DAYS} jours"
find "${MEDIA_BACKUP_DIR}" -type f -name "*.tar.gz" -mtime +"${RETENTION_DAYS}" -delete

echo "[OK] Backup médias terminé"
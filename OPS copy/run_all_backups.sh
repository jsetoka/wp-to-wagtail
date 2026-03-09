#!/usr/bin/env bash
set -Eeuo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"${SCRIPT_DIR}/backup.sh"
"${SCRIPT_DIR}/backup_media.sh"

echo "[OK] Tous les backups sont terminés"
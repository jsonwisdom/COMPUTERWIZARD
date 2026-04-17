#!/bin/bash
set -euo pipefail

OUTPUT_FILE="web/verify.json"
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

echo "Executing Internal and External Audits..."

[ -f "README.md" ] && T1_INTENT="PASS" || T1_INTENT="FAIL"

bash verify.sh > /dev/null 2>&1 && T2_DIGEST="PASS" || T2_DIGEST="FAIL"
bash verify_signature.sh > /dev/null 2>&1 && T3_ATTESTATION="PASS" || T3_ATTESTATION="FAIL"

if [ "$T3_ATTESTATION" = "PASS" ]; then
  AUDIT_PATH="STABLE"
else
  AUDIT_PATH="UNRESOLVED"
fi

ROOT_HASH=$(sha256sum README.md 2>/dev/null | awk '{print $1}' || echo "UNKNOWN")
SIGNER_ID=$(python3 - <<'PY'
import json
try:
    with open("receipts/002_attestation.json", "r", encoding="utf-8") as f:
        data = json.load(f)
    print(data.get("attestation", {}).get("signer_id", "UNKNOWN"))
except Exception:
    print("UNKNOWN")
PY
)

cat > "$OUTPUT_FILE" <<JSON
{
  "node": "WAITE_PARK_ANCHOR",
  "operator": "Jason Wisdom",
  "last_audit_utc": "$TIMESTAMP",
  "integrity_mesh": {
    "t1_intent": "$T1_INTENT",
    "t2_digest": "$T2_DIGEST",
    "t3_attestation": "$T3_ATTESTATION",
    "external_audit_path": "$AUDIT_PATH"
  },
  "proof": {
    "root_hash": "$ROOT_HASH",
    "signer_id": "$SIGNER_ID",
    "verifier_version": "v1.3-mechanical-derivation"
  }
}
JSON

echo "✅ Mechanical Truth generated at $OUTPUT_FILE (Status: $T3_ATTESTATION)"

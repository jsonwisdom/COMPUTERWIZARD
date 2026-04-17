#!/bin/bash
# COMPUTERWIZARD: External Signature Auditor (T3 Cryptographic Proof)
# Motto: Build. Seal. Verify. Repeat.

set -euo pipefail

echo "--- [ SIM CRYPTOGRAPHIC AUDIT: START ] ---"

ATTESTATION_FILE="receipts/002_attestation.json"
DIGEST_HEX="3aaafd62fe33df746988306ae60050112268974c765dc67f467615a9a162004b"
PUB_KEY="keys/kms_public.pem"
TMP_DIGEST=".digest.bin"
TMP_SIGNATURE=".signature.bin"

cleanup() {
  rm -f "$TMP_DIGEST" "$TMP_SIGNATURE"
}
trap cleanup EXIT

if [[ ! -f "$ATTESTATION_FILE" ]]; then
  echo "❌ AUDIT FAILURE: Attestation receipt missing."
  exit 1
fi

SIGNATURE_B64=$(python3 - <<'PY'
import json
with open("receipts/002_attestation.json", "r", encoding="utf-8") as f:
    data = json.load(f)
sig = data.get("attestation", {}).get("signature")
print(sig if sig else "")
PY
)

if [[ -z "$SIGNATURE_B64" ]]; then
  echo "❌ AUDIT FAILURE: No signature found in receipt."
  exit 1
fi

if [[ ! -f "$PUB_KEY" ]]; then
  echo "⚠️  AUDIT NOTE: KMS Public Key not found at $PUB_KEY."
  echo "   Instruction: Export public key from WAITE_PARK_ANCHOR_KMS_01 to continue."
  exit 1
fi

python3 - <<'PY'
import binascii
h = "3aaafd62fe33df746988306ae60050112268974c765dc67f467615a9a162004b"
with open(".digest.bin", "wb") as f:
    f.write(binascii.unhexlify(h))
PY

printf '%s' "$SIGNATURE_B64" | base64 -d > "$TMP_SIGNATURE"

echo "Executing OpenSSL PSS verification..."
if openssl pkeyutl -verify -pubin -inkey "$PUB_KEY" \
  -sigfile "$TMP_SIGNATURE" -in "$TMP_DIGEST" \
  -pkeyopt rsa_padding_mode:pss \
  -pkeyopt rsa_pss_saltlen:-1 \
  -pkeyopt digest:sha256; then
  echo "✅ T3 VERIFIED: KMS signature is authentic and matches the Genesis Digest."
else
  echo "❌ T3 FAILURE: Signature invalid or tampered."
  exit 1
fi

echo "--- [ AUDIT COMPLETE: EXTERNAL PROOF VALIDATED ] ---"

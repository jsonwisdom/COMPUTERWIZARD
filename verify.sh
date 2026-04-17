#!/bin/bash
# COMPUTERWIZARD: Automated Integrity Verifier (Phase 1: Bootstrap)
# Motto: Build. Seal. Verify. Repeat.

set -euo pipefail

echo "--- [ SIM VERIFICATION: BOOTSTRAP START ] ---"

# 1. T2 CHECK: README INTEGRITY
EXPECTED_HASH="3aaafd62fe33df746988306ae60050112268974c765dc67f467615a9a162004b"
ACTUAL_HASH=$(sha256sum README.md | awk '{print $1}')

if [ "$ACTUAL_HASH" != "$EXPECTED_HASH" ]; then
    echo "❌ T2 FAILURE: README.md content drift detected."
    exit 1
fi
echo "✅ T2: README.md hash matches cryptographic anchor."

# 2. T3 CHECK: ATTESTATION STATE
ATTESTATION_FILE="receipts/002_attestation.json"
if [[ -f "$ATTESTATION_FILE" ]]; then
    # Verify status is exactly "ATTESTED"
    if grep -q '"status": "ATTESTED"' "$ATTESTATION_FILE"; then
        echo "✅ T3: Hardware attestation receipt is SEALED."
    else
        echo "❌ T3 FAILURE: Attestation exists but is NOT in ATTESTED state."
        exit 1
    fi
else
    echo "❌ T3 FAILURE: Attestation receipt missing."
    exit 1
fi

# 3. L2 CHECK: LEDGER CONTINUITY (SEARCH FOR CRITICAL MILESTONES)
LEDGER="ledgers/system_events.jsonl"
if grep -q "T2_VERIFICATION_COMPLETE" "$LEDGER" && grep -q "T3_ATTESTATION_COMPLETE" "$LEDGER"; then
    echo "✅ L2: Ledger contains verified T2 and T3 completion events."
else
    echo "❌ L2 FAILURE: Ledger sequence incomplete."
    exit 1
fi

echo "--- [ VERIFICATION SUCCESS: BOOTSTRAP COMPLETE ] ---"

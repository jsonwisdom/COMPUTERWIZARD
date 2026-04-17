# ARCHITECTURE: The Sovereign Intelligence Mesh (SIM)

## 1. CORE PHILOSOPHY
This system operates on **Thermodynamic Zero-Trust**. No state change is valid without a verifiable receipt and a linearized ledger entry.

## 2. THE RECEIPT STACK (T1-T4)
All system mutations follow a progressive hardening lifecycle:
* **T1 (Intent)**: A claim of change (e.g., `receipts/001_genesis.json`).
* **T2 (Verification)**: A local `sha256sum` hash update.
* **T3 (Attestation)**: A hardware-bound signature (FIDO2/KMS).
* **T4 (Seal)**: Multi-signature consensus or long-term archival lock.

## 3. LEDGER DISCIPLINE
The `ledgers/system_events.jsonl` is the **Single Source of Continuity**.
* **Append-Only**: No line may ever be deleted or modified.
* **Git-Bound**: Every ledger entry must reference a Git Commit SHA to link logical events to physical code state.
* **Multi-Witness**: Entries may originate from various agents (Operator, AI-1, AI-2) but must adhere to the shared JSON schema.

## 4. VERIFICATION PIPELINE
1. **Event**: Action triggered in the repository.
2. **Hash**: Generate SHA-256 of the affected files.
3. **Receipt**: Create or update `.json` proof in `/receipts`.
4. **Append**: Record the event in `ledgers/system_events.jsonl`.
5. **Sync**: Commit with the current GitHub SHA to ensure linear history.

## 5. OPERATOR BOUNDARIES
* **Operator (Jason Wisdom)**: The Sovereign. Final authority on policy and high-protection keys.
* **AI Collaborators**: Narrative engineers and system auditors. Authorized to append to the ledger and propose receipts but cannot "Seal" T4 assets.

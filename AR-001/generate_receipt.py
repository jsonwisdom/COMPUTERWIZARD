#!/usr/bin/env python3
import hashlib
import json


def canonicalize(data: dict) -> bytes:
    """Recursively canonicalize a dictionary to deterministic UTF-8 JSON bytes."""
    return json.dumps(
        data,
        ensure_ascii=False,
        sort_keys=True,
        separators=(",", ":"),
    ).encode("utf-8")


def build_ar001_receipt(
    tool_name: str,
    inputs: dict,
    outputs: dict,
    context: dict,
) -> dict:
    payload = {
        "schema_version": "v0.2",
        "tool": tool_name,
        "context": context,
        "inputs": inputs,
        "outputs": outputs,
    }

    canonical_bytes = canonicalize(payload)
    content_hash = hashlib.sha256(canonical_bytes).hexdigest()

    return {
        "receipt_id": content_hash,
        "content_hash": f"sha256:{content_hash}",
        **payload,
    }


if __name__ == "__main__":
    sample_inputs = {
        "path": "./examples/fixture.wasm",
        "mode": "inspection",
    }
    sample_outputs = {
        "status": "ok",
        "sections_count": 4,
    }
    sample_context = {
        "env": "test-harness",
        "arch": "x86_64",
    }

    receipt = build_ar001_receipt(
        tool_name="wasm-loader",
        inputs=sample_inputs,
        outputs=sample_outputs,
        context=sample_context,
    )

    verification_payload = {
        key: value
        for key, value in receipt.items()
        if key not in ("receipt_id", "content_hash")
    }
    recomputed_hash = hashlib.sha256(
        canonicalize(verification_payload)
    ).hexdigest()

    assert recomputed_hash == receipt["receipt_id"], (
        "ED-001 integrity failure: hash mismatch!"
    )
    assert receipt["content_hash"] == f"sha256:{recomputed_hash}", (
        "ED-001 integrity failure: content_hash mismatch!"
    )

    out_path = "receipt.v1.json"
    with open(out_path, "w", encoding="utf-8") as file:
        json.dump(receipt, file, indent=2, sort_keys=True)
        file.write("\n")

    print("[✓] Self-Verification Passed.")
    print(f"[+] Output: {out_path}")
    print(f"[+] SHA-256 Digest: {receipt['content_hash']}")

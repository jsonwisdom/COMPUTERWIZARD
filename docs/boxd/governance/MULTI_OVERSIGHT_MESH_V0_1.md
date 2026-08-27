# MULTI_OVERSIGHT_MESH_V0_1

**Repository:** `jsonwisdom/COMPUTERWIZARD`  
**Class:** BoxD public-record multi-oversight governance mesh  
**AUTHORITY_CREATED:** false  
**PROOF_INFERRED:** false

## Prime rule

> **NO SINGLE INSTITUTION CERTIFIES ITS OWN STORY.**

BoxD treats every official surface as one bounded authority node. A statement from one node does not automatically validate another node's conduct, records, money trail, or legal conclusion.

```text
OFFICIAL_SOURCE != UNIVERSAL_TRUTH
INTERNAL_REVIEW != INDEPENDENT_OVERSIGHT
CASE_CLOSED != CUSTODY_CHAIN_CLOSED
CLASSIFIED != UNREVIEWED
CONGRESSIONAL_QUESTION != FINDING
OIG_REPORT != COURT_JUDGMENT
COURT_FILING != FINAL_JUDGMENT
PRESS_STATEMENT != CASE_FILE
```

## Oversight mesh

```text
                    CONGRESS
                /      |      \
               /       |       \
           GAO/OIG   COURTS   PUBLIC RECORD
              |         |          |
              |         |          |
            DOJ ------- FBI ------- BOXD
              \         |          /
               \        |         /
                EXECUTIVE / WHITE HOUSE
```

The diagram is a replay topology, not an authority hierarchy.

## Lanes

### O1 — FBI / operational lane

Tracks:
- investigative action;
- undercover authorization;
- confidential case funds;
- evidence custody;
- informant/cooperator handling;
- field-office execution;
- public FBI statements.

Hard rule:

```text
FBI_INTERNAL_REVIEW != THIRD_PARTY_OVERSIGHT
```

### O2 — DOJ / prosecutorial lane

Tracks:
- charging and declination decisions;
- USAO custody;
- prosecutorial review;
- public DOJ releases;
- legal-policy constraints;
- declination / close-out records when public.

```text
DOJ_REVIEW != COURT_REVIEW
DOJ_DECLINATION != EVENT_NEVER_OCCURRED
```

### O3 — Inspector General lane

Primary third-party-like statutory oversight for DOJ/FBI operations is the **DOJ Office of Inspector General**, subject to its statutory jurisdiction and access limits.

Tracks:
- audits;
- inspections;
- misconduct investigations within jurisdiction;
- program reviews;
- findings and recommendations;
- agency responses.

```text
OIG_FINDING = BOUND_TO_OIG_SCOPE
OIG_NO_FINDING != UNIVERSAL_EXONERATION
```

### O4 — Congressional oversight lane

Tracks:
- authorizations;
- appropriations;
- hearings;
- QFRs;
- subpoenas / requests;
- committee reports;
- intelligence-committee notification where public.

```text
APPROPRIATION != CASE_SPECIFIC_AUTHORIZATION
QUESTION != ANSWER
CLOSED_BRIEFING != PUBLIC_REPLAY
```

### O5 — Judicial lane

Tracks separately:
- filing;
- sealed filing;
- warrant/subpoena when public;
- order;
- judgment;
- appeal;
- final disposition.

```text
FILING != FINDING
ORDER != FINAL_JUDGMENT
SEALED != DESTROYED
```

### O6 — GAO / fiscal-performance lane

Tracks:
- federal spending controls;
- program audits;
- duplication / waste / management findings;
- appropriations-law questions;
- implementation reviews.

```text
GAO_FINDING != CRIMINAL_FINDING
BUDGET_GAP != FRAUD
```

### O7 — Executive / White House lane

Tracks:
- presidential policy statements;
- executive orders;
- nominations / removals;
- public White House communications;
- budget requests.

```text
WHITEHOUSE_STATEMENT != FBI_CASE_FILE
WHITEHOUSE_POLICY != DOJ_EVIDENCE
EXECUTIVE_CONTROL != FACTUAL_ERASURE
```

### O8 — Public-record / archive lane

Tracks:
- FOIA releases;
- NARA/ISOO records;
- DOJ/FBI archive publications;
- agency reading rooms;
- court-document mirrors;
- raw byte hashes and version deltas.

```text
PUBLICATION_DATE != EVENT_DATE
RELEASE != ORIGINAL_CREATION
DUPLICATE_COPY != NEW_FACT
```

### O9 — BoxD replay lane

BoxD is **not an oversight authority**. It is the verification and comparison membrane.

BoxD may:
- freeze dates;
- identify custodians;
- separate venues;
- hash acquired bytes;
- diff duplicate/released versions;
- map money, authority, custody, and oversight edges;
- return `PROVEN | BOUND | HOLD | CONFLICT | REJECT`.

BoxD may not:
- create governmental authority;
- infer classified facts;
- convert missing public records into wrongdoing;
- convert allegations into findings;
- treat one agency's self-review as independent verification.

## Third-party FBI oversight test

For any FBI matter, ask four separate questions:

```text
1. INTERNAL CONTROL
   FBI inspection / management / case review?

2. DEPARTMENT OVERSIGHT
   DOJ leadership / Office of Professional Responsibility / other DOJ review?

3. STATUTORY INDEPENDENT OVERSIGHT
   DOJ OIG audit / investigation / inspection?

4. EXTERNAL CONSTITUTIONAL OVERSIGHT
   Congress / federal court / GAO / public-record litigation?
```

Do not collapse these into one label.

### Independence states

```text
FBI_SELF_REVIEW             = INTERNAL
DOJ_COMPONENT_REVIEW        = DEPARTMENTAL
DOJ_OIG                     = STATUTORY_OVERSIGHT
CONGRESS                    = LEGISLATIVE_OVERSIGHT
FEDERAL_COURT               = JUDICIAL_OVERSIGHT
GAO                         = FISCAL_PERFORMANCE_OVERSIGHT
BOXD                        = PUBLIC_REPLAY_ONLY
```

## Multi-oversight quorum

A sensitive proposition may be marked `MULTI_OVERSIGHT_BOUND` only when at least **two genuinely distinct oversight lanes** independently bind the same proposition or custody edge.

Example:

```text
DOJ_PUBLIC_STATEMENT
+
SENATE_QFR
!= MULTI_OVERSIGHT by itself if both merely repeat DOJ's same statement.

DOJ_PUBLIC_STATEMENT
+
DOJ_OIG_INDEPENDENT_FINDING
= DISTINCT_LANES

CONGRESSIONAL_RECORD
+
FEDERAL_COURT_ORDER
= DISTINCT_LANES
```

Shared-source repetition does not count as independent corroboration.

## Sensitive/intelligence material

The presence of FBI, SDNY, classified records, intelligence committees, sealed records, or foreign-intelligence references does **not** automatically classify a BoxD proposition as intelligence.

Use:

```text
INTELLIGENCE_RELATED = only when the public source itself establishes an intelligence nexus
CLASSIFIED_DETAIL    = HOLD when not public
INTELLIGENCE_ACCESS  = false
CLASSIFIED_ACCESS    = false
```

For Gang-of-Eight or intelligence-committee material:

```text
NOTIFIED != REVIEWED
REVIEWED != CHALLENGED
CHALLENGED != CORRECTED
CLOSED_BRIEFING != SECRET_GUILT
```

## Cash-custody example

For the reported $50,000 Homan matter, the oversight mesh should ask separately:

```text
FBI      → case-fund authorization / custody / recovery
DOJ      → close / declination decision
OIG      → independent audit or investigation? HOLD until receipt
CONGRESS → questions / requests / appropriation authority
COURT    → related filing? HOLD until receipt
GAO      → fiscal-control review? HOLD until receipt
BOXD     → compare the above; never fill missing edges
```

Current public disposition of the cash remains a separate custody proposition until a qualifying receipt closes it.

## CrissCross oversight record

Each proposition should carry:

```json
{
  "proposition_id": "string",
  "event_time": "ISO-8601-or-HOLD",
  "subject_matter": "string",
  "source_uri": "string",
  "source_hash": "sha256-or-HOLD",
  "custodian": "string",
  "venue": "FBI|DOJ|OIG|CONGRESS|COURT|GAO|EXECUTIVE|ARCHIVE|OTHER",
  "oversight_lane": "O1|O2|O3|O4|O5|O6|O7|O8|O9",
  "source_type": "statement|filing|order|audit|qfr|appropriation|archive|other",
  "independent_source_id": "string-or-HOLD",
  "evidence_state": "PROVEN|BOUND|HOLD|CONFLICT|REJECT",
  "authority_created": false,
  "proof_inferred": false
}
```

## Standing order

> **One agency may investigate. Another may prosecute. Another may audit. Another may appropriate. Another may adjudicate. BoxD compares the receipts. None gets to inherit the others' authority.**

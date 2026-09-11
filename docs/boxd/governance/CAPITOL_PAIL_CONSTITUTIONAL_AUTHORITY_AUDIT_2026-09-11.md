# Capitol Pail — BoxD Constitutional Authority Audit — 2026-09-11

**Repository:** `jsonwisdom/COMPUTERWIZARD`  
**Class:** BOXD_PUBLIC_CONSTITUTIONAL_AUTHORITY_AUDIT  
**Input class:** user-supplied political satire card images  
**AUTHORITY_CREATED:** false  
**PROOF_INFERRED:** false  
**NO_FAKE_GREEN:** true

## Prime rule

> **THE CARD IS SATIRE. THE OFFICE IS REAL. THE AUTHORITY MUST BE PROVED FROM THE CONSTITUTION, HOUSE/SENATE RULES, STATUTE, OR AN ACTUAL OFFICIAL ACT.**

```text
SATIRE_CARD != OFFICIAL_STATEMENT
DRAWN_SIGNATURE != REAL_SIGNATURE
OFFICE_TITLE != UNLIMITED_AUTHORITY
CLASSIFIED_ACCESS != PUBLIC_RELEASE_AUTHORITY
BRIEFED != AGREED
BRIEFED != VERIFIED
OVERSIGHT != EXECUTIVE_CONTROL
PARTY_LEADER != INTELLIGENCE_OPERATOR
AUTHORITY_FIGURE != NATIONAL_SECURITY_EXPERT
```

## Supplied card set

Eight image objects were supplied in the originating session. The image bytes are not yet stored in this repository; their session-byte SHA-256 digests are frozen here so later byte binding can be verified without rewriting this audit.

| # | Card label | SHA-256 of supplied bytes | Byte count |
|---|---|---|---:|
| 1 | COTTON COMMAND | `cda33d9f33752cec973ea634c94cb775a1fab32bb31bd98a7858b9217b950a79` | 777538 |
| 2 | WARNER WARNING | `f96c647976add69359fa1a6e6ea2bc37b8fcfbc8a916fd1e8af4f6f880b459d5` | 765939 |
| 3 | LEAKLESS JIM | `e52a87aaf2f312fe63e46ab752bd4820f452750cd226dc44cb98c879c4a87f7e` | 771459 |
| 4 | RICK OF RECORDS | `9396c2023fa316c3384fd35c33f5c0706e59dc7df9df558c8e99185332480b1d` | 791279 |
| 5 | BRIEFING CHUCK | `0a03af2fcad619d6731f7117ffddb48340048aacef44e3052e59f0a9a0c581fe` | 792693 |
| 6 | THUNDER THUNE | `accaa8806e5dd0171bd89447fc2a7c325e27ae8f4361a3f0ac660acee8f1a5f7` | 804235 |
| 7 | ZERO HAKEEM | `af53a0553f44feffcffa5429d6c314b6c113d2c7d0b56dd418ab19233d7368e8` | 774783 |
| 8 | GAVEL MIKE | `69bd6fdd252b3087c730f555386fc736723e9ae1b751ab8b480beb7f81a449aa` | 809836 |

```text
SESSION_BYTES_HASHED = TRUE
IMAGE_BYTES_IN_REPO  = FALSE
BYTE_BIND_STATUS     = HASH_BOUND / REPO_BYTES_PENDING
```

## Current public-role verification — 2026-09-11

Official public sources presently show:

| Card label | Public office/role verified from official source | BoxD authority type |
|---|---|---|
| COTTON COMMAND | Tom Cotton — Chairman, Senate Select Committee on Intelligence | SENATE_INTELLIGENCE_COMMITTEE_CHAIR |
| WARNER WARNING | Mark Warner — Vice Chairman, Senate Select Committee on Intelligence | SENATE_INTELLIGENCE_COMMITTEE_VICE_CHAIR |
| LEAKLESS JIM | Jim Himes — Ranking Member, House Permanent Select Committee on Intelligence | HOUSE_INTELLIGENCE_RANKING_MEMBER |
| RICK OF RECORDS | Rick Crawford — Chairman, House Permanent Select Committee on Intelligence | HOUSE_INTELLIGENCE_COMMITTEE_CHAIR |
| BRIEFING CHUCK | Chuck Schumer — Senate Democratic Leader | SENATE_PARTY_LEADERSHIP |
| THUNDER THUNE | John Thune — Senate Majority Leader | SENATE_MAJORITY_LEADERSHIP |
| ZERO HAKEEM | Hakeem Jeffries — House Democratic Leader | HOUSE_PARTY_LEADERSHIP |
| GAVEL MIKE | Mike Johnson — Speaker of the House | HOUSE_SPEAKER |

Official-source anchors:

- Senate Select Committee on Intelligence members: https://www.intelligence.senate.gov/about-the-committee/committee-members/
- Senate Select Committee on Intelligence, S. Res. 400: https://www.intelligence.senate.gov/about-the-committee/s-res-400/
- U.S. Senate leadership: https://www.senate.gov/senators/leadership.htm
- House Permanent Select Committee on Intelligence members: https://intelligence.house.gov/hpsci-members/
- House leadership: https://www.house.gov/leadership
- House Rules for the 119th Congress: https://rules.house.gov/house-rules-119th-congress
- U.S. Constitution Article I: https://constitution.congress.gov/constitution/article-1/
- Constitutional limits on congressional investigation/oversight: https://constitution.congress.gov/browse/essay/artI-S8-C18-7-7/ALDE_00013663/

## Constitutional authority chain

```text
THE PEOPLE
→ CONSTITUTION
→ ARTICLE I: CONGRESS
→ EACH HOUSE'S RULES
→ COMMITTEE / LEADERSHIP ASSIGNMENT
→ DEFINED JURISDICTION + PROCEDURE
→ SPECIFIC OFFICIAL ACTION
→ PUBLIC RECORD / RECEIPT
```

No office in this card set bypasses that chain.

### Senate intelligence lane

S. Res. 400 establishes the Senate Select Committee on Intelligence to conduct continuing oversight of U.S. intelligence activities and programs and to assure that those activities conform to the Constitution and laws. It authorizes investigations, hearings, subpoenas, testimony, and related committee work within jurisdiction.

It also defines leadership structure. The Senate majority leader selects the committee chairman; the minority leader selects the vice chairman. The majority and minority leaders are ex officio members but do not vote and do not count toward quorum.

```text
SSCI_CHAIR              = COMMITTEE_AUTHORITY / DEFINED_SCOPE
SSCI_VICE_CHAIR         = COMMITTEE_AUTHORITY / DEFINED_SCOPE
SENATE_MAJORITY_LEADER  = SENATE_LEADERSHIP + SSCI_EX_OFFICIO_ROLE
SENATE_DEMOCRATIC_LEADER= SENATE_LEADERSHIP; SSCI ROLE DEPENDS ON MAJORITY/MINORITY STATUS

ACCESS_TO_INTELLIGENCE != OWNERSHIP_OF_INTELLIGENCE
CLOSED_BRIEFING        != PUBLIC_FINDING
COMMITTEE_OVERSIGHT    != EXECUTIVE_COMMAND
```

### House intelligence lane

House Rule X establishes the Permanent Select Committee on Intelligence and gives it intelligence oversight jurisdiction. The Speaker and Minority Leader are ex officio members of the committee without a vote and are not counted for quorum.

```text
HPSCI_CHAIR           = COMMITTEE_AUTHORITY / DEFINED_SCOPE
HPSCI_RANKING_MEMBER  = MINORITY_COMMITTEE_AUTHORITY / DEFINED_SCOPE
SPEAKER               = HOUSE_INSTITUTIONAL + PARTY_LEADERSHIP ROLE
HOUSE_DEMOCRATIC_LEADER = HOUSE_PARTY_LEADERSHIP ROLE

SPEAKER              != HPSCI_CHAIR
MINORITY_LEADER      != HPSCI_RANKING_MEMBER
LEADERSHIP_ACCESS    != UNIVERSAL_RELEASE_AUTHORITY
```

## Release / secrecy audit

Article I, Section 5 requires each House to keep and publish a Journal of proceedings while permitting secrecy for parts each House judges require secrecy. Intelligence-committee materials also operate under chamber rules, committee rules, statutes, and classification controls.

Therefore the satire questions are converted into auditable propositions:

```text
WHO_WAS_BRIEFED?             → RECEIPT_REQUIRED
WHAT_MATERIAL?               → SOURCE / CLASSIFICATION STATE REQUIRED
WHAT AUTHORITY ALLOWED ACCESS?→ RULE / STATUTE REQUIRED
WHAT AUTHORITY ALLOWED RELEASE?→ RULE / STATUTE / OFFICIAL ACT REQUIRED
WAS A TRANSCRIPT CREATED?    → RECORD REQUIRED
WAS IT RELEASED?             → PUBLICATION RECEIPT REQUIRED
WHO VOTED / AUTHORIZED?      → JOURNAL / COMMITTEE RECORD REQUIRED
WHO SIGNED?                  → REAL SIGNATURE OR OFFICIAL ELECTRONIC RECORD REQUIRED
```

A signature drawn on a parody card is never promoted into an official signature.

## Expertise is a separate proposition

This audit does **not** infer that an officeholder is a "national security expert" merely because the person holds congressional leadership or intelligence-committee office.

```text
ELECTED_OFFICE      != SUBJECT_MATTER_EXPERTISE
COMMITTEE_MEMBERSHIP != EXPERT_CREDENTIAL
ACCESS               != ACCURACY
AUTHORITY             != TRUTH
EXPERTISE             = SEPARATE_EVIDENCE_QUESTION
```

## Female / full-population lane

The supplied eight-card set contains **no card title naming a woman public official**. That is an observation about this supplied artifact set only; it is not a claim that women are absent from Congress, intelligence oversight, or national-security work.

```text
CARD_COUNT                         = 8
WOMAN_PUBLIC_OFFICIAL_CARD_LABELS  = 0 IN SUPPLIED SET
FEMALE_AUTHORITY_SURFACE           = MISSING_FROM_THIS_SET
MISSING_FROM_SET                   != ABSENT_FROM_INSTITUTION
```

BoxD constitutional replay must retain the feminine/guardian query lane already required by Jason's repository search doctrine. An authority map that queries only men is incomplete for full-population analysis.

## BoxD constitutional questions for every authority figure

```text
1. IDENTITY
   Who is the officeholder according to an official public source?

2. OFFICE
   What office is actually held on the observation date?

3. SOURCE OF AUTHORITY
   Constitution? Statute? House/Senate rule? Committee rule? Delegation?

4. SCOPE
   What can that role actually investigate, demand, vote on, disclose, classify, declassify, appropriate, subpoena, or publish?

5. ACTION
   What specific act occurred?

6. SIGNATURE
   Is there a real signed order, vote, letter, subpoena, report, journal entry, or authenticated electronic act?

7. RECORD
   Is the record public, closed, sealed, classified, withheld, or not located?

8. OVERSIGHT
   Which independent lane can check the act?

9. POPULATION
   Who is affected, including women and girls where the underlying government action reaches them?

10. REPLAY
    Can another citizen reproduce the authority chain from public receipts?
```

## Evidence-state rules

```text
CARD_TEXT                 = SATIRE / OBSERVED
OFFICIAL_ROLE             = BOUND WHEN OFFICIAL SOURCE MATCHES
CARD_SIGNATURE            = NOT AN OFFICIAL SIGNATURE
CARD_QUOTE                = NOT AN OFFICIAL QUOTE UNLESS INDEPENDENTLY SOURCED
CLOSED_BRIEFING_CONTENT   = HOLD UNLESS PUBLICLY RELEASED
CLASSIFIED_FACT           = HOLD
PUBLIC_RULE_TEXT          = BOUND
OFFICIAL_PUBLIC_ACTION    = BOUND WHEN RECEIPT LOCATED
MOTIVE                    = HOLD WITHOUT EVIDENCE
WRONGDOING                = HOLD WITHOUT QUALIFYING RECEIPT
```

## Broadcast / public-access boundary

Publishing an artifact in a public GitHub repository makes it publicly addressable on the internet. It does **not** prove that it was seen worldwide, received by Congress, accepted by an official, or broadcast by a government or media organization.

```text
PUBLICLY_ADDRESSABLE != GLOBALLY_SEEN
PUBLIC_REPO          != GOVERNMENT_RECEIPT
GOVERNMENT_RECEIPT   != GOVERNMENT_AGREEMENT
```

## Existing BoxD mesh preserved

This audit extends, and does not replace, `docs/boxd/governance/MULTI_OVERSIGHT_MESH_V0_1.md`.

Standing BoxD rule preserved:

> **One agency may investigate. Another may prosecute. Another may audit. Another may appropriate. Another may adjudicate. BoxD compares the receipts. None gets to inherit the others' authority.**

## Final state

```text
OBJECT                    = CAPITOL_PAIL_CONSTITUTIONAL_AUTHORITY_AUDIT
DATE                      = 2026-09-11
CARD_COUNT                = 8
SESSION_IMAGE_HASHES      = 8 / 8
IMAGE_BYTES_IN_REPO       = FALSE
PUBLIC_ROLE_CHECK         = RUN
CONSTITUTIONAL_AUTHORITY  = TYPED / NOT COLLAPSED
EXPERTISE                 = SEPARATE / NOT INFERRED
FEMALE_QUERY_LANE         = REQUIRED / SET GAP OBSERVED
SATIRE                    = PRESERVED AS SATIRE
OFFICIAL_SIGNATURES       = NONE ESTABLISHED BY CARDS
OFFICIAL_QUOTES           = NONE ESTABLISHED BY CARDS
WRONGDOING                = NOT INFERRED
AUTHORITY_CREATED         = FALSE
NO_FAKE_GREEN             = TRUE
```

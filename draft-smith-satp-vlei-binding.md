---
title: "A SATP Core Binding for vLEI Identities"
abbrev: "SATP-vLEI"
category: std

docname: draft-smith-satp-vlei-binding-latest
submissiontype: IETF  # also: "independent", "editorial", "IAB", or "IRTF"
number:
date:
consensus: true
v: 3
area: "Applications and Real-Time"
workgroup: "Secure Asset Transfer Protocol"
keyword:
 - verifiable identities
 - internet draft
pi:
  css: css/overrides.css
venue:
  group: "Secure Asset Transfer Protocol"
  type: "Working Group"
  mail: "sat@ietf.org"
  arch: "https://mailarchive.ietf.org/arch/browse/sat/"
  github: "nedmsmith/draft-smith-satp-vlei-binding"
  latest: "https://nedmsmith.github.io/draft-smith-satp-vlei-binding/draft-smith-satp-vlei-binding.html"

author:
 -
    fullname: "Ned Smith"
    organization: Independent
    email: "ned.smith.ietf@outlook.com"

normative:
  REQ-LEVEL: RFC2119
  I-D.ietf-satp-core: satp-core
  RFC7517: jwk
  STD91:
    -: media-type
    =: RFC6838
  RFC7252: content-format
  RFC8610: cddl
  ISO17442-3:
    -: iso-vlei
    title: >
      Financial services — Legal entity identifier (LEI) —
      Part 3: Verifiable LEIs (vLEIs)
    author:
      org: International Organization for Standardization
    date: 2024
    seriesinfo:
      ISO: 17442-3:2024
    target: https://www.iso.org/standard/85628.html

informative:
  I-D.ietf-satp-architecture: satp-arch
  ISO17442-1:
    -: iso-lei
    title: >
      Financial services — Legal entity identifier (LEI) —
      Part 1: Assignment
    author:
      org: International Organization for Standardization
    date: 2020
    seriesinfo:
      ISO: 17442-1:2020
    target: https://www.iso.org/standard/59771.html

  KERI-Spec:
    -: toip-keri
    title: >
      Key Event Receipt Infrastructure (KERI) Specification, v0.9, Draft
    author:
      org: Trust Over IP Foundation
    date: 2023
    seriesinfo:
      TOIP: TSWG-KERI-2023
    target: https://trustoverip.github.io/tswg-keri-specification/

  ACDC-Spec:
    -: toip-acdc
    title: >
      Authentic Chained Data Containers (ACDC) Specification, v0.9, Draft
    author:
      org: Trust Over IP Foundation
    date: 2023
    seriesinfo:
      TOIP: TSWG-ACDC-2023
    target: https://trustoverip.github.io/tswg-acdc-specification

  CESR-Spec:
    -: toip-cesr
    title: >
      Composable Event Streaming Representation (CESR) Proof Format Specification, v0.9, Draft
    author:
      org: Trust Over IP Foundation
    date: 2023
    seriesinfo:
      TOIP: TSWG-CESR-2023
    target: https://trustoverip.github.io/tswg-cesr-specification/

  GLEIF-vLEI-EGF:
    -: gleif-fwk
    title: >
      Verifiable LEI (vLEI) Ecosystem Governance Framework:
      Primary and Controlled Documents
    author:
      org: Global Legal Entity Identifier Foundation
    date: 2025-04-16
    seriesinfo:
      GLEIF: vLEI-EGF-v3.0
    target: https://www.gleif.org/en/vlei/introducing-the-vlei-ecosystem-governance-framework

  GLEIF-vLEI-TechReq-Part1:
    -: gleif-req1
    title: >
      Technical Requirements Part 1: KERI Infrastructure
    author:
      org: Global Legal Entity Identifier Foundation
    date: 2025-04-16
    seriesinfo:
      GLEIF: vLEI-EGF-TechReq-Part1-v1.3
    target: https://www.gleif.org/organizational-identity/introducing-the-verifiable-lei-vlei/introducing-the-vlei-ecosystem-governance-framework/2025-04-16_vlei-egf-v3.0-technical-requirements-part-1-keri-infrastructure-2024_v1.3_final.pdf

  GLEIF-vLEI-TechReq-Part2:
    -: gleif-req2
    title: >
      Technical Requirements Part 2: vLEI Credentials
    author:
      org: Global Legal Entity Identifier Foundation
    date: 2023-12-15
    seriesinfo:
      GLEIF: vLEI-EGF-TechReq-Part2-v1.1
    target: https://www.gleif.org/en/vlei/introducing-the-vlei-ecosystem-governance-framework

  GLEIF-vLEI-TechReq-Part3:
    -: gleif-req3
    title: >
      Technical Requirements Part 3: vLEI Credential Schema Registry
    author:
      org: Global Legal Entity Identifier Foundation
    date: 2023-12-15
    seriesinfo:
      GLEIF: vLEI-EGF-TechReq-Part3-v1.1
    target: https://www.gleif.org/en/vlei/introducing-the-vlei-ecosystem-governance-framework

entity:
  SELF: "RFCthis"

--- abstract

The verifiable Legal Entity Identifier (vLEI) is a cryptographically verifiable extension of the LEI standard, designed to automate trust in organizational identity.
Governed by the Global Legal Entity Identifier Foundation (GLEIF), the vLEI system uses W3C Verifiable Credentials, Decentralized Identifiers (DIDs), and Key Event Receipt Infrastructure (KERI) to issue and verify credentials for legal entities and their authorized representatives.
It enables secure, machine-readable identity assertions across financial, regulatory, and supply chain ecosystems, supporting role-based delegation and interoperability with decentralized trust frameworks.

This specification defines vLEI for verifiable gateway operator identities and cryptographically links the gateway operator identity to the gateway identity.
Thus SATP core lock assertions are cryptographically linked to gateway operator identities.


--- middle

# Introduction {#sec-intro}

The SATP architecute {{-satp-arch}} defines an interoperability architecture for interconnection between networks or systems that anticipates a secure asset transfer protocol that satisfies security, privacy, atomicity and liveliness requirements in the transfer of assets.
The SATP core protocol {{-satp-core}} is a protocol for exchanging digital assets that ensures the state of the asset is preserved across inter-domain transfers. It is an extensible protocol where fields containing identity and payload values that are not defined by SATP core may be defined by companion specifications.
This specification defines a SATP core protocol binding for Verifiable Legal Entity Identifiers (vLEI) {{-iso-vlei}} used to identify SATP gateways and the organizations that operate them.
In some use cases, the assets being transferred have legal considerations such that officers of the organization are expected to authorize digital asset transfers.
This specification details the various vLEI credentials needed and how to integrate them with SATP core messages.
SATP core message binding anticipates use of a message wrapper that uses media type {{-media-type}} and content format {{-content-format}} identifiers to facilitate interoperability with vLEI and other credential types.


# Conventions and Definitions {#sec-conv}

{::boilerplate bcp14-tagged}

# Architecture {#sec-arch}

The SATP core protocol {{-satp-core}} defines several extensible protocol fields that contain identity and other values not defined by SATP core.
To facilitate interoperability these fields SHOULD contain a media type {{-media-type}} or content format {{-content-format}} wrapper.
This specation requests IANA assignment of media type and content format identifiers for vLEIs which are serialized as Composable Event Streaming Representation (CESR) {{-toip-cesr}} objects in JSON format. See {{sec-iana}}.

## SATP Messages Containing vLEI Credentials

The following SATP messages are extended to contain vLEI credentials:

| # | SATP Message | Credential Type |
|===
| 1 | verifiedOriginatorEntityId, verifiedBeneficiaryEntityId, senderGatewayOwnerId, receiverGatewayOwnerId | LegalEntityIdentityvLEICredential |
| 2 | senderGatewayId, recipientGatewayId, senderGatewayNetworkId, recipientGatewayNetworkId | LegalEntityEngagementContextRolevLEICredential |
| 3 | assetControllerCredential, lockEvidenceIssuerCredential, commitAuthorizingCredential | LegalEntityIdentityvLEICredential, OfficialOrganizationalRolevLEICredential, LegalEntityEngagementContextRolevLEICredential |
| 4 | originatorPubkey, beneficiaryPubkey, senderGatewaySignaturePublicKey, receiverGatewaySignaturePublicKey, senderGatewayDeviceIdentityPubkey, receiverGatewayDeviceIdentityPubkey, lockEvidenceVerificationKey, commitVerificationKey, postCommitSecureChannelKey | JSON Web Key |
|===
{: #tbl-satp-msgs title="SATP messages containing vLEI and other credentials"}

### LegalEntityIdentityvLEICredential Credentials

The SATP messages in row 1 of {{tbl-satp-msgs}} are realized using a LegalEntityIdentityvLEICredential because these message identify legal entities.
Gateway owner identities area form of legal entity as they identify the owner of a gateway rather than the gateway itself.

### LegalEntityEngagementContextRolevLEICredential Credentials

The SATP messages in row 2 of {{tbl-satp-msgs}} are realized using a LegalEntityEngagementContextRolevLEICredential because these message identify the gateways and hosts within the respective networks involved in transferring digital assets.

### OfficialOrganizationalRolevLEICredential Credentials

The SATP messages in row 3 of {{tbl-satp-msgs}} are realized using various vLEI credentials depending on use case context.

Examples:

 * LegalEntityIdentityvLEICredential is used if an asset controller, lock evidence issuer, or commit authority are legal entities.

* OfficialOrganizationalRolevLEICredential is used if an asset controller, lock evidence issuer, or commit authority are organizational roles.

* LegalEntityEngagementContextRolevLEICredential is used if an asset controller, lock evidence issuer, or commit authority are machine hosts facilitating SATP gateways or network hosts.

### JWK Key Structures

The SATP messages in row 4 of {{tbl-satp-msgs}} are realized using JSON Web Key (JWK)  {{-jwk}} structures.

## SATP Message Wrapper Schema
The following CDDL {{-cddl}} defines the wrapper and application to SATP fields.

~~~ cddl
{::include cddl/msg-wrapper.cddl}
~~~

## vLEI Profiles

 | Profile name | Compact profile value | Media type |
 |===
 | Legal Entity Identity (LEI‑ID) | ;profile="urn:vlei:lei-id" | application/acdc+json |
 | Engagement Context Role (ECR) | ;profile="urn:vlei:ecr" | application/acdc+json |
 | Official Organizational Role (OOR) | ;profile="urn:vlei:oor" | application/acdc+json |
 |===
 {: #tbl-vlei-profiles}

## Example SATP Credential Payload

The following JSON document complies with the SATP CDDL schema using synthetic CESR payloads:

~~~ json
{::include json/examples/cesr+json-vlei.json}
~~~



# Identities {#sec-ids}

## Identity Binding {#sec-bind}

# Verification of vLEI Payloads {#sec-verify}

# Security Considerations {#sec-sec}

TODO Security


# IANA Considerations {#sec-iana}

## Media Type Registration: application/cesr+json

Type name:
: application

Subtype name:
: cesr+json

Required parameters:
: None

Optional parameters:
: `profile` — Indicates the credential conforms to a specific schema registry (e.g., "vlei")
: `base64` — Indicates the CESR stream is base64-encoded for transport in JSON wrappers
: `charset` — Optional; default is UTF-8

Encoding considerations:
: 8bit; CESR text encoding is UTF-8 compatible and self-framing.
: When `base64=true`, the CESR stream is base64-encoded for safe embedding in JSON.

Security considerations:
: CESR payloads are cryptographically signed and self-framing.
: Signature verification is required to ensure authenticity and integrity.
: Schema SAIDs must be validated against the [GLEIF vLEI Credential Schema Registry](https://www.gleif.org/media/pages/organizational-identity/introducing-the-verifiable-lei-vlei/introducing-the-vlei-ecosystem-governance-framework/60ede5e451-1755158176/2023-12-15_vlei-egf-v3.0-technical-requirements-part-3-vlei-credential-schema-registry_v1.1-final.pdf).
: Credential provenance must be anchored to the GLEIF Root AID via ACDC edges.

Interoperability considerations:
: CESR supports dual text-binary encoding; this media type assumes CESR text encoding.
: When `base64=true`, payloads are safely embeddable in JSON-based SATP wrappers.
: Compatible with SATP, ACDC, and KERI protocols.

Published specification:
: Composable Event Streaming Representation (CESR) — [draft-ssmith-cesr-03](https://www.ietf.org/archive/id/draft-ssmith-cesr-03.html)
: GLEIF vLEI Credential Schema Registry — [GLEIF Registry PDF](https://www.gleif.org/media/pages/organizational-identity/introducing-the-verifiable-lei-vlei/introducing-the-vlei-ecosystem-governance-framework/60ede5e451-1755158176/2023-12-15_vlei-egf-v3.0-technical-requirements-part-3-vlei-credential-schema-registry_v1.1-final.pdf)

Applications that use this media type:
: GLEIF vLEI issuance and verification systems
: SATP-compliant credential exchange platforms
: Forensic credential chaining and audit systems

Fragment identifier considerations:
: None

Additional information:
: Magic number(s): None
: File extension(s): `.cesrj`
: Macintosh file type code(s): None

Person & email address to contact for further information:
: N. Smith <spec-author@example.org>
: GLEIF IT Team <vlei-support@gleif.org>

Intended usage:
: COMMON

Author:
: TBD, GLEIF IT Team

Change controller:
: IETF / GLEIF



--- back

# Acknowledgments
{:numbered="false"}

TODO acknowledge.

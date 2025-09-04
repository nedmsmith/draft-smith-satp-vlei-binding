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
  RFC7159: json
  RFC7517: jwk
  RFC2585: pkix-key
  STD96:
    -: cose-key
    =: RFC9052
  STD91:
    -: media-type
    =: RFC6838
  RFC7252: content-format
  RFC8610: cddl
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
    -: keri
    title: >
      Key Event Receipt Infrastructure (KERI) Specification, v0.9, Draft
    author:
      org: Trust Over IP Foundation
    date: 2023
    seriesinfo:
      TOIP: TSWG-KERI-2023
    target: https://trustoverip.github.io/tswg-keri-specification/

  ACDC-Spec:
    -: acdc
    title: >
      Authentic Chained Data Containers (ACDC) Specification, v0.9, Draft
    author:
      org: Trust Over IP Foundation
    date: 2023
    seriesinfo:
      TOIP: TSWG-ACDC-2023
    target: https://trustoverip.github.io/tswg-acdc-specification

  CESR-Spec:
    -: cesr
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

entity:
  SELF: "RFCthis"

--- abstract

The verifiable Legal Entity Identifier (vLEI) is a cryptographically verifiable extension of the LEI standard, designed to automate trust in organizational identity.
Governed by the Global Legal Entity Identifier Foundation (GLEIF), the vLEI system uses Authentic Chained Data Containers (ACDCs), Self-Addressing Identifiers (SAIDs), and Key Event Receipt Infrastructure (KERI) to issue and verify credentials for legal entities and their authorized representatives.
It enables secure, machine-readable identity assertions across financial, regulatory, and supply chain ecosystems, supporting role-based delegation and interoperability with decentralized trust frameworks.

This specification defines vLEI for verifiable gateway operator identities and cryptographically links the gateway operator identity to the gateway identity.
Thus SATP core lock assertions are cryptographically linked to gateway operator identities.


--- middle

# Introduction {#sec-intro}

The SATP architecture {{-satp-arch}} defines an interoperability architecture for interconnection between networks or systems that anticipates a secure asset transfer protocol that satisfies security, privacy, atomicity and liveliness requirements in the transfer of assets.
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
This specation requests IANA assignment of media type and content format identifiers for vLEIs which are serialized as Composable Event Streaming Representation (CESR) {{-cesr}} objects in JSON format. See {{sec-iana}}.

## SATP Messages Containing vLEI Credentials

The following SATP messages are extended to contain vLEI credentials:

| # | SATP Message | Credential Type |
|===
| 1 | verifiedOriginatorEntityId, verifiedBeneficiaryEntityId, senderGatewayOwnerId, receiverGatewayOwnerId | LegalEntityvLEICredential |
| 2 | senderGatewayId, recipientGatewayId, senderGatewayNetworkId, recipientGatewayNetworkId | LegalEntityEngagementContextRolevLEICredential |
| 3 | assetControllerCredential, lockEvidenceIssuerCredential, commitAuthorizingCredential | LegalEntityvLEICredential, OfficialOrganizationalRolevLEICredential, LegalEntityEngagementContextRolevLEICredential |
| 4 | originatorPubkey, beneficiaryPubkey, senderGatewaySignaturePublicKey, receiverGatewaySignaturePublicKey, senderGatewayDeviceIdentityPubkey, receiverGatewayDeviceIdentityPubkey, lockEvidenceVerificationKey, commitVerificationKey, postCommitSecureChannelKey | JOSE or COSE Key |
|===
{: #tbl-satp-msgs title="SATP messages containing vLEI and other credentials" align=left}







The SATP Messages in row 4 of {{tbl-satp-msgs}} SHALL be a JSON Web Key as defined by {{-jwk}} or a COSE Key as defined by {{-cose-key}}.

### LegalEntityIdentityvLEICredential Credentials

The SATP Messages in row 1 of {{tbl-satp-msgs}} SHALL be a LegalEntityvLEICredential as defined by the [LEvLEIC](https://github.com/GLEIF-IT/vLEI-schema/blob/main/legal-entity-vLEI-credential.json) schema.

These messages are realized using a Legal Entity vLEI Credential (LEvLEIC) because these message identify legal entities.
Gateway owner identities area form of legal entity as they identify the owner of a gateway rather than the gateway itself.

### LegalEntityEngagementContextRolevLEICredential Credentials

The SATP Messages in row 2 of {{tbl-satp-msgs}} SHALL be a LegalEntityEngagementContextRolevLEICredential as defined by the [LEECRvLEIC](https://github.com/GLEIF-IT/vLEI-schema/blob/main/legal-entity-engagement-context-role-vLEI-credential.json) schema.

These messages are realized using a Legal Entity Engagement Context Role vLEI Credential (LEECRvLEIC) because these message identify the gateways and hosts within the respective networks involved in transferring digital assets.

### OfficialOrganizationalRolevLEICredential Credentials

The SATP Messages in row 3 of {{tbl-satp-msgs}} SHALL be one of a LegalEntityvLEICredential, LegalEntityEngagementContextRolevLEICredential, or OfficialOrganizationalRolevLEICredential as defined by the [LEvLEIC](https://github.com/GLEIF-IT/vLEI-schema/blob/main/legal-entity-vLEI-credential.json), [LEECRvLEIC](https://github.com/GLEIF-IT/vLEI-schema/blob/main/legal-entity-engagement-context-role-vLEI-credential.json), and [LEOORvLEIC](https://github.com/GLEIF-IT/vLEI-schema/blob/main/legal-entity-official-organizational-role-vLEI-credential.json) schemas.

These messages are realized using various vLEI credentials depending on use case context.

Examples:

 * LEvLEIC is used if an asset controller, lock evidence issuer, or commit authority are legal entities.

 * LEECRvLEIC is used if an asset controller, lock evidence issuer, or commit authority are machine hosts facilitating SATP gateways or network hosts.

 * Official Organizational Role vLEI Credential (OORvLEIC) is used if an asset controller, lock evidence issuer, or commit authority are organizational roles.

### Key Structures

Keys embedded in hardware or firmware may not easily be converted to an interoperablel format, hence support for multiple key formats ensures the SATP protocols can be implemented by a wide variety of systems.

The SATP messages in row 4 of {{tbl-satp-msgs}} SHALL be encoded using JSON Web Key (JWK) {{-jwk}} or COSE key {{-cose-key}} formats.

The key structure SHOULD be extensible to support additional key formats.

## SATP Message Wrapper Schema
The following CDDL {{-cddl}} defines the wrapper and application to SATP fields.

~~~ cddl
{::include cddl/msg-wrapper.cddl}
~~~

## vLEI Media Types

vLEI credentials are expressed as Authentic Chained Data Containers (ACDC) {{-acdc}}.
Section {{sec-iana}} request IANA assignment of ACDC media types {{-media-type}}.

SATP messages as JSON can contain JSON wrapped ACDCs, but other ACDC formats are possible.
The follwing media types MAY be used when supplying ACDC credential payloads:

| Media Types |
|===
| application/acdc+json |
| application/acdc+cbor |
| application/acdc+msgpk |
| application/acdc+cesr |
| application/said+cesr |
|===
{: #tbl-vlei-media-types title="vLEI media types" align=left}

### Profile Optonal Parameter

The media type assignments have an optional parameter named "profile=" that can be used to identify the vLEI credential type. It is expressed in URI format.

| Profile name                               | Profile ID                        |
|===                                         |                                   |
| Legal Entity Identity (LEID)             | profile=urn:vlei:leid          |
| Engagement Context Role (ECR)              | profile=urn:vlei:ecr             |
| Official Organizational Role (OOR)         | profile=urn:vlei:oor             |
| Legal Entity Authorizing Role (LAR)        | profile=urn:vlei:lar             |
| Qualified vLEI Issuer (QVI)                | profile=urn:vlei:qvi             |
| vLEI Root Authority (vRA)                  | profile=urn:vlei:vra             |
|===
{: #tbl-vlei-profiles title="vLEI profiles" align=left}

The various vLEI credential types can be specified in a media type using the profile option.
{{tbl-vlei-profiles}} summarizes the profile identifiers for the various vLEI credential types.
A comprehensive listing of vLEI profiles is provided even though some of the vLEI credential types are not anticipated by the vLEI binding to SATP at this time.

### Charset Optonal Parameter

The media type assignments have an optional parameter named "charset=" that can be used to identify the character encoding scheme when payload is a text encoding. By default "utf-8" is assumed. Alternative character set encodings MUST populate "charset=".

# Identities {#sec-ids}

TODO

## Identity Binding {#sec-bind}

TODO

# Verification of vLEI Payloads {#sec-verify}

TODO

# Implementation Status

TODO

# Security Considerations {#sec-sec}

TODO

# IANA Considerations {#sec-iana}

## Media Type Assignment

IANA is requested to add the following media types to the "Media Types"
registry {{!IANA.media-types}}.

### application/acdc+json

*Type name:*

- application

*Subtype name:*

- acdc+json

*Required parameters:*

- None

*Optional parameters:*

- `profile` — Indicates the payload conforms to a specific vLEI credential type.
- `base64=true` — Indicates the ACDC stream is binary and base64-encoded for use in text transports.
- `base64=false` — Indicates the ACDC stream is text encoded. By defaualt `base64=false`.
- `charset` — Indicates character set for text encodings, default is UTF-8.

*Encoding considerations:*

- 8-bit; JSON text encoding defaults to UTF-8.
- When `base64=true`, the ACDC stream is base64-encoded for safe embedding in JSON.

*Security considerations:*

- ACDC payloads are cryptographically signed.
- Signature verification is required to ensure authenticity and integrity.
- Credential provenance must be anchored. For example, the GLEIF Root AID via ACDC edges.
- See {{sec-iana}}.

*Interoperability considerations:*

- Binary payloads must be base64 encoded (e.g., `base64=true`) to make payloads compatible with text streams.

*Published specification:*

- {{&SELF}}
- Key Event Receipt Infrastructure (KERI) — {{-keri}}
- Authentictic Chained Data Containers (ACDC) — {{-acdc}}
- Composable Event Streaming Representation (CESR) — {{-cesr}}
- GLEIF vLEI Credential Schema Registry — {{-gleif-req3}}

*Applications that use this media type:*

- GLEIF vLEI issuance and verification systems.
- SATP-compliant credential exchange platforms.
- Forensic credential chaining and audit systems.

*Fragment identifier considerations:*

- None

*Additional information:*

- *Magic number(s):* None
- *File extension(s):* `.acdcjson`
- *Macintosh file type code(s):* None

*Person & email address to contact for further information:*

- N. Smith <ned.smith.ietf@outlook.com>
- GLEIF IT Team <vlei-support@gleif.org>

*Intended usage:*

- COMMON

*Author:*

- N. Smith <ned.smith.ietf@outlook.com>
- GLEIF IT Team <vlei-support@gleif.org>

*Change controller:*

- IETF / GLEIF

### application/acdc+cbor

*Type name:*

- application

*Subtype name:*

- acdc+cbor

*Required parameters:*

- None

*Optional parameters:*

- `profile` — Indicates the payload conforms to a specific vLEI credential type.
- `base64=true` — Indicates the ACDC stream is base64-encoded for use in text transports.
- `base64=false` — Indicates the ACDC stream is binary for use in binary transports. By default `base64=false`.

*Encoding considerations:*

- ACDC streams are CBOR encoded for use with binary transports.
If the transport is a text stream the `base64=true` option should be used.

*Security considerations:*

- CESR payloads are cryptographically signed and self-framing.
- Signature verification is required to ensure authenticity and integrity.
- Credential provenance must be anchored. For example, the GLEIF Root AID via ACDC edges.
- vLEIs must be validated against the vLEI schema. See {{-gleif-req3}}.
- See {{sec-iana}}.

*Interoperability considerations:*

- Binary payloads must be base64 encoded (e.g., `base64=true`) to make payloads compatible with text streams.

*Published specification:*

- {{&SELF}}
- Key Event Receipt Infrastructure (KERI) — {{-keri}}
- Authentictic Chained Data Containers (ACDC) — {{-acdc}}
- Composable Event Streaming Representation (CESR) — {{-cesr}}
- GLEIF vLEI Credential Schema Registry — {{-gleif-req3}}

*Applications that use this media type:*

- GLEIF vLEI issuance and verification systems
- SATP-compliant credential exchange platforms
- Forensic credential chaining and audit systems

*Fragment identifier considerations:*

- None

*Additional information:*

- Magic number(s): None
- File extension(s): `.acdcbor`
- Macintosh file type code(s): None

*Person & email address to contact for further information:*

- N. Smith <ned.smith.ietf@outlook.com>
- GLEIF IT Team <vlei-support@gleif.org>

*Intended usage:*

- COMMON

*Author:*

- N. Smith <ned.smith.ietf@outlook.com>
- GLEIF IT Team <vlei-support@gleif.org>

*Change controller:*

- IETF / GLEIF

### application/acdc+msgpk

*Type name:*

- application

*Subtype name:*

- acdc+msgpk

*Required parameters:*

- None

*Optional parameters:*

- `profile` — Indicates the payload conforms to a specific vLEI credential type.
- `base64=true` — Indicates the ACDC stream is base64-encoded for use in text transports.
- `base64=false` — Indicates the ACDC stream is binary for use in binary transports. By default `base64=false`.

*Encoding considerations:*

- ACDC streams are MSGPK encoded for use with binary transports.
If the transport is a text stream the `base64=true` option should be used.

*Security considerations:*

- ACDC payloads are cryptographically signed and self-framing.
- Signature verification is required to ensure authenticity and integrity.
- Credential provenance must be anchored. For example, the GLEIF Root AID via ACDC edges.
- vLEIs must be validated against the vLEI schema. See {{-gleif-req3}}.
- See {{sec-iana}}.

*Interoperability considerations:*

- Binary payloads must be base64 encoded (e.g., `base64=true`) to make payloads compatible with text streams.

*Published specification:*

- {{&SELF}}
- Key Event Receipt Infrastructure (KERI) — {{-keri}}
- Authentictic Chained Data Containers (ACDC) — {{-acdc}}
- Composable Event Streaming Representation (CESR) — {{-cesr}}
- GLEIF vLEI Credential Schema Registry — {{-gleif-req3}}

*Applications that use this media type:*

- GLEIF vLEI issuance and verification systems
- SATP-compliant credential exchange platforms
- Forensic credential chaining and audit systems

*Fragment identifier considerations:*

- None

*Additional information:*

- Magic number(s): None
- File extension(s): `.acdcmsgpk`
- Macintosh file type code(s): None

*Person & email address to contact for further information:*

- N. Smith <ned.smith.ietf@outlook.com>
- GLEIF IT Team <vlei-support@gleif.org>

*Intended usage:*

- COMMON

*Author:*

- N. Smith <ned.smith.ietf@outlook.com>
- GLEIF IT Team <vlei-support@gleif.org>

*Change controller:*

- IETF / GLEIF

### application/acdc+cesr

*Type name:*

- application

*Subtype name:*

- acdc+cesr

*Required parameters:*

- None

*Optional parameters:*

- `profile` — Indicates the payload conforms to a specific vLEI credential type.
- `base64=true` — Indicates the CESR stream is text encoded. By default `base64=true`.
- `base64=false` — Indicates the CESR stream is binary encoded.
- `charset` — Optional; default is UTF-8

*Encoding considerations:*

- 8-bit; CESR text encoding is UTF-8 compatible and self-framing.
- When `base64=true`, the CESR stream is base64-encoded for safe embedding in text streams.

*Security considerations:*

- CESR payloads are cryptographically signed and self-framing.
- Signature verification is required to ensure authenticity and integrity.
- Credential provenance must be anchored. For example, the GLEIF Root AID via ACDC edges.
- vLEIs must be validated against the vLEI schema. See {{-gleif-req3}}.
- See {{sec-iana}}.

*Interoperability considerations:*

- CESR supports dual text-binary encoding, this media type assumes CESR text encoding.
If CESR is binary encoded, the `base64=` parameter must be set to `false`.

*Published specification:*

- {{&SELF}}
- Key Event Receipt Infrastructure (KERI) — {{-keri}}
- Authentictic Chained Data Containers (ACDC) — {{-acdc}}
- Composable Event Streaming Representation (CESR) — {{-cesr}}
- GLEIF vLEI Credential Schema Registry — {{-gleif-req3}}

*Applications that use this media type:*

- GLEIF vLEI issuance and verification systems
- SATP-compliant credential exchange platforms
- Forensic credential chaining and audit systems

*Fragment identifier considerations:*

- None

*Additional information:*

- Magic number(s): None
- File extension(s): `.acdccesr`
- Macintosh file type code(s): None

*Person & email address to contact for further information:*

- N. Smith <ned.smith.ietf@outlook.com>
- GLEIF IT Team <vlei-support@gleif.org>

*Intended usage:*

- COMMON

*Author:*

- N. Smith <ned.smith.ietf@outlook.com>
- GLEIF IT Team <vlei-support@gleif.org>

*Change controller:*

- IETF / GLEIF

### application/said+cesr

*Type name:*

- application

*Subtype name:*

- said+cesr

*Required parameters:*

- None

*Optional parameters:*

- `profile` — Indicates the payload conforms to a specific vLEI credential type
- `base64=true` — Indicates the CESR stream is text encoded. By default `base64=true`.
- `base64=false` — Indicates the CESR stream is binary encoded.
- `charset` — Optional; default is UTF-8

*Encoding considerations:*

- 8-bit; CESR text encoding is UTF-8 compatible and self-framing.
- When `base64=true`, the CESR stream is base64-encoded for safe embedding in text streams.

*Security considerations:*

- CESR payloads are cryptographically signed and self-framing.
- Signature verification is required to ensure authenticity and integrity.
- Credential provenance must be anchored. For example, the GLEIF Root AID via ACDC edges.
- vLEIs must be validated against the vLEI schema. See {{-gleif-req3}}.
- See {{sec-iana}}.

*Interoperability considerations:*

- CESR supports dual text-binary encoding, this media type assumes CESR text encoding.
If CESR is binary encoded, the `base64=` parameter must be set to `false`.

*Published specification:*

- {{&SELF}}
- Key Event Receipt Infrastructure (KERI) — {{-keri}}
- Authentictic Chained Data Containers (ACDC) — {{-acdc}}
- Composable Event Streaming Representation (CESR) — {{-cesr}}
- GLEIF vLEI Credential Schema Registry — {{-gleif-req3}}

*Applications that use this media type:*

- GLEIF vLEI issuance and verification systems
- SATP-compliant credential exchange platforms
- Forensic credential chaining and audit systems

*Fragment identifier considerations:*

- None

*Additional information:*

- Magic number(s): None
- File extension(s): `.saidcesr`
- Macintosh file type code(s): None

*Person & email address to contact for further information:*

- N. Smith <ned.smith.ietf@outlook.com>
- GLEIF IT Team <vlei-support@gleif.org>

*Intended usage:*

- COMMON

*Author:*

- N. Smith <ned.smith.ietf@outlook.com>
- GLEIF IT Team <vlei-support@gleif.org>

*Change controller:*

- IETF / GLEIF

## CoAP Content-Format ID Assignments

IANA is requested to assign the following Content-Format numbers in the
"CoAP Content-Formats" sub-registry, within the "Constrained RESTful
Environments (CoRE) Parameters" Registry {{!IANA.core-parameters}}:

| Content-Type | Content Coding | ID | Reference |
|---
| application/acdc+json | - | TBA1 | {{&SELF}} |
| application/acdc+cbor | - | TBD2 | {{&SELF}} |
| application/acdc+msgpk | - | TBD3 | {{&SELF}} |
| application/acdc+cesr | - | TBD4 | {{&SELF}} |
| application/said+cesr | - | TBD5 | {{&SELF}} |
| application/acdc+json;profile=urn:vlei:leid | - | TBA10 | {{&SELF}} |
| application/acdc+json;profile=urn:vlei:ecr | - | TBA11 | {{&SELF}} |
| application/acdc+json;profile=urn:vlei:oor | - | TBA12 | {{&SELF}} |
| application/acdc+json;profile=urn:vlei:lar | - | TBA13 | {{&SELF}} |
| application/acdc+json;profile=urn:vlei:qvi | - | TBA14 | {{&SELF}} |
| application/acdc+json;profile=urn:vlei:vra | - | TBA15 | {{&SELF}} |
| application/acdc+cbor;profile=urn:vlei:leid | - | TBA20 | {{&SELF}} |
| application/acdc+cbor;profile=urn:vlei:ecr | - | TBA21 | {{&SELF}} |
| application/acdc+cbor;profile=urn:vlei:oor | - | TBA22 | {{&SELF}} |
| application/acdc+cbor;profile=urn:vlei:lar | - | TBA23 | {{&SELF}} |
| application/acdc+cbor;profile=urn:vlei:qvi | - | TBA24 | {{&SELF}} |
| application/acdc+cbor;profile=urn:vlei:vra | - | TBA25 | {{&SELF}} |
| application/acdc+msgpk;profile=urn:vlei:leid | - | TBA30 | {{&SELF}} |
| application/acdc+msgpk;profile=urn:vlei:ecr | - | TBA31 | {{&SELF}} |
| application/acdc+msgpk;profile=urn:vlei:oor | - | TBA32 | {{&SELF}} |
| application/acdc+msgpk;profile=urn:vlei:lar | - | TBA33 | {{&SELF}} |
| application/acdc+msgpk;profile=urn:vlei:qvr | - | TBA34 | {{&SELF}} |
| application/acdc+msgpk;profile=urn:vlei:vra | - | TBA35 | {{&SELF}} |
| application/acdc+cesr;profile=urn:vlei:leid | - | TBA40 | {{&SELF}} |
| application/acdc+cesr;profile=urn:vlei:ecr | - | TBA41 | {{&SELF}} |
| application/acdc+cesr;profile=urn:vlei:oor | - | TBA42 | {{&SELF}} |
| application/acdc+cesr;profile=urn:vlei:lar | - | TBA43 | {{&SELF}} |
| application/acdc+cesr;profile=urn:vlei:qvr | - | TBA44 | {{&SELF}} |
| application/acdc+cesr;profile=urn:vlei:vra | - | TBA45 | {{&SELF}} |
| application/said+cesr;profile=urn:vlei:leid | - | TBA50 | {{&SELF}} |
| application/said+cesr;profile=urn:vlei:ecr | - | TBA51 | {{&SELF}} |
| application/said+cesr;profile=urn:vlei:oor | - | TBA52 | {{&SELF}} |
| application/said+cesr;profile=urn:vlei:lar | - | TBA53 | {{&SELF}} |
| application/said+cesr;profile=urn:vlei:qvr | - | TBA54 | {{&SELF}} |
| application/said+cesr;profile=urn:vlei:vra | - | TBA55 | {{&SELF}} |
{: align="left" title="New Content-Formats"}

--- back

# Full CDDL {#sec-autogen}

~~~ cddl
{::include cddl/satp-autogen.cddl}
~~~

# Examples in JSON

The following SATP wrapper examples show synthetic vLEI data:

~~~ json
{::include examples/json/voe-id1.jsonc}
~~~

~~~ json
{::include examples/json/vbe-id1.jsonc}
~~~

~~~ json
{::include examples/json/sgo-id1.jsonc}
~~~

~~~ json
{::include examples/json/rgo-id1.jsonc}
~~~

~~~ json
{::include examples/json/sgw-id1.jsonc}
~~~

~~~ json
{::include examples/json/rgw-id1.jsonc}
~~~

~~~ json
{::include examples/json/sgw-netid1.jsonc}
~~~

~~~ json
{::include examples/json/rgw-netid1.jsonc}
~~~

The following SATP wrapper examples show synthetic key data:

~~~ json
{::include examples/json/key-carrier1.jsonc}
~~~

# Acknowledgments
{:numbered="false"}

TODO acknowledge.

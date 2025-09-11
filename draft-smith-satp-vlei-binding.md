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
  RFC4648: base64uri
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

# Identities {#sec-ids}

The SATP core protocol {{-satp-core}} defines a set of entities that participate in an asset transfer.
These entities are represented in differennt ways including identifiers, credentials and public keys.
SATP entities are presumed to have been issued cryptographically relevant identities prior to stage 1 and subsequent exchanges.
An entity with an issued identity is a principal.

vLEIs {{-iso-vlei}} use Autonomic Identifiers (AID) to name principals in a system.
AIDs are contained within an Authentic Chained Data Contain (ACDC) {{-acdc}} credential.
ACDCs may also contain Key Event Logs (KEL) that are form of key attestation.
KELs change periodically as key event receipts are added to the log.
The state of the credential is therfore changing with use of the key.
The state of an ACDC can be fixed by taking a cryptographic hash of an ACDC at some point in time.
The digest value is a Self-Addressing Identifier (SAID) {{-cesr}}.

When applying vLEI to SATP, the ACID properties expect the state of the exchanged asset and protocol endpoints are unchanging during the exchange.
In relation to SATP messages, entity identifiers (e.g., verifiedOriginatorEntityID, senderGatewayID) use SAIDs to ensure the identity as represented by key state doesn't change during the SATP exchange.

SATP messages referennce directly public keys (e.g., senderGatewaySignaturePublicKey) that refers to the key used to sign SATP messages or for use with device attestation.
These keys might use a non-vLEI credental, consequently the representation supports a variety of key types.
Nevertheless, use of a Key Event Recipt Infrastructure (KERI) {{-keri}} key means these keys can benefit from KEL-based key attestation.

SATP defines credentials (e.g., gatewayCredential) that binds the entity identivier(s) to public key(s) which is the normal function of ACDCs.
Normally, the identifier, public key and credential are representations of the same entity.
However, the GatewayDeviceIdentityPublicKey could be associated with a different credential from the GatewaySignaturePublicKey.
Consequently, there MAY be additional credentials issued to SATP principals that require additional verifier processing.
The association between multiple credentials for the same entity SHOULD be established during SATP Stage 0.

<cref anchor="ids-note1" source="Ned Smith">
Note1: Need to check if there is a KERI key encoding other than ACDC.
</cref>

## Identity Binding {#sec-id-bind}

The following table shows SATP entity bindings according to the various SATP message types and credential structure.

| SATP Entity | SATP Message | Structure |
|===
| Originator | implied credential | ACDC |
| Originator | OriginatorPubkey | ACDC or other |
| Originator | verifiedOriginatorEntityID | SAID |
| Beneficiary | implied credential | ACDC |
| Beneficiary | verifiedBeneficiaryEntityID | SAID |
| Beneficiary | OriginatorPubkey | ACDC or other |
| Origin Asset Network | implied credential | ACDC |
| Origin Asset Network | senderGatewayNetworkId | ACDC |
| Dest. Asset Network | implied credential | ACDC |
| Dest. Asset Network | recipientGatewayNetworkId | ACDC |
| Sender Gateway (G1) | gatewayCredential | ACDC |
| G1 | senderGatewaySignaturePubkey | ACDC or other |
| G1 | senderGatewayId | SAID |
| G1 | implied device credential | ACDC |
| G1 | senderGatewayDeviceIdentityPubkey | ACDC or other |
| Gateway Owner (G1) | implied credential | ACDC |
| Gateway Owner (G1) | senderGatewayOwnerID | SAID |
| Receiver Gateway (G2) | gatewayCredential | ACDC |
| G2 | receiverGatewaySignaturePubkey | ACDC or other |
| G2 | receiverGatewayId | SAID |
| G2 | implied device credential | ACDC |
| G2 | receiverGatewayDeviceIdentityPubkey | ACDC or other |
| Gateway Owner (G2) | implied credential | ACDC |
| Gateway Owner (G2) | senderGatewayOwnerID | SAID |
|===
{: #tbl-satp-entity title="SATP Entity to Credential Type Mapping" align=left}

<cref anchor="ids-note2" source="Ned Smith">
Note2: Need to describe how this draft approaches protocol binding where focus is on top-down, but not ignoring buttom up eg tls.
</cref>

# vLEI Binding Architecture {#sec-arch}

The SATP core protocol {{-satp-core}} defines several extensible protocol fields that contain identity and other values not defined by SATP core.
To facilitate interoperability these fields SHOULD contain a media type {{-media-type}} or content format {{-content-format}} wrapper.
This specation requests IANA assignment of media type and content format identifiers for vLEIs which are serialized as Composable Event Streaming Representation (CESR) {{-cesr}} objects in JSON format. See {{sec-iana}}.

The vLEI ecosystem defines roles-specific credentials.
Version 1.0 of vLEI defines six ecosystem roles.

| vLEI Role | Abbreviation |
|===
| QualifiedvLEIIssuervLEICredential | QVI |
| LegalEntityvLEICredential | LEID |
| OORAuthorizationvLEICredential | OORA |
| LegalEntityOfficialOrganizationalRolevLEICredential | OOR |
| ECRAuthorizationvLEICredential | ECRA |
| LegalEntityEngagementContextRolevLEICredential | ECR |
|===
{: #tbl-vlei-roles title="vLEI Ecosystem Roles" align=left}

<cref anchor="ids-note3" source="Ned Smith">
Note3: SATP describes Gateway secure channel establishment public key-pair but this isn't represented in the list of message publickey message types.
Gateway Credential type isn't used in any of the stages afaik.
There should be an IANA registry for the allowed credential types (vLEI, SAML, OAuth, X.509).
</cref>

## SATP Messages Containing vLEI Credentials

The SATP protocol {{-satp-core}} defines a set of SATP flows that are divided into stages.


The following SATP messages correspond to specific vLEI credential types:

| # | SATP Messages | Credential Type |
|===
| 1 | verifiedOriginatorEntityId, originatorPubkey, verifiedBeneficiaryEntityId, beneficiaryPubkey, senderGatewayOwnerId, receiverGatewayOwnerId | LEID |
| 2 | senderGatewayId, senderGatewaySignaturePubkey, recipientGatewayId, receiverGatewaySignaturePubkey, senderGatewayNetworkId, senderGatewayDeviceIdentityPubkey, recipientGatewayNetworkId receiverGatewayDeviceIdentityPubkey| ECR |
|===
{: #tbl-satp-msgs title="SATP messages containing vLEI credential type" align=left}

<cref anchor="ids-note4" source="Ned Smith">
Note4: The various xxxID messages are tstr values - the stringified representation of the vLEI credential identifer should be used here.
This is probably an SAID.
For a SATP-JSON binding, the SAID MUST use the text form of the CESR derivation code.
For a SATP-CBOR or other binary binding the SAID MUST use the binary form of the CESR derivation code.
</cref>

### LegalEntityIdentityvLEICredential Credentials

The SATP Messages in row 1 of {{tbl-satp-msgs}} SHALL be a LegalEntityvLEICredential as defined by the [LEvLEIC](https://github.com/GLEIF-IT/vLEI-schema/blob/main/legal-entity-vLEI-credential.json) schema.

These messages are realized using a Legal Entity vLEI Credential (LEvLEIC) because these message identify legal entities.
Gateway owner identities area form of legal entity as they identify the owner of a gateway rather than the gateway itself.

### LegalEntityEngagementContextRolevLEICredential Credentials

The SATP Messages in row 2 of {{tbl-satp-msgs}} SHALL be a LegalEntityEngagementContextRolevLEICredential as defined by the [LEECRvLEIC](https://github.com/GLEIF-IT/vLEI-schema/blob/main/legal-entity-engagement-context-role-vLEI-credential.json) schema.

These messages are realized using a LEECRvLEIC because they identify the gateways and hosts within the respective networks involved in transferring digital assets.

### Key Structures

Keys embedded in hardware or firmware may not easily be converted to an interoperablel format, hence support for multiple key formats ensures the SATP protocols can be implemented by a wide variety of systems.

The SATP PublicKey messages SHALL be encoded using JSON Web Key (JWK) {{-jwk}}, COSE key {{-cose-key}}, PKIX key in PEM or DER, or as ACDC {{-acdc}} credentials.

Other key formats SHOULD be allowed but are out of scope for {{&SELF}}.

## SATP Message Wrapper Schema
The following CDDL {{-cddl}} defines the wrapper and application to SATP fields.

~~~ cddl
{::include cddl/msg-wrapper.cddl}
~~~

## vLEI Media Types

vLEI credentials are expressed as Authentic Chained Data Containers (ACDC) {{-acdc}}.
Section {{sec-iana}} request IANA assignment of ACDC media types {{-media-type}}.

SATP messages, as JSON, contain JSON wrapped vLEI credentials.
However, vLEI credentials can be formatted with other wire formats that include CBOR, MSGPK, and CESR.
The follwing media types MAY be used when building credential payloads for SATP:

| Media Types |
|===
| application/acdc+json |
| application/acdc+cbor |
| application/acdc+msgpk |
| application/acdc+cesr |
| application/said+cesr |
|===
{: #tbl-vlei-media-types title="vLEI media types" align=left}

<cref anchor="ids-note5" source="Ned Smith">
Note5: vLEI v1.0.0 defines JSON structure containing SAID. There should be a way to encode the ACDC directly to avoid backend lookup of the ACDC. ACDCs can be in binary/text.
</cref>

### Profile Optonal Parameter

The media type assignments have an optional parameter named "profile=" that MAY be any value.
It can be used to identify a vLEI profile such as vLEI credential type.
It SHOULD be expressed in URI format as illustrated in {{tbl-vlei-profiles}}.

| Profile name | Profile ID |
|=== | |
| QualifiedvLEIIssuervLEICredential (QVI) | profile=urn:vlei:qvi |
| LegalEntityvLEICredential (LEID) | profile=urn:vlei:leid |
| ECRAuthorizationvLEICredential (ECRA) | profile=urn:vlei:ecra |
| LegalEntityEngagementContextRolevLEICredential (ECR) | profile=urn:vlei:ecr |
| OORAuthorizationvLEICredential (OORA) | profile=urn:vlei:oora |
| LegalEntityOfficialOrganizationalRolevLEICredential (OOR) | profile=urn:vlei:oor |
|===
{: #tbl-vlei-profiles title="vLEI profiles" align=left}

The various vLEI credential types can be specified in a media type using the profile option.
{{tbl-vlei-profiles}} summarizes the profile identifiers for the various vLEI credential types.
A comprehensive listing of vLEI profiles is provided even though some of the vLEI credential types are not anticipated by the vLEI binding to SATP at this time.

### Encoding Optonal Parameter

The media type assignments have an optional encoding ("encoding=") parameter that can be used to tunnel an alternative encoding.
Typically, encodings fall into two broad categories; text or binary.
An encoding MAY be any value, but {{&SELF}} anticipates the following:

* "base64uri" -- the payload is binary, as indicated by the media-type, but base64 encoded when the bounding protocol is a text stream. See Section 5, {{-base64uri}}.

### Charset Optonal Parameter

The media type assignments have an optional character set ("charset=") parameter that can be used to identify the character encoding scheme when the payload is a text encoding.
By default "utf-8" is assumed.
Alternative character set encodings MUST populate "charset=".

# Verification of vLEI Payloads {#sec-verify}

TODO

# Implementation Status

TODO

# Security Considerations {#sec-sec}

The following security properties are assumed for all payloads identified by media types defined in {{&SELF}}:

- ACDC payloads are cryptographically signed.
- CESR payloads are cryptographically signed and self-framing.
- Signature verification is required to ensure authenticity and integrity.
- Credential provenance must be anchored to a trusted root.
For example, the GLEIF Root AID via ACDC edges (see {{-gleif-fwk}}).
- vLEIs must be validated against the vLEI schema. See {{-gleif-req3}}.

# IANA Considerations {#sec-iana}

## Media Type Assignment

IANA is requested to add the following media types to the "Media Types"
registry {{!IANA.media-types}}.

### application/acdc+json

This media type indicates the payload is a JSON formatted vLEI.

*Type name:*

- application

*Subtype name:*

- acdc+json

*Required parameters:*

- None

*Optional parameters:*

- `profile` — Indicates the payload conforms to a specific vLEI credential type.
- `encoding` — Indicates the ACDC stream is text or binary.
If binary, encoding MUST make the payload text-safe (e.g., `encoding=base64uri`).
Defaults to `text`.
- `charset` — Indicates character set for text encodings.
Defaults to UTF-8.

*Encoding considerations:*

- 8-bit; JSON text encoding defaults to UTF-8.
- Binary payloads are text-safe encoded for use in JSON streams.

*Security considerations:*

- See {{sec-sec}}.

*Interoperability considerations:*

- Binary payloads must be base64 encoded to make payloads compatible with text streams.

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
- `encoding` — Indicates the ACDC stream is text or binary.
Defaults to `cbor`.
- `charset` — Indicates character set for text encodings.
Defaults to UTF-8.

*Encoding considerations:*

- ACDC streams are CBOR encoded for use with binary transports.
If the transport is a text stream the `encoding` option should be specified.

*Security considerations:*

- See {{sec-sec}}.

*Interoperability considerations:*

None.

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
- `encoding` — Indicates the ACDC stream is text or binary.
Defaults to `msgpk`.
- `charset` — Indicates character set for text encodings.
Defaults to UTF-8.

*Encoding considerations:*

- ACDC streams are MSGPK encoded for use with binary transports.
If the transport is a text stream the `encoding` option should be specified.

*Security considerations:*

- See {{sec-sec}}.

*Interoperability considerations:*

None.

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
- `encoding` — Indicates the CESR stream is text or binary.
Defaults to `text`.
`encoding=binary` indicates the CESR stream is binary encoded.
- `charset` — Indicates character set for text encodings.
Defaults to UTF-8.

*Encoding considerations:*

- CESR defaults to UTF-8 text encoding and is self-framing.
- CESR can also be a binary stream.
When used in binary mode the `encoding` option MUST be specified (e.g., `encoding=binary`).

*Security considerations:*

- See {{sec-iana}}.

*Interoperability considerations:*

None.

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

- `profile` — Indicates the payload conforms to a specific vLEI credential type.
- `encoding` — Indicates the CESR stream is text or binary.
Defaults to `text`.
`encoding=binary` indicates the CESR stream is binary encoded.
- `charset` — Indicates character set for text encodings.
Defaults to UTF-8.

*Encoding considerations:*

- CESR defaults to UTF-8 text encoding and is self-framing.
- CESR can also be a binary stream.
When used in binary mode the `encoding` option MUST be specified (e.g., `encoding=binary`).

*Security considerations:*

- See {{sec-sec}}.

*Interoperability considerations:*

None.

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

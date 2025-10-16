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
  GLEIF-vLEI-Part1:
    -: gleif-part1
    title: >
      Technical Requirements Part 1: KERI Infrastructure
    author:
      org: Global Legal Entity Identifier Foundation
    date: 2025-04-16
    seriesinfo:
      GLEIF: vLEI-EGF-TechReq-Part1-v1.3
    target: https://www.gleif.org/organizational-identity/introducing-the-verifiable-lei-vlei/introducing-the-vlei-ecosystem-governance-framework/2025-04-16_vlei-egf-v3.0-technical-requirements-part-1-keri-infrastructure-2024_v1.3_final.pdf

  GLEIF-vLEI-Part2:
    -: gleif-part2
    title: >
      Technical Requirements Part 2: vLEI Credentials
    author:
      org: Global Legal Entity Identifier Foundation
    date: 2023-12-15
    seriesinfo:
      GLEIF: vLEI-EGF-TechReq-Part2-v1.1
    target: https://www.gleif.org/media/pages/organizational-identity/introducing-the-verifiable-lei-vlei/introducing-the-vlei-ecosystem-governance-framework/7040021178-1759312105/2023-12-15_vlei-egf-v3.0-technical-requirements-part-2-vlei-credentials_v1.1-final.pdf

  GLEIF-vLEI-Part3:
    -: gleif-part3
    title: >
      Technical Requirements Part 3: vLEI Credential Schema Registry
    author:
      org: Global Legal Entity Identifier Foundation
    date: 2023-12-15
    seriesinfo:
      GLEIF: vLEI-EGF-TechReq-Part3-v1.1
    target: https://www.gleif.org/media/pages/organizational-identity/introducing-the-verifiable-lei-vlei/introducing-the-vlei-ecosystem-governance-framework/7040021178-1759312105/2023-12-15_vlei-egf-v3.0-technical-requirements-part-2-vlei-credentials_v1.1-final.pdf

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

  KERI-glossary:
    -: kgloss
    title: >
      KERI Suite Glossary, Draft 01
    author:
      org: Trust Over IP Foundation
    target: https://trustoverip.github.io/kerisuite-glossary/

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
      Verifiable LEI (vLEI) Ecosystem Governance Framework v3.0:
      Primary and Controlled Documents
    author:
      org: Global Legal Entity Identifier Foundation
    date: 2025-04-16
    seriesinfo:
      GLEIF: vLEI-EGF-v3.0
    target: https://www.gleif.org/en/vlei/introducing-the-vlei-ecosystem-governance-framework

  vLEI-glossary:
    -: vgloss
    title: >
      Verifiable LEI (vLEI) Ecosystem Governance Framework 3.0:
      Glossary
    author:
      org: Global Legal Entity Identifier Foundation
    date: 2023-12-15
    seriesinfo:
      GLEIF: v1.3
    target: https://www.gleif.org/organizational-identity/introducing-the-verifiable-lei-vlei/introducing-the-vlei-ecosystem-governance-framework/2023-12-15_vlei-egf-v3.0-glossary_v1.3-final.pdf

  ACM-Calculus:
    -: cacds
    title: >
      A Calculus for Access Control in Distributed Systems
    author:
      -
        ins: M. Abadi
        name: Martín Abadi
      -
        ins: M. Burrows
        name: Michael Burrows
      -
        ins: B. Lampson
        name: Butler Lampson
      -
        ins: G. Plotkin
        name: Gordon Plotkin
    date: 1993-10
    seriesinfo:
      ACM: TOPLAS 15(4), pp. 706–734
    target: https://dl.acm.org/doi/10.1145/155183.155225
  RFC4949: rfc4949

  ISO17442-1:2020:
    -: iso17442
    title: >
      Financial services — Legal entity identifier (LEI) — Part 1: Assignment
    author:
      org: International Organization for Standardization
    date: 2020
    seriesinfo:
      ISO: 17442-1:2020
    target: https://www.iso.org/standard/78829.html
  RFC5280: pkix
  STD94:
    -: cbor
    =: RFC8949
  MSGPCK:
    -: msg-pck
    title: MessagePack Specification
    author:
      org: MessagePack Community
    date: 2023
    target: https://github.com/msgpack/msgpack/blob/master/spec.md

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

## Terminology

* Legal Entity : any organization or structure that is legally or financially responsible for its actions and can enter into financial transactions, explicitly excluding natural persons except where they act as sole proprietors recognized as legal entities {{-iso17442}}.

* Natural person : a living human being ([LLI](https://www.law.cornell.edu/wex/natural_person)).

# vLEI Identities and Credentials {#sec-ids}

The SATP core protocol {{-satp-core}} defines a set of entities that participate in an asset transfer.
These entities are represented in differennt ways including identifiers, credentials and public keys.
SATP entities are presumed to have been issued cryptographically relevant identities prior to the SATP Transfer Initiation Stage (Stage 1) and subsequent exchanges.
An entity (see Section 3 {{-rfc4949}} that weilds a cryptographic key pair can be described as a *principal* {{-cacds}}.
SATP Gateways and Networks as well as the key management infrastructure that authorizes these keys are all principals.

## vLEI Credential Attributes
A legal entity identifier (LEI) is essentially a globally unique value issued by a well-known entity trusted to manage the LEI namespace correctly.
A verifiable LEI (vLEI) {{-iso-vlei}} is an Authentic Chained Data Container (ACDC) {{-acdc}} credential that contains three attributes:

* Legal Entity Identifier (LEI)
* Person Identifier - human friendly name
* Organizational Role Identifier - defined by a namespace controller such as GLEIF {{-gleif-fwk}}.

A vLEI ACDC attributes also contain an Autonomic Identifier ([AID](https://trustoverip.github.io/kerisuite-glossary#term:autonomic-identifier)) that identifies the principal to which the other vLEI attributes are bound.
In PKIX terminology, this AID identifies the *subject*.
A vLEI ACDC also contains an issuer AID that identifies the issuing principal.
vLEI credentials are issued to non-natural person legal entities (see {{-gleif-part2}} and {{-iso-vlei}}).
Nevertheless, these credentials contain `personLegalName` and `engagementContextRole` attributes that are typically associated with natural persons.

## KERI Key Management
AIDs reference Key Event Log (KEL) events that can be verified by outside entities; as such is a form of key attestation.
An ACDC issuer is anchored to a key inception event which is a digest of the current and pre-rotated keys and other key management context.
The digest becomes the issuer's autonomic identifier (AID).
An ACDC credential can be identified by hashing its contents.
The resulting digest is called a Self-Addressing Identifier (SAID) {{-keri}}.

Periodically, key events are appended to the KEL resulting in a different key state.
However, the key inception event (the first event) remains unchanged.
Anchoring AIDs to inception events means the identifier is relatively long lived as even key rotation events are anticipated at inception.
Key rotation events that exceed the number of pre-rotated keys results in a new key inception event that conseqently invalidates its previous AID.

When applying vLEI to SATP, ACID properties suggest that the state of the exchanged asset, the protocol state, and the key state play a role in determining the overall state of the asset exchange.
Ideally, SATP principals (including key state) is locked down as part of reliable asset exchange where the complete state can be rolled back to a known-good state.
However, if key state can't be locked as part of a SATP asset exchange, key state verification at each SATP stage may be needed to verify the subsequent key state changes occuring during SATP stages does not present a security relevant condition.

## SATP Credentialing Assumptions

SATP signing keys (e.g., senderGatewaySignaturePublicKey) that are based on ACDC credentials implicitly support key attestation as part of key verification.
SATP device keys (e.g., senderGatewayDeviceIdentityPubKey) used for device authentication or device attestation can furthur strengthen trustworthiness claims of SATP endpoints.
Some SATP keys do not use vLEI credentals, but could still be based on ACDC credentials.
Still other credential types (e.g., PKIX {{-pkix}}) could be leveraged, but complicates key and trust management.

{{&SELF}} assumes SATP stage 1 messages that contain identifiers and public keys are artifacts of credentials that have been issued to SATP defined entities.
In addition, SATP entities are authorized by vLEI hierarchy that supplies a legal context for asset exchange
Nevertheless, the GatewayDeviceIdentityPublicKey could be associated with a different credential from that belonging to the GatewaySignaturePublicKey.
Consequently, there MAY be additional credentials issued to SATP principals that require additional verifier processing that ensures the asset transfer legal context is in force despite bifurcated credential formats and infrastructure.

## SATP Identity Binding {#sec-id-bind}

{{tbl-satp-entity}} shows SATP entities with corresponding SATP message types mapped to a suitable credential structure.
Stage 1 defines uses credential artifacts (i.e., identifiers and public keys) implying credential issuance occurred earlier, possibly during Stage 0.
{{&SELF}} assumes all credentials issued are (or can be) ACDCs.
The entity identifier within an ACDD is an autonomic identifer (AID), which is semantically aligned with SATP IDs.

| SATP Entity | SATP Message | Structure |
|===
| Originator | OriginatorCredential *-implied-* | vLEI |
|  | verifiedOriginatorEntityID | AID |
|  | originatorPubkey | KEL or other |
| Sender Gateway Owner | senderGatewayOwnerCredential *-implied-* | vLEI |
|  | senderGatewayOwnerID | AID |
| Sender Gateway (G1) | senderGatewayCredential *-implied-* | ACDC |
|  | senderGatewayId | AID |
|  | senderGatewaySignaturePublicKey | KEL or other |
| Sender Gateway (G1) | senderGatewayDeviceIdentityCredential *-implied-* | ACDC |
|  | senderGatewayDeviceIdentityId *-implied-* | AID |
|  | senderGatewayDeviceIdentityPubkey | KEL or other |
| Sender Network | senderNetworkCredential *-implied-* | ACDC |
|  | senderGatewayNetworkId | AID |
|.............|.........................................|....|
| Beneficiary | BeneficiaryCredential *-implied-* | vLEI |
|  | beneficiaryPubkey | KEL or other |
|  | verifiedBeneficiaryEntityID | AID |
| Receiver Gateway Owner | receiverGatewayOwnerCredential *-implied-* | vLEI |
|  | senderGatewayOwnerID | AID |
| Receiver Gateway (G2) | receiverGatewayCredential *-implied-* | ACDC |
|  | receiverGatewayId | AID |
|  | receiverGatewaySignaturePublicKey | KEL or other |
| Receiver Gateway (G2) | receiverGatewayDeviceIdentityCredential *-implied-*  | ACDC |
|  | receiverGatewayDeviceIdentityId *-implied-* | AID |
|  | receiverGatewayDeviceIdentityPubkey | KEL or other |
| Recipient Network | recipientNetworkCredential *-implied-* | ACDC |
|  | recipientGatewayNetworkId | AID |
|===
{: #tbl-ent-msg-cred title="Mapping of SATP Entities and Messages to Credential Type" align=left}

## vLEI Roles

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

The vLEI role architecdture is a hierarchical namespace.
The QVI role manages the top-level namespace.
It oversees the lifecycle of subordinate namespaces (e.g., LEID, OORA, and ECRA) which are also characterized as roles.
The LEID role manages the LEID namespace.
The OORA role manages the OORA namespace and lifecycle of its subordinate OOR role.
The ECRA role manages the ECR namespace and lifecycle of its subordinate ECR role.
The LEID, OOR, and ECR are *non-natural person* roles (see {{-iso17442}}).
Non-vLEI credentials are used to identify and authenticate such entities.

### vLEI Schemas

The various vLEI ACDC objects conform to JSON Schemas:

* [LEID](https://github.com/GLEIF-IT/vLEI-schema/blob/main/legal-entity-vLEI-credential.json).
* [QVI](https://github.com/GLEIF-IT/vLEI-schema/blob/main/qualified-vLEI-issuer-vLEI-credential.json).
* [OORA](https://github.com/GLEIF-IT/vLEI-schema/blob/main/oor-authorization-vlei-credential.json).
* [ECRA](https://github.com/GLEIF-IT/vLEI-schema/blob/main/ecr-authorization-vlei-credential.json).
* [OOR](https://github.com/GLEIF-IT/vLEI-schema/blob/main/legal-entity-official-organizational-role-vLEI-credential.json).
* [ECR](https://github.com/GLEIF-IT/vLEI-schema/blob/main/legal-entity-engagement-context-role-vLEI-credential.json).

These schemas are used to validate JSON realizations of vLEI credentials.
Other representations such as CBOR {{-cbor}} and message pack {{-msg-pck}} can be realized, but the schemas used to validate them are not available at the time of this writing.

### LegalEntityEngagementContextRolevLEICredential Credentials

The SATP Messages in row 3 of {{tbl-satp-entity}} is a LegalEntityEngagementContextRolevLEICredential as defined by the [LEECRvLEIC](https://github.com/GLEIF-IT/vLEI-schema/blob/main/legal-entity-engagement-context-role-vLEI-credential.json) schema.

These messages are realized using a LEECRvLEIC because they identify the gateways and hosts within the respective networks involved in transferring digital assets.

# vLEI Binding Architecture {#sec-arch}

The SATP core protocol {{-satp-core}} defines several extensible protocol fields that contain identity and other values not defined by SATP core.
To facilitate interoperability these fields SHOULD contain a media type {{-media-type}} or content format {{-content-format}} wrapper.
This specation requests IANA assignment of media type and content format identifiers for vLEIs which are serialized as Composable Event Streaming Representation (CESR) {{-cesr}} objects in JSON and other formats.
See {{sec-media-types}}.

<cref anchor="ids-note3" source="Ned Smith">
Note: SATP describes Gateway secure channel establishment public key-pair but this isn't represented in the list of message publickey message types.
Gateway Credential type isn't used in any of the stages afaik.
There should be an IANA registry for the allowed credential types (vLEI, SAML, OAuth, PKIX).
</cref>

## SATP vLEI Mapping {#sec-satp-vlei-mapping}

The SATP protocol {{-satp-core}} defines a set of SATP flows that are divided into protocol message exchange blocks called stages.
The stage-1 messages are illustrated in {{tbl-ent-msg-cred}}.
The SATP entity that authors the various stage-1 messages is also depicted in {{tbl-ent-msg-cred}}.
The authority used to assert SATP messages is based on a cryptographic credential that is used to authenticate the message.
SATP asset transfers depend on properly established organizational authority contexts.
{{tbl-satp-entity}} illustrates the relationships between the various SATP entities, some of which are implied, and the source of authority.
The table is ordered according to an authority hierarchy with the root authority in the first row and leaf entitities on the 6th row.
Authority is therefore cumulative from row to row.
The type of credential used to represent authority is in column 3.

| # | SATP Entity | vLEI Type & Authority Chain | Credential Type | Notes |
|===
| 1 | Root vLEI Issuer *-implied-* | GLEIF | vLEI | Root namespace authority (e.g., GLEIF) |
| 2 | Qualified vLEI Issuer *-implied-* | GLEIF>>QVI | vLEI | Inter organizational namespace authority |
| 3 | Organizational vLEI Issuer *-implied-* | QVI>>LEID | vLEI | Organizational level namespace authority |
| 4 | Originator, Beneficiary, Gateway Owner | LEID>>OORA, LEID>>ECRA, LEID>>OORA>>OOR, LEID>>ECRA>>ECR | vLEI | Person-in-role credential |
| 5 | Gateway / Network Operations Manager / Admin *-implied-* | ECR>>ACDC>>KEL, ECR>>KEL, ECR(as other issuer)>>other | ACDC, KEL, other | Operational credentials (not defined by vLEI) |
| 6 | Sender/Receiver Gateway, Sender/Recipient Network | n/a | KEL, other | Device or system identity |
|===
{: #tbl-satp-entity title="Mapping SATP Entity to vLEI Role" align=left}

{:tbl-cntr1: counter="cntr1" style="format Row %d."}

{: tbl-cntr1}
* GLEIF is a well-known root authority in the vLEI ecosystem.
The GLEIF AID is public knowledge.
* Second tier QVI authorities are credentialed by a root authority.
Typically, second tier authorities are inter-organizational issuing credentials to multiple organizational entities.
* Orgainzational entities use an LEID credential to manage intra-organizational namespaces.
* SATP stage-1 messages imply the existence of oganization level entities such as Originator, Beneficiary, and Gateway Owners.
vLEI defines two forms of person-in-role credentials that map to these SATP entities.
OOR for organizational officers and ECR for oganizational departments or functions.
SATP use cases likely depend on ECR credentials.
A legal entity may delegate credential issuance by naming an alternate legal entity using OOR Authority (OORA) or ECR Authority (ECRA) delegation credentials.
* SATP architecture assumes the existence of intra-organizational entities that manage and adminster networks and servers.
vLEI doesn't define such roles and SATP stage-1 messages don't explicitly mention the existence of such entities.
However, the people responsible for administering and managing the systems that implement SATP message exchange have credentials that tie into the organizational accountability framework envisaged by vLEI.
These credentials can be KERI based (e.g., KEL, ACDC) or other (e.g., PKIX).
* SATP stage-1 messages describe various services and networks that have been credentialed with device or system identities.
These credentials can be KERI based or other.
KERI based credentials reference the key holders AID that is the identity of the gateway or network principal that weilds the corresponding private key.
An PKIX device certificate associates a *subject name* to the public key of the gateway or network principal that weilds the corresponding private key.
A SATP gateway or network can be a principal that has multiple key management subsystems (e.g., KERI and PKIX).

### vLEI Deployment Considerations

SATP deployments could utilize other vLEI roles.
For example, an ECR role might be defined for a SATP Gateway Operations Manager or Network Administrator. See row 4 {{tbl-satp-entity}}.
Although SATP Stage 1 messages don't directly refer to ECR credentials, the credentials referenced could link to ECR credentials which in turn link to ECRA credentials etc...

<cref anchor="ids-note2" source="Ned Smith">
Note: Need to describe how this draft approaches both top-down and bottom-up protocol binding e.g., http and tls.
</cref>

## Key Structures

Keys embedded in hardware or firmware may not easily be converted to an interoperablel format, hence support for multiple key formats ensures the SATP protocols can be implemented by a wide variety of systems.

The SATP PublicKey messages SHALL be encoded using JSON Web Key (JWK) {{-jwk}}, COSE key {{-cose-key}}, PKIX key in PEM or DER, or as key events {{-keri}}.

Other key formats SHOULD be allowed but are out of scope for {{&SELF}}.

## SATP Message Wrapper Schema
The following CDDL {{-cddl}} defines the wrapper and application to SATP fields.

### SATP Transfer Initiation (Stage 1) Message Binding {#sec-stage1}

The SATP stage 1 messages containing identifiers use a vLEI wrapper that contains a payload and payload content identifier.
Other stage 1 messages are public key values that use a key wrapper that disambiguates the key type and format or can be expressed as a wrapped vLEI.

~~~ cddl
{::include cddl/stage1.cddl}
~~~

### vLEI Wrapper {#sec-vlei-wrapper}

~~~ cddl
{::include cddl/wrapped-vlei.cddl}
~~~

### Content References {#sec-content-ref}

~~~ cddl
{::include cddl/content-ref.cddl}
~~~

### Key Wrappers {#sec-wrapped-key}

~~~ cddl
{::include cddl/wrapped-key.cddl}
~~~

## vLEI Media Types {#sec-media-types}

vLEI credentials are expressed as Authentic Chained Data Containers (ACDC) {{-acdc}}.
Section {{sec-iana}} request IANA assignment of media types {{-media-type}} and content format identifiers {{-content-format}}.

SATP core {{-satp-core}} anticipates JSON encoded message.
vLEI credentials can subsequently be JSON encoded while also being CESR {{-cesr}} compliant.
CESR defines JSON, CBOR, MSGPK and native CESR variants.
The follwing media types MAY be used when building credential payloads for SATP:

| Media Types |
|===
| application/cesr+json |
| application/cesr+cbor |
| application/cesr+msgpk |
| application/cesr |
|===
{: #tbl-cesr-media-types title="vLEI media types" align=left}

The media types in {{tbl-cesr-media-types}} have start codes that comply with the media type's structured syntax suffix, but require CESR-aware parsers that can detect them.
The "cesr" subtype informs parsers that they have to do start code look-ahead processing.

The "cesr" subtype also informs parsers that the CESR stream may contain a variety of objects including ACDCs, AIDs, and SAIDs (as mentioned in previous sections of {{&SELF}}).

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
- vLEIs must be validated against the vLEI schema. See {{-gleif-part3}}.

# IANA Considerations {#sec-iana}

## Media Type Assignment

IANA is requested to add the following media types to the "Media Types"
registry {{!IANA.media-types}}.

### application/cesr+json

This media type indicates the payload is a JSON formatted vLEI.

*Type name:*

- application

*Subtype name:*

- cesr+json

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
- Section 9.4 and 9.5 in the CESR specification (cold start) in CESR
- Section 11.5 Version String Field in CESR

*Published specification:*

- {{&SELF}}
- Key Event Receipt Infrastructure (KERI) — {{-keri}}
- Authentictic Chained Data Containers (ACDC) — {{-acdc}}
- Composable Event Streaming Representation (CESR) — {{-cesr}}
- GLEIF vLEI Credential Schema Registry — {{-gleif-part3}}

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

### application/cesr+cbor

*Type name:*

- application

*Subtype name:*

- cesr+cbor

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
- GLEIF vLEI Credential Schema Registry — {{-gleif-part3}}

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

### application/cesr+msgpk

*Type name:*

- application

*Subtype name:*

- cesr+msgpk

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
- GLEIF vLEI Credential Schema Registry — {{-gleif-part3}}

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

### application/cesr

*Type name:*

- application

*Subtype name:*

- cesr

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
- GLEIF vLEI Credential Schema Registry — {{-gleif-part3}}

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

## CoAP Content-Format ID Assignments

IANA is requested to assign the following Content-Format numbers in the
"CoAP Content-Formats" sub-registry, within the "Constrained RESTful
Environments (CoRE) Parameters" Registry {{!IANA.core-parameters}}:

| Content-Type | Content Coding | ID | Reference |
|---
| application/cesr+json | - | TBA1 | {{&SELF}} |
| application/cesr+cbor | - | TBD2 | {{&SELF}} |
| application/cesr+msgpk | - | TBD3 | {{&SELF}} |
| application/cesr | - | TBD4 | {{&SELF}} |
| application/cesr+json;profile=urn:vlei:leid | - | TBA10 | {{&SELF}} |
| application/cesr+json;profile=urn:vlei:ecr | - | TBA11 | {{&SELF}} |
| application/cesr+json;profile=urn:vlei:oor | - | TBA12 | {{&SELF}} |
| application/cesr+json;profile=urn:vlei:oora | - | TBA13 | {{&SELF}} |
| application/cesr+json;profile=urn:vlei:qvi | - | TBA14 | {{&SELF}} |
| application/cesr+json;profile=urn:vlei:ecra | - | TBA15 | {{&SELF}} |
| application/cesr+cbor;profile=urn:vlei:leid | - | TBA20 | {{&SELF}} |
| application/cesr+cbor;profile=urn:vlei:ecr | - | TBA21 | {{&SELF}} |
| application/cesr+cbor;profile=urn:vlei:oor | - | TBA22 | {{&SELF}} |
| application/cesr+cbor;profile=urn:vlei:oora | - | TBA23 | {{&SELF}} |
| application/cesr+cbor;profile=urn:vlei:qvi | - | TBA24 | {{&SELF}} |
| application/cesr+cbor;profile=urn:vlei:ecra | - | TBA25 | {{&SELF}} |
| application/cesr+msgpk;profile=urn:vlei:leid | - | TBA30 | {{&SELF}} |
| application/cesr+msgpk;profile=urn:vlei:ecr | - | TBA31 | {{&SELF}} |
| application/cesr+msgpk;profile=urn:vlei:oor | - | TBA32 | {{&SELF}} |
| application/cesr+msgpk;profile=urn:vlei:oora | - | TBA33 | {{&SELF}} |
| application/cesr+msgpk;profile=urn:vlei:qvi | - | TBA34 | {{&SELF}} |
| application/cesr+msgpk;profile=urn:vlei:ecra | - | TBA35 | {{&SELF}} |
| application/cesr;profile=urn:vlei:leid | - | TBA40 | {{&SELF}} |
| application/cesr;profile=urn:vlei:ecr | - | TBA41 | {{&SELF}} |
| application/cesr;profile=urn:vlei:oor | - | TBA42 | {{&SELF}} |
| application/cesr;profile=urn:vlei:oora | - | TBA43 | {{&SELF}} |
| application/cesr;profile=urn:vlei:qvi | - | TBA44 | {{&SELF}} |
| application/cesr;profile=urn:vlei:ecra | - | TBA45 | {{&SELF}} |
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

Nicholas Racz for review, comments, and ecosystem alignment contributions.

Samuel Smith for review, comments, and KERI ACDC CESR and vLEI insights.

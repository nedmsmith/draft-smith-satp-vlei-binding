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
      Key Event Receipt Infrastructure (KERI) Specification
    author:
      org: Trust Over IP Foundation
    date: 2023
    seriesinfo:
      TOIP: TSWG-KERI-2023
    target: https://github.com/trustoverip/tswg-keri-specification

  ACDC-Spec:
    -: toip-acdc
    title: >
      Authentic Chained Data Containers (ACDC) Specification
    author:
      org: Trust Over IP Foundation
    date: 2023
    seriesinfo:
      TOIP: TSWG-ACDC-2023
    target: https://github.com/trustoverip/tswg-acdc-specification

  CESR-Spec:
    -: toip-cesr
    title: >
      Composable Event Streaming Representation (CESR) Proof Format Specification
    author:
      org: Trust Over IP Foundation
    date: 2023
    seriesinfo:
      TOIP: TSWG-CESR-2023
    target: https://github.com/trustoverip/tswg-cesr-proof-specification

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

TODO Introduction


# Conventions and Definitions {#sec-conv}

{::boilerplate bcp14-tagged}

# Architecture {#sec-arch}

# Identities {#sec-ids}

# Identity Binding {#sec-bind}

# Binding Verification {#sec-verify}

# Security Considerations {#sec-sec}

TODO Security


# IANA Considerations {#sec-iana}

This document has no IANA actions.


--- back

# Acknowledgments
{:numbered="false"}

TODO acknowledge.

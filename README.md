# MyNote
```
Document Identifier:DSP
```
```
Date: 2019-12-
```
```
Version:1.8.
```
# Redfish Specification

**Supersedes: 1.8.**

**Document Class: Normative**

**Document Status:Published**

**Document Language: en-US**


```
Copyright Notice
```
```
Copyright © 2015-2019 DMTF. All rights reserved.
```
DMTF is a not-for-profit association of industry members dedicated to promoting enterprise and systems
management and interoperability. Members and non-members may reproduce DMTF specifications and
documents, provided that correct attribution is given. As DMTF specifications may be revised from time to
time, the particular version and release date should always be noted.

Implementation of certain elements of this standard or proposed standard may be subject to third party
patent rights, including provisional patent rights (herein "patent rights"). DMTF makes no representations
to users of the standard as to the existence of such rights, and is not responsible to recognize, disclose,
or identify any or all such third party patent right, owners or claimants, nor for any incomplete or
inaccurate identification or disclosure of such rights, owners or claimants. DMTF shall have no liability to
any party, in any manner or circumstance, under any legal theory whatsoever, for failure to recognize,
disclose, or identify any such third party patent rights, or for such party's reliance on the standard or
incorporation thereof in its product, protocols or testing procedures. DMTF shall have no liability to any
party implementing such standard, whether such implementation is foreseeable or not, nor to any patent
owner or claimant, and shall have no liability or responsibility for costs or losses incurred if a standard is
withdrawn or modified after publication, and shall be indemnified and held harmless by any party
implementing the standard from any and all claims of infringement by a patent owner for such
implementations.

For information about patents held by third-parties which have notified the DMTF that, in their opinion,
such patent may relate to or impact implementations of DMTF standards, visithttp://www.dmtf.org/about/
policies/disclosures.php.

This document's normative language is English. Translation into other languages is permitted.

Redfish Specification DSP

2 Published Version 1.8.


## CONTENTS





- 1. Abstract..................................................................................................................................................
- 2. Normative references.............................................................................................................................
- 3. Terms and definitions.............................................................................................................................
- 4. Acronyms...............................................................................................................................................
- 5. Overview................................................................................................................................................
   - 5.1. Scope....................................................................................................................................
   - 5.2. Goals.....................................................................................................................................
   - 5.3. Design tenets........................................................................................................................
   - 5.4. Limitations.............................................................................................................................
   - 5.5. Additional design background and rationale.........................................................................
      - 5.5.1. REST-based interface.........................................................................................
      - 5.5.2. Data-oriented.......................................................................................................
      - 5.5.3. Separation of protocol from data model..............................................................
      - 5.5.4. Hypermedia API Service Root.............................................................................
      - 5.5.5. OpenAPI v3.0 support.........................................................................................
      - 5.5.6. OData conventions..............................................................................................
   - 5.6. Service elements..................................................................................................................
      - 5.6.1. Synchronous and asynchronous operation support............................................
      - 5.6.2. Eventing mechanism...........................................................................................
      - 5.6.3. Actions.................................................................................................................
      - 5.6.4. Service discovery................................................................................................
      - 5.6.5. Remote access support.......................................................................................
   - 5.7. Security.................................................................................................................................
- 6. Protocol details.......................................................................................................................................
   - 6.1. Universal Resource Identifiers..............................................................................................
   - 6.2. HTTP methods......................................................................................................................
   - 6.3. HTTP redirect........................................................................................................................
   - 6.4. Media types...........................................................................................................................
   - 6.5. ETags....................................................................................................................................
   - 6.6. Protocol version....................................................................................................................
   - 6.7. Redfish-defined URIs and relative reference rules...............................................................
- 7. Service requests.....................................................................................................................................
   - 7.1. Request headers...................................................................................................................
   - 7.2. GET (read requests).............................................................................................................
      - 7.2.1. Resource collection requests..............................................................................
      - 7.2.2. Service Root request...........................................................................................
      - 7.2.3. OData service and metadata document requests...............................................
   - 7.3. Query parameters.................................................................................................................
      - 7.3.1. The $expand query parameter............................................................................
      - 7.3.2. The $select query parameter...............................................................................
      - 7.3.3. The $filter query parameter.................................................................................
- Version 1.8.1 Published DSP0266 Redfish Specification
   - 7.4. HEAD....................................................................................................................................
   - 7.5. Data modification requests...................................................................................................
      - 7.5.1. Modification success responses..........................................................................
      - 7.5.2. Modification error responses...............................................................................
   - 7.6. PATCH (update)....................................................................................................................
   - 7.7. PATCH on array properties...................................................................................................
   - 7.8. PUT (replace)........................................................................................................................
   - 7.9. POST (create).......................................................................................................................
   - 7.10. DELETE (delete).................................................................................................................
   - 7.11. POST (Action).....................................................................................................................
   - 7.12. Operation apply time...........................................................................................................
- 8. Service responses..................................................................................................................................
   - 8.1. Response headers................................................................................................................
   - 8.2. Link header...........................................................................................................................
   - 8.3. Status codes.........................................................................................................................
   - 8.4. OData metadata responses..................................................................................................
      - 8.4.1. OData $metadata................................................................................................
      - 8.4.2. OData service document.....................................................................................
   - 8.5. Resource responses.............................................................................................................
   - 8.6. Error responses....................................................................................................................
- 9. Data model.............................................................................................................................................
   - 9.1. Resources.............................................................................................................................
   - 9.2. Resource collections.............................................................................................................
   - 9.3. OEM resources.....................................................................................................................
   - 9.4. Common data types..............................................................................................................
      - 9.4.1. Primitive types.....................................................................................................
      - 9.4.2. GUID and UUID values.......................................................................................
      - 9.4.3. Date-Time values.................................................................................................
      - 9.4.4. Duration values....................................................................................................
      - 9.4.5. Reference properties...........................................................................................
      - 9.4.6. Non-resource reference properties......................................................................
      - 9.4.7. Array properties...................................................................................................
      - 9.4.8. Structured properties...........................................................................................
      - 9.4.9. Message object...................................................................................................
   - 9.5. Properties..............................................................................................................................
      - 9.5.1. Resource identifier (@odata.id) property.............................................................
      - 9.5.2. Resource type (@odata.type) property...............................................................
      - 9.5.3. Resource ETag (@odata.etag) property..............................................................
      - 9.5.4. Resource context (@odata.context) property......................................................
      - 9.5.5. Id..........................................................................................................................
      - 9.5.6. Name...................................................................................................................
      - 9.5.7. Description...........................................................................................................
      - 9.5.8. MemberId............................................................................................................
- Redfish Specification DSP
- 4 Published Version 1.8.
      - 9.5.9. Count (Members@odata.count) property............................................................
      - 9.5.10. Members............................................................................................................
      - 9.5.11. Next link (Members@odata.nextLink) property.................................................
      - 9.5.12. Links..................................................................................................................
      - 9.5.13. Actions...............................................................................................................
      - 9.5.14. Oem...................................................................................................................
      - 9.5.15. Status................................................................................................................
   - 9.6. Resource, schema, property, and URI naming conventions.................................................
   - 9.7. Resource extensibility...........................................................................................................
      - 9.7.1. OEM property format and content.......................................................................
      - 9.7.2. OEM property naming.........................................................................................
      - 9.7.3. OEM resource naming and URIs.........................................................................
      - 9.7.4. OEM property examples......................................................................................
      - 9.7.5. OEM actions........................................................................................................
   - 9.8. Payload annotations.............................................................................................................
      - 9.8.1. Allowable values..................................................................................................
      - 9.8.2. Extended information...........................................................................................
      - 9.8.3. Action info annotation..........................................................................................
      - 9.8.4. Settings and settings apply time annotations......................................................
      - 9.8.5. Operation apply time and operation apply time support annotations..................
      - 9.8.6. Maintenance window annotation.........................................................................
      - 9.8.7. Collection capabilities annotation........................................................................
      - 9.8.8. Requested count and allow over-provisioning annotations.................................
      - 9.8.9. Zone affinity annotation.......................................................................................
      - 9.8.10. Supported certificates annotation......................................................................
      - 9.8.11. Deprecated annotation.......................................................................................
   - 9.9. Settings resource..................................................................................................................
   - 9.10. Special resource situations.................................................................................................
      - 9.10.1. Overview............................................................................................................
      - 9.10.2. Absent resources...............................................................................................
   - 9.11. Registries............................................................................................................................
   - 9.12. Schema annotations...........................................................................................................
      - 9.12.1. Description annotation.......................................................................................
      - 9.12.2. Long description annotation..............................................................................
      - 9.12.3. Resource capabilities annotation.......................................................................
      - 9.12.4. Resource URI patterns annotation....................................................................
      - 9.12.5. Additional properties annotation........................................................................
      - 9.12.6. Permissions annotation.....................................................................................
      - 9.12.7. Required annotation..........................................................................................
      - 9.12.8. Required on create annotation..........................................................................
      - 9.12.9. Units of measure annotation............................................................................
      - 9.12.10. Expanded resource annotation......................................................................
      - 9.12.11. Owning entity annotation...............................................................................
- Version 1.8.1 Published DSP0266 Redfish Specification
   - 9.13. Versioning.........................................................................................................................
   - 9.14. Localization.......................................................................................................................
- 10. File naming and publication................................................................................................................
   - 10.1. Registry file naming..........................................................................................................
   - 10.2. Profile file naming.............................................................................................................
   - 10.3. Dictionary file naming........................................................................................................
   - 10.4. Localized file naming........................................................................................................
   - 10.5. DMTF Redfish file repository............................................................................................
- 11. Schema definition languages..............................................................................................................
   - 11.1. OData Common Schema Definition Language.................................................................
      - 11.1.1. File naming conventions for CSDL..................................................................
      - 11.1.2. Core CSDL files...............................................................................................
      - 11.1.3. CSDL format....................................................................................................
      - 11.1.4. Elements of CSDL namespaces......................................................................
   - 11.2. JSON Schema...................................................................................................................
      - 11.2.1. File naming conventions for JSON Schema....................................................
      - 11.2.2. Core JSON Schema files.................................................................................
      - 11.2.3. JSON Schema format......................................................................................
      - 11.2.4. JSON Schema definitions body.......................................................................
      - 11.2.5. JSON Schema terms.......................................................................................
   - 11.3. OpenAPI............................................................................................................................
      - 11.3.1. File naming conventions for OpenAPI schema................................................
      - 11.3.2. Core OpenAPI schema files.............................................................................
      - 11.3.3. openapi.yaml....................................................................................................
      - 11.3.4. OpenAPI file format..........................................................................................
      - 11.3.5. OpenAPI components body.............................................................................
      - 11.3.6. OpenAPI terms used by Redfish......................................................................
   - 11.4. Schema modification rules................................................................................................
- 12. Service details....................................................................................................................................
   - 12.1. Eventing............................................................................................................................
      - 12.1.1. POST to subscription collection.......................................................................
      - 12.1.2. Open an SSE connection................................................................................
      - 12.1.3. EventType-based eventing..............................................................................
      - 12.1.4. Subscribing to events......................................................................................
      - 12.1.5. Event formats..................................................................................................
      - 12.1.6. OEM extensions..............................................................................................
   - 12.2. Asynchronous operations.................................................................................................
   - 12.3. Resource tree stability......................................................................................................
   - 12.4. Discovery..........................................................................................................................
      - 12.4.1. UPnP compatibility..........................................................................................
      - 12.4.2. USN format......................................................................................................
      - 12.4.3. M-SEARCH response......................................................................................
      - 12.4.4. Notify, alive, and shutdown messages.............................................................
- Redfish Specification DSP
- 6 Published Version 1.8.
   - 12.5. Server-Sent Events...........................................................................................................
      - 12.5.1. General............................................................................................................
      - 12.5.2. Event Service..................................................................................................
   - 12.6. Update Service.................................................................................................................
      - 12.6.1. Overview............................................................................................................
      - 12.6.2. Software update types.....................................................................................
- 13. Security details...................................................................................................................................
   - 13.1. Transport Layer Security (TLS) protocol...........................................................................
      - 13.1.1. Cipher suites....................................................................................................
      - 13.1.2. Certificates.......................................................................................................
   - 13.2. Operations that contain sensitive data..............................................................................
   - 13.3. Authentication...................................................................................................................
      - 13.3.1. HTTP header security......................................................................................
      - 13.3.2. HTTP redirect....................................................................................................
      - 13.3.3. Extended error handling..................................................................................
      - 13.3.4. HTTP header authentication............................................................................
      - 13.3.5. Session management......................................................................................
      - 13.3.6. Account Service...............................................................................................
      - 13.3.7. Password management...................................................................................
      - 13.3.8. Asynchronous tasks........................................................................................
      - 13.3.9. Event subscriptions.........................................................................................
      - 13.3.10. Privilege model and authorization.................................................................
      - 13.3.11. Redfish Service operation-to-privilege mapping............................................
- 14. Redfish Host Interface........................................................................................................................
- 15. Redfish Composability........................................................................................................................
   - 15.1. Composition requests.......................................................................................................
      - 15.1.1. Specific composition........................................................................................
      - 15.1.2. Constrained composition.................................................................................
      - 15.1.3. Expandable resources.....................................................................................
   - 15.2. Updating a composed resource........................................................................................
- 16. ANNEX A (informative).......................................................................................................................
   - 16.1. Change log........................................................................................................................
- Version 1.8.1 Published DSP0266 Redfish Specification


# Foreword

The Redfish Forum of the DMTF develops the Redfish standard.

DMTF is a not-for-profit association of industry members that promotes enterprise and systems
management and interoperability. For information about the DMTF, seehttps://www.dmtf.org/.

Redfish Specification DSP

8 Published Version 1.8.


# Acknowledgments

The DMTF acknowledges the following individuals for their contributions to the Redfish standard,
including this document and Redfish schemas, interoperability profiles, and Message Registries:

- Rafiq Ahamed - Hewlett Packard Enterprise
- Richelle Ahlvers - Broadcom Inc.
- Jeff Autor - Hewlett Packard Enterprise
- David Black - Dell Inc.
- Jeff Bobzin - Insyde Software Corp.
- Patrick Boyd - Dell Inc.
- David Brockhaus - Vertiv
- Richard Brunner - VMware Inc.
- Sean Byland - Cray Inc.
- Lee Calcote - Seagate Technology
- Keith Campbell - Lenovo
- P Chandrasekhar - Dell Inc.
- Barbara Craig - Hewlett Packard Enterprise
- Chris Davenport - Hewlett Packard Enterprise
- Gamma Dean - Vertiv
- Daniel Dufresne - Dell Inc.
- Samer El-Haj-Mahmoud - Arm Limited, Lenovo, Hewlett Packard Enterprise
- George Ericson - Dell Inc.
- Wassim Fayed - Microsoft Corporation
- Kevin Ferguson - Vertiv
- Mike Garrett - Hewlett Packard Enterprise
- Steve Geffin - Vertiv
- Joe Handzik - Hewlett Packard Enterprise
- Jon Hass - Dell Inc.
- Jeff Hilland - Hewlett Packard Enterprise
- Chris Hoffman - Vertiv
- Cactus Jiang - Vertiv
- Barry Kittner - Intel Corporation
- Steven Krig - Intel Corporation
- Jennifer Lee - Intel Corporation
- John Leung - Intel Corporation
- Steve Lyle - Hewlett Packard Enterprise
- Jagan Molleti - Dell Inc.

DSP0266 Redfish Specification

Version 1.8.1 Published 9


- Milena Natanov - Microsoft Corporation
- Scott Phuong - Cisco Systems, Inc.
- Michael Pizzo - Microsoft Corporation
- Chris Poblete - Dell Inc.
- Michael Raineri - Dell Inc.
- Irina Salvan - Microsoft Corporation
- Bill Scherer - Hewlett Packard Enterprise
- Hemal Shah - Broadcom Inc.
- Jim Shelton - Vertiv
- Tom Slaight - Intel Corporation
- Josiah Smith - Eaton
- Donnie Sturgeon - Vertiv
- Pawel Szymanski - Intel Corporation
- Paul Vancil - Dell Inc.
- Joseph White - Dell Inc.
- Linda Wu - NVIDIA Corporation, Super Micro Computer, Inc.

Redfish Specification DSP

10 Published Version 1.8.


## 1. Abstract..................................................................................................................................................

Redfish is a standard that uses RESTful interface semantics to access a schema based data model to
conduct management operations. It is suitable for a wide range of devices, from stand-alone servers, to
composable infrastructures, and to large-scale cloud environments.

The initial Redfish scope targeted servers.

The DMTF and its alliance partners expanded that scope to cover most data center IT equipment and
other solutions, and both in- and out-of-band access methods.

Additionally, the DMTF and other organizations that use Redfish as part of their industry standard or
solution have added educational material.

## 2. Normative references.............................................................................................................................

The following referenced documents are indispensable for the application of this document. For dated or
versioned references, only the edition cited (including any corrigenda or DMTF update versions) applies.
For references without a date or version, the latest published edition of the referenced document
(including any corrigenda or DMTF update versions) applies.

- Architectural Styles and the Design of Network-based Software Architectures, R. Fielding, 2000.
    https://www.ics.uci.edu/~fielding/pubs/dissertation/top.htm
- DMTF DSP0270 Redfish Host Interface Specification,https://www.dmtf.org/sites/default/files/
    standards/documents/DSP0270_1.0.pdf
- HTML Living Standard: Server-sent eventshttps://html.spec.whatwg.org/multipage/server-sent-
    events.html
- ISO 639-1:2002ISO 639-1:2002 Codes for the representation of names of languages -- Part 1:
    Alpha-2 code
- IETF RFC1738, T. Berners-Lee et al, Uniform Resource Locators (URL),https://www.ietf.org/rfc/
    rfc1738.txt
- IETF RFC3986, T. Berners-Lee et al, Uniform Resource Identifier (URI): Generic Syntax,
    https://www.ietf.org/rfc/rfc3986.txt
- IETF RFC4627, D. Crockford, The application/json Media Type for JavaScript Object Notation
    (JSON),https://www.ietf.org/rfc/rfc4627.txt
- IETF RFC5280, D. Cooper et al, Internet X.509 Public Key Infrastructure Certificate and
    Certificate Revocation List (CRL) Profile,https://www.ietf.org/rfc/rfc5280.txt
- IETF RFC5288, J. Salowey et al, AES Galois Counter Mode (GCM) Cipher Suites for TLS,
    https://www.ietf.org/rfc/rfc5288.txt
- IETF RFC5487, M. Badra et al, Pre-Shared Key Cipher Suites for TLS with SHA-256/384 and
    AES Galois Counter Mode,https://www.ietf.org/rfc/rfc5487.txt

DSP0266 Redfish Specification

Version 1.8.1 Published 11


- IETF RFC5789, L. Dusseault et al, PATCH Method for HTTP,https://www.ietf.org/rfc/rfc5789.txt
- IETF RFC5988, M. Nottingham, Web Linking,https://www.ietf.org/rfc/rfc5988.txt
- IETF RFC6585, M. Nottingham, et al, Additional HTTP Status Codes,https://www.ietf.org/rfc/
    rfc6585.txt
- IETF RFC6901, P. Bryan, Ed. et al, JavaScript Object Notation (JSON) Pointer,
    https://www.ietf.org/rfc/rfc6901.txt
- IETF RFC6906, E. Wilde, The 'profile' Link Relation Type,https://www.ietf.org/rfc/rfc6906.txt
- IETF RFC7230, R. Fielding et al., Hypertext Transfer Protocol (HTTP/1.1): Message Syntax and
    Routing,https://www.ietf.org/rfc/rfc7230.txt
- IETF RFC7231, R. Fielding et al., Hypertext Transfer Protocol (HTTP/1.1): Semantics and
    Content,https://www.ietf.org/rfc/rfc7231.txt
- IETF RFC7232, R. Fielding et al., Hypertext Transfer Protocol (HTTP/1.1): Conditional
    Requests,https://www.ietf.org/rfc/rfc7232.txt
- IETF RFC7234, R. Fielding et al., Hypertext Transfer Protocol (HTTP/1.1): Caching,
    https://www.ietf.org/rfc/rfc7234.txt
- IETF RFC7578, L. Masinter et al., Returning Values from Forms: multipart/form-data,
    https://www.ietf.org/rfc/rfc7578.txt
- IETF RFC7617, J. Reschke et al., The 'Basic' HTTP Authentication Scheme,https://www.ietf.org/
    rfc/rfc7617.txt
- ISO/IEC Directives, ISO/IEC Directives, Part 2 (English),https://isotc.iso.org/livelink/
    livelink.exe?func=ll&objId=4230456&objAction=browse&sort=subtypeH
- JSON Schema: A Media Type for Describing JSON Documents draft-handrews-json-schema-01,
    https://tools.ietf.org/html/draft-handrews-json-schema-
- JSON Schema Validation: A Vocabulary for Structural Validation of JSON draft-handrews-json-
    schema-validation-01,https://tools.ietf.org/html/draft-handrews-json-schema-validation-
- OData Version 4.0 Plus Errata 03: Core Vocabulary. 10 March 2016.https://docs.oasis-open.org/
    odata/odata/v4.0/errata03/csd01/complete/vocabularies/Org.OData.Core.V1.xml
- OData JSON Format Version 4.0. 24 February 2014.https://docs.oasis-open.org/odata/odata-
    json-format/v4.0/os/odata-json-format-v4.0-os.html
- OData Version 4.0 Part 1: Protocol. 24 February 2014.https://docs.oasis-open.org/odata/odata/
    v4.0/os/part1-protocol/odata-v4.0-os-part1-protocol.html
- OData Version 4.0 Part 2: URL Conventions. 24 February 2014.https://docs.oasis-open.org/
    odata/odata/v4.0/os/part2-url-conventions/odata-v4.0-os-part2-url-conventions.html
- OData Version 4.0 Part 3: Common Schema Definition Language (CSDL). 24 February 2014.
    https://docs.oasis-open.org/odata/odata/v4.0/os/part3-csdl/odata-v4.0-os-part3-csdl.html
- OData Version 4.0 Plus Errata 03: Units of Measure Vocabulary. 10 March 2016.
    https://docs.oasis-open.org/odata/odata/v4.0/errata03/csd01/complete/vocabularies/
    Org.OData.Measures.V1.xml
- The OpenAPI Specificationhttps://github.com/OAI/OpenAPI-Specification
- Redfish Schema: RedfishExtensions.https://redfish.dmtf.org/schemas/v1/
    RedfishExtensions_v1.xml
- Simple Service Discovery Protocol/1.0 Operating without an Arbiter. 28 October 1999.
    https://tools.ietf.org/html/draft-cai-ssdp-v1-

Redfish Specification DSP

12 Published Version 1.8.


- SNIA TLS Specification for Storage Systems. 20 November 2014.https://www.snia.org/
    tech_activities/standards/curr_standards/tls
- The Unified Code for Units of Measure.https://www.unitsofmeasure.org/ucum.html
- W3C Cross-Origin Resource Sharing. 16 January 2014.https://www.w3.org/TR/cors/

## 3. Terms and definitions.............................................................................................................................

Some terms and phrases in this document have specific meanings beyond their typical English meanings.
This clause defines those terms and phrases.

The terms "shall" ("required"), "shall not", "should" ("recommended"), "should not" ("not recommended"),
"may", "need not" ("not required"), "can" and "cannot" in this document are to be interpreted as described
in ISO/IEC Directives, Part 2, Clause 7. The terms in parenthesis are alternatives for the preceding term,
for use in exceptional cases when the preceding term cannot be used for linguistic reasons. Note that
ISO/IEC Directives, Part 2, Clause 7 specifies additional alternatives. Occurrences of such additional
alternatives shall be interpreted in their normal English meaning.

The terms "clause", "subclause", "paragraph", and "annex" in this document are to be interpreted as
described in ISO/IEC Directives, Part 2, Clause 6.

The terms "normative" and "informative" in this document are to be interpreted as described in ISO/IEC
Directives, Part 2, Clause 3. In this document, clauses, subclauses, or annexes labeled "(informative)" do
not contain normative content. Notes and examples are always informative elements.

This document defines these additional terms:

```
Term Definition
```
```
baseboardmanagementcontroller
(BMC)
```
```
Embedded device or service. Typically an independent
microprocessor or system-on-chip with associated firmware in
a computer system that completes out-of-band systems
monitoring and management-related tasks.
```
```
collection Seeresource collection.
```
##### CRUD

```
Basic C reate, R ead, U pdate, and D elete operations that any
interface can support.
```
```
event Data structure that corresponds to one or more alerts.
```
```
excerpt
```
```
Subset of data that is copied from one resource and
presented in another resource. An excerpt provides data in
convenient locations without duplication of entire resources.
```
DSP0266 Redfish Specification

Version 1.8.1 Published 13


```
Term Definition
```
```
hypermedia API
API that enables you to navigate through URIs that a service
returns.
```
```
managed system
System that provides information, status, or control through a
Redfish-defined interface.
```
```
member Singleresourceinstance in aresource collection.
```
```
message
```
```
Complete HTTP- or HTTPS-formatted request or response. In
the REST-based Redfish protocol, every request should result
in a response.
```
```
OData service document
Resource that provides information about theService Rootfor
generic OData clients.
```
```
OData Open Data Protocol, as defined inOData-Protocol.
```
```
operation
HTTP POST, GET, PUT, PATCH, HEAD, and DELETE
request methods that map to genericCRUDoperations.
```
```
property
Name-and-value pair in a Redfish-defined request or
response. A property can be any valid JSON data type.
```
```
Redfish client
Communicates with aRedfish Serviceand accesses one or
more of the service's resources or functions.
```
```
Redfish event receiver
Software that runs at the event destination that receives
events from aRedfish Service.
```
```
Redfish protocol
Discovers, connects to, and inter-communicates with a
Redfish Service.
```
```
Redfish provider
```
```
Interacts with a Redfish Service to contribute resources to the
Redfish resource tree and reacts to changes in its resources.
```
```
Redfish providers include:
```
- **Internal provider.** The Redfish Service itself that
    has a data model and can react to RESTful
    operations from a client.
- **External provider.** A designed means for agents
    external to the Redfish Service to augment the
    Redfish resource tree.

Redfish Specification DSP

14 Published Version 1.8.


```
Term Definition
```
```
This specification does not describe the interaction between a
Redfish provider and a Redfish Service.
```
```
Redfish schema
```
```
Defines Redfish resources according to OData schema
representation. You can directly translate a Redfish schema
to a JSON Schema representation.
```
```
Redfish Service
```
```
Implementation of the protocols, resources, and functions that
deliver the interface that this specification defines and its
associated behaviors for one or moremanaged systems. Also
known as the service.
```
```
request Message from a client to a service.
```
```
resource collection
Set of similar resources where the number of instances can
shrink or grow.
```
```
resource tree
```
```
Tree structure of resources accessible through a well-known
starting URI. A client may discover the available resources on
a Redfish Service by following the resource hyperlinks from
the base of the tree.
```
```
resource Redfish data structure that is addressable by a URI.
```
```
response
Message from a service to a client in response to a request
message.
```
```
Service Root
```
```
Starting-point resource for locating and accessing the other
resources and associated metadata that make up an instance
of a Redfish Service.
```
```
subscription Registration of a destination to receive events.
```
```
task Representation of a long-runningoperation.
```
```
task monitor
Opaque service-generated URI that the client who initiates
the request can use to monitor anasynchronous operation.
```
## 4. Acronyms...............................................................................................................................................

This document uses these acronyms:

DSP0266 Redfish Specification

Version 1.8.1 Published 15


```
Acronym Definition
```
```
BMC Baseboard management controller
```
```
CORS Cross-origin resource sharing
```
```
CRUD Create, read, update, and delete
```
```
CSRF Cross-Site Request Forgery
```
```
HTTP Hypertext Transfer Protocol
```
```
HTTPS Hypertext Transfer Protocol over TLS
```
```
IP Internet Protocol
```
```
IPMI Intelligent Platform Management Interface
```
```
JSON JavaScript Object Notation
```
```
KVM-IP Keyboard, Video, Mouse redirection over IP
```
```
NIC Network interface controller
```
```
PCI Peripheral Component Interconnect
```
```
PCIe Peripheral Component Interconnect Express
```
```
TCP Transmission Control Protocol
```
```
XSS Cross-site scripting
```
## 5. Overview................................................................................................................................................

Redfish is a management standard that uses a data model representation with a RESTful interface.

Being RESTful, Redfish is easier to use and implement.

Being model-oriented, it can express the relationships between components and the semantics of the
Redfish Services and components within them. The model is also easy to extend.

By requiring JSON representation, Redfish enables easy integration with programming environments. It is
also easy to interpret by humans.

An interoperable Redfish schema defines this model, which is freely available and published in OpenAPI
YAML, OData CSDL, and JSON Schema formats.

Redfish Specification DSP

16 Published Version 1.8.


### 5.1. Scope....................................................................................................................................

This specification defines the required protocols, data model, behaviors, and other architectural
components for an interoperable, multivendor, remote, and out-of-band capable interface. This interface
meets the cloud-based and web-based IT professionals' expectations for scalable platform management.
While large and hyperscale environments are the primary focus, clients can use the specification for
individual system management.

The specification defines the required elements for all Redfish implementations, and the optional
elements that system vendors and manufacturers can choose. This specification also defines at which
points an implementation can provide OEM-specific extensions.

The specification sets normative requirements for _Redfish Services_ and associated materials, such as
Redfish schema files. In general, the specification does not set requirements for Redfish clients but
indicates what a client should do to successfully and effectively access and use a Redfish Service.

The specification does not require that implementations of the Redfish interfaces and functions require
particular hardware or firmware.

### 5.2. Goals.....................................................................................................................................

As an architecture, data representation, and definition of protocols that enable a client to access Redfish
Services, Redfish has these goals:

```
Goal Purpose
```
```
Scalable Can scale on stand-alone machines or racks of equipment.
```
```
Flexible Can implement through existing hardware or entirely as a software service.
```
```
Extensible Can easily add new and vendor-specific capabilities to the data model.
```
```
Backward-
compatible
Can add capabilities while preserving investments in earlier implementations.
```
```
Interoperable Provides consistent functionality across multiple vendor implementations.
```
```
Standards-
based
```
```
Built on ubiquitous and secure protocols. Leverages other standards where
applicable.
```
```
Simple
Easy-to-use without the need for highly specialized programming skills or
systems knowledge.
```
```
Lightweight
Designed to reduce complexity and implementation costs. Minimizes the required
footprint for implementations.
```
DSP0266 Redfish Specification

Version 1.8.1 Published 17


### 5.3. Design tenets........................................................................................................................

To deliver these goals, Redfish:

- Provides a RESTful interface by using a JSON payload and a data model.
- Separates the protocol from the data model, which enables the independent revision and use of
    each.
- Specifies versioning rules for protocols and schema.
- Leverages strength of ubiquitous standards where it meets architectural requirements, such as
    JSON, HTTP, OData, OpenAPI, and the RFCs that this document references.
- Organizes the data model so that it provides clearly demarcated and value-add features in the
    same payload as standardized items.
- Makes data in payloads as obvious in context as possible.
- Maintains implementation flexibility. Does not tie the interface to any particular underlying
    implementation or architecture.
- Focuses on widely used capabilities. To avoid complexity, does not add functions that only a
    small percentage of users value.

### 5.4. Limitations.............................................................................................................................

Redfish minimizes the need for clients to complete upgrades by using strict versioning and forward-
compatibility rules, and separation of the protocols from the data model. However, Redfish does not
guarantee that clients never need to update their software. For example, clients might need to upgrade to
manage new system or component types, or update the data model.

Interoperable does not mean identical. Many elements of Redfish are optional. Clients should be
prepared to discover the optional elements by using the built-in discovery methods.

The _resource tree_ reflects the topology of the system and its devices. Consequently, different hardware or
device types result in different resource trees, even for identical systems from the same manufacturer.
References between resources may result in a graph instead of a tree. Clients that traverse the resource
tree should provide logic to avoid infinite loops.

Additionally, not all Redfish resources use simple REST read-and-write semantics. Different use cases
may follow other types of client logic. For example, clients cannot simply read user credentials or
certificates from one service and write them to another service.

Finally, the hyperlink values between resources and other elements can vary across implementations.
Clients should not assume that they can reuse hyperlinks across different Redfish Service instances.

Redfish Specification DSP

18 Published Version 1.8.


### 5.5. Additional design background and rationale.........................................................................

#### 5.5.1. REST-based interface.........................................................................................

Redfish exposes many service applications as RESTful interfaces. This document defines a RESTful
interface.

Redfish defines a RESTful interface because it:

- Enables a lightweight implementation, using fewer layers than previous standards.
- Is a prevalent access method in the industry.
- Is easy to learn, document, and implement in modern programming languages.
- Has a number of development environments and a healthy tooling ecosystem.
- Fits with the design goal of simplicity.
- Equally applies to software application space as it does to embedded environments, which
    enables convergence and sharing of code within the management ecosystem.
- Adapts well to any data modeling language.
- Has industry-provided security and discovery mechanisms.

#### 5.5.2. Data-oriented.......................................................................................................

The Redfish data model is developed by focusing on the contents of the payload. By concentrating on the
contents of the payload first, Redfish payloads are easily mapped to schema definition languages and
encoding types. The data model is defined in various schema languages, including OpenAPI YAML,
OData CSDL, and JSON Schema.

#### 5.5.3. Separation of protocol from data model..............................................................

Redfish separates the protocol operations from the data model and versions the protocol independently
from the data model. This enables clients to extend and change the data model as needed without
requiring the protocol version to change.

#### 5.5.4. Hypermedia API Service Root.............................................................................

Redfish has a single Service Root URI and clients can discover all resources through referenced URIs.
The _hypermedia API_ enables the discovery of resources through hyperlinks.

#### 5.5.5. OpenAPI v3.0 support.........................................................................................

The OpenAPI v3.0 provides a rich ecosystem of tools for using RESTful interfaces that meet the design
requirements of that specification. Starting with Redfish Specification v1.6.0, the Redfish schemas
support the OpenAPI YAML file format and URI patterns that conform to the OpenAPI Specification were
defined. Conforming Redfish Services that support the Redfish protocol version v1.6.0 or later implement

DSP0266 Redfish Specification

Version 1.8.1 Published 19


those URI patterns to enable use of the OpenAPI ecosystem.

For details, seeOpenAPI Specification v3.0.

#### 5.5.6. OData conventions..............................................................................................

With the popularity of RESTful APIs, there are nearly as many RESTful interfaces as there are
applications. While following REST patterns helps promote good practices, due to design differences
between the many RESTful APIs there few common conventions between them.

To provide for interoperability between APIs,ODatadefines a set of common RESTful conventions and
annotations. Redfish adopts OData conventions for describing schema, URL conventions, and definitions
for typical properties in a JSON payload.

### 5.6. Service elements..................................................................................................................

#### 5.6.1. Synchronous and asynchronous operation support............................................

Some operations can take more time than a client typically wants to wait. For this reason, some
operations can be asynchronous at the discretion of the service. The request portion of an asynchronous
operation is no different from the request portion of a synchronous operation.

To determine whether an operation was completed synchronously or asynchronously, clients can review
theHTTP status codes. For more information, see theAsynchronous operationsclause.

#### 5.6.2. Eventing mechanism...........................................................................................

Redfish enables clients to receive messages outside the normal request and response paradigm. The
service uses these messages, or _events_ , to asynchronously notify the client of a state change or error
condition, usually of a time critical nature.

This specification defines two styles of eventing:

- Push-style eventing.

```
When the service detects the need to send an event, it calls HTTP POST to push the event
message to the client. Clients can enable reception of events by creating a subscription entry in
the Event Service, or an administrator can create subscriptions as part of the Redfish Service
configuration.
```
- Server-Sent Events (SSE)-style eventing.

```
The client opens an SSE connection to the service through a GET on the
ServerSentEventUri-specified URI in the Event Service.
```
Redfish Specification DSP

20 Published Version 1.8.


For information, see theEventingclause.

#### 5.6.3. Actions.................................................................................................................

Actions are Redfish operations that do not easily map to RESTful interface semantics. These types of
operations may not directly affect properties in the Redfish resources. The Redfish schema defines
certain standard actions for common Redfish resources. For these standard actions, the Redfish schema
contains the normative language on the behavior of the action.

#### 5.6.4. Service discovery................................................................................................

While the service itself is at a well-known URI, clients need to discover the network address of the
service. Like UPnP, Redfish uses SSDP for discovery. A wide variety of devices, such as printers and
client operating systems, support SSDP. It is simple, lightweight, IPv6 capable, and suitable for
implementation in embedded environments.

For more information, see theDiscoveryclause.

#### 5.6.5. Remote access support.......................................................................................

Remote management functionality typically includes access mechanisms for redirecting operator
interfaces such as serial console, keyboard video and mouse (KVM-IP), command shell, or command-line
interface, and virtual media. While these mechanisms are critical functionality, they cannot be reasonably
implemented as a RESTful interface.

Therefore, this standard does not define the protocols or access mechanisms for those services but
encourages implementations that leverage existing standards. However, the Redfish schema includes
resources and properties that enable client discovery of these capabilities and access mechanisms to
enable interoperability.

### 5.7. Security.................................................................................................................................

The challenge of remote interface security is to protect both the interface and exchanged data. To
accomplish this, Redfish provides authentication and encryption. As part of this security, Redfish defines
and requires minimum levels of encryption.

For more information, see theSecurity detailsclause.

## 6. Protocol details.......................................................................................................................................

In this document, the Redfish protocol refers to the RESTful mapping to HTTP, TCP/IP, and other
protocol, transport, and messaging layer aspects. HTTP is the application protocol that transports the

DSP0266 Redfish Specification

Version 1.8.1 Published 21


messages and TCP/IP is the transport protocol. The RESTful interface is a mapping to the message
protocol.

The Redfish protocol is designed around a web service-based interface model. This provides network and
interaction efficiency for both user interface (UI) and automation usage. Specifically, the protocol can
leverage existing tool chains.

The Redfish protocol uses these items for these purposes:

```
Item Purpose
```
```
HTTP methods Maps to common CRUD operations.
```
```
Actions Expands operations beyond CRUD-type operations.
```
```
Media types Negotiates the type of data sent in the message body.
```
```
HTTP status codes Indicates the success or failure of the server's request.
```
```
Error responses Returns more information than HTTP status codes.
```
```
TLS Secures messages. SeeSecurity details.
```
```
Asynchronous semantics For long-running operations.
```
A Redfish interface shall be exposed through a web service endpoint implemented by using HTTP
version 1.1. SeeRFC7230,RFC7231, andRFC7232.

The subsequent clauses describe how the Redfish interface uses and adds constraints to HTTP to
ensure interoperability of Redfish implementations.

### 6.1. Universal Resource Identifiers..............................................................................................

A Universal Resource Identifier (URI) identifies a resource, including the Service Root and all Redfish
resources.

- A URI shall identify each unique instance of a resource.
- URIs shall not include anyRFC1738-defined unsafe characters.
    ◦ For example, the **{** , **}** ,, **|** , **^** , **~** , **[** , **]** , **`** , and **\** characters are unsafe because gateways
       and other transport agents can sometimes modify these characters.
    ◦ Do not use the **#** character for anything other than the start of a fragment.
- URIs shall not include any percent-encoding of characters. This restriction does not apply to the
    query parametersportion of the URI.

Performing a GET operation on a URI returns a representation of the resource with properties and

Redfish Specification DSP0266

22 Published Version 1.8.1


hyperlinks to associated resources. The Service Root URI is well known and is based on the protocol
version.

To discover the URIs to additional resources, extract the associated resource hyperlinks from earlier
responses. The _hypermedia API_ enables the discovery of resources through hyperlinks.

Redfish considers theRFC3986-defined scheme, authority, Service Root, and version, and unique
resource path component parts of the URI.

For example, this URI:

```
https://mgmt.vendor.com/redfish/v1/Systems/1
```
Contains these component parts:

```
Componentpart Defines
```
```
https: Scheme.
```
```
mgmt.vendor.com Authority to which to delegate the URI.
```
```
redfish/v1 Service Root and version.
```
```
Systems/1 Unique resource path.
```
In a URI:

- The scheme and authority component parts are not part of the unique resource path because
    redirection capabilities and local operations may cause the connection portion to vary.
- The Service Root and resource path component parts _uniquely identify_ the resource in a Redfish
    Service.

In an implementation:

- The resource path component part shall be unique.
- Arelative referencein the body and HTTP headers payload can identify a resource in that same
    implementation.
- An absolute URI in the body and HTTP headers payload can identify a resource in a different
    implementation.

For the absolute URI definition, seeRFC3986.

For example, a POST operation may return the/redfish/v1/Systems/2URI in theLocation
header of the response, which points to the POST-created resource.

DSP0266 Redfish Specification

Version 1.8.1 Published 23


Assuming that the client connects through themgmt.vendor.comappliance, the client accesses the
resource through thehttps://mgmt.vendor.com/redfish/v1/Systems/2absolute URI.

URIs that conform toRFC3986may also contain the query,?query, and frag,#frag, components. For
information about queries, seeQuery parameters. When a URI includes a fragment (frag) to submit an
operation, the server ignores the fragment.

If a property in a response references another property within a resource, use theRFC6901-defined URI
fragment identifier representation format. If the property is areference propertyin the schema, the
fragment shall reference a validresource identifier. For example, the following fragment identifies a
property at index 0 of theFansarray in the/redfish/v1/Chassis/MultiBladeEncl/Thermal
resource:

```
{
"@odata.id":"/redfish/v1/Chassis/MultiBladeEncl/Thermal#/Fans/0"
}
```
For requirements on constructing Redfish URIs, see theresource URI patterns annotationclause.

### 6.2. HTTP methods......................................................................................................................

The following table describes the mapping of HTTP methods to the operations that are supported by
Redfish. The **Required** column specifies whether a Redfish interface supports the method.

- If the value is **Yes** , the HTTP method shall be supported.
- If the value is **No** , the value may be supported.

For HTTP methods that the Redfish Service does not support or that the following table omits, the
Redfish Service shall return the HTTP405 Method Not Allowedstatus code.

```
HTTPmethod Interfacesemantic Required
```
##### POST

```
Resource create
Resource action
Eventing
```
```
Yes
```
```
GET Resource retrieval Yes
```
```
PUT Resource replace No
```
```
PATCH Resource update Yes
```
```
DELETE Resource delete Yes
```
Redfish Specification DSP0266

24 Published Version 1.8.1


```
HTTPmethod Interfacesemantic Required
```
```
HEAD Resource header retrieval No
```
##### OPTIONS

```
Header retrieval
Cross-origin resource sharing (CORS) preflight
No
```
### 6.3. HTTP redirect........................................................................................................................

HTTP redirect enables a service to redirect a request to another URL. Among other things, HTTP redirect
enables Redfish resources to alias areas of the data model.

- All Redfish clients shall correctly handle HTTP redirect.

```
Note: For security implications of HTTP redirect, seeSecurity details.
```
### 6.4. Media types...........................................................................................................................

Some resources may be available in more than one type of representation. The media type indicates the
representation type.

In HTTP messages, the media type is specified in theContent-Typeheader. To tell a service to send
the response through certain media types, the client sets the HTTPAcceptheader to a list of the media
types.

- All resources shall be available through the JSONapplication/jsonmedia type.
- Redfish Services shall make every resource available in a JSON-based representation, as
    specified inRFC4627. Receivers shall not reject a JSON-encoded message, and shall offer at
    least one JSON-based response representation. An implementation may offer additional non-
    JSON media type representations.

To request compression, clients specify anAccept-Encodingrequest header.

When requested by the client, services should support gzip compression.

### 6.5. ETags....................................................................................................................................

To reduce unnecessary RESTful accesses to resources, the Redfish Service should support the
association of a separate entity tag (ETag) with each resource.

- Implementations should support the return ofETag propertiesfor each resource.
- Implementations should support the return of ETag headers for each single-resource response.
- Implementations shall support the return of ETag headers for GET requests of

DSP0266 Redfish Specification

Version 1.8.1 Published 25


```
ManagerAccountresources.
```
Because the service knows whether the new version of the object is substantially different, the service
generates and provides the ETag as part of the resource payload.

The ETag mechanism supports both **_strong_** and **_weak_** validation. If a resource supports an ETag, it shall
use theRFC7232-defined ETag strong validator.

This specification does not mandate a particular algorithm for ETag creation, but ETags should be highly
collision-free.

An ETag can be:

- A hash
- A generation ID
- A time stamp
- Some other value that changes when the underlying object changes

If a client callsPUTorPATCHto update a resource, it should include an ETag from a previous GET in the
HTTPIf-MatchorIf-None-Matchheader. If a service supports the return of the ETag header on a
resource, it may respond with the HTTP428 Precondition Requiredstatus code if theIf-Match
orIf-None-Matchheader is missing from the PUT or PATCH request for the same resource, as
specified inRFC6585.

In addition to the return of the ETag property on each resource, a Redfish Service should return the ETag
header on:

- A client PUT, POST, or PATCH operation
- A GET operation for an individual resource

The format of the ETag header is:

```
ETag: "<string>"
```
### 6.6. Protocol version....................................................................................................................

The protocol version is separate from the resources' version or the Redfish schema version that the
resources support.

Each Redfish protocol version is strongly typed by using the URI of the Redfish Service in combination
with the resource obtained at that URI, called theServiceRootresource.

The root URI for this version of the Redfish protocol shall be/redfish/v1/.

Redfish Specification DSP0266

26 Published Version 1.8.1


The URI defines the major version of the protocol.

TheRedfishVersionproperty of theServiceRootresource defines the protocol version, which
includes the major version, minor version, and errata version of the protocol, as defined in the Redfish
schema for that resource.

The protocol version is a string in the format:

_MajorVersion_. _MinorVersion_. _ErrataVersion_

where

```
Variable Type Version Description
```
```
MajorVersion Integer Major Backward-compatible class change.
```
```
MinorVersion Integer Minor
```
```
Minor update. Redfish introduces functionality but
does not remove any functionality.
```
```
The minor version preserves compatibility with earlier
minor versions.
```
```
ErrataVersion Integer Errata Fix to the earlier version.
```
Any resource that a client discovers through hyperlinks that the Service Root or any Service Root-
referenced service or resource returns shall conform to the same protocol version that the Service Root
supports.

A GET operation on the/redfishresource shall return this response body:

```
{
"v1":"/redfish/v1/"
}
```
### 6.7. Redfish-defined URIs and relative reference rules...............................................................

A Redfish Service shall support these Redfish-defined URIs:

```
URI Returns
```
```
/redfish Theversion. A major update that does not preserve compatibility with
```
DSP0266 Redfish Specification

Version 1.8.1 Published 27


```
URI Returns
```
```
earlier minor versions.
```
```
/redfish/v1/ The RedfishService Root.
```
```
/redfish/v1/
odata
The RedfishOData service document.
```
```
/redfish/
v1/$metadata
The Redfishmetadata document.
```
A Redfish Service should support these Redfish-defined URIs:

```
URI Returns
```
```
/redfish/v1/openapi.yaml The RedfishOpenAPI YAML document.
```
In addition, the service shall process the following URI without a trailing slash in one of these ways:

- Redirect it to the associated Redfish-defined URI.
- Treat it as the equivalent URI to the associated Redfish-defined URI:

```
URI Associated Redfish-defined URI
```
```
/redfish/v1 /redfish/v1/
```
All other Redfish Service-supported URIs shall match theresource URI patterns definitions, except the
supplemental resources that the@Redfish.Settings,@Redfish.ActionInfo, and
@Redfish.CollectionCapabilitiespayload annotationsreference. The client shall treat the URIs
for these supplemental resources as opaque.

All Redfish Service-supported URIs are reserved for future standardization by DMTF and DMTF alliance
partners, except OEM extension URIs, which shall conform to theOEM resource URIrequirements.

All relative references that the service uses shall start with either:

- A double forward slash (//) and include the authority (network-path), such as
    //mgmt.vendor.com/redfish/v1/Systems.
- A single forward slash (/) and include the absolute-path, such as/redfish/v1/Systems.

For details, seeRFC3986.

Redfish Specification DSP0266

28 Published Version 1.8.1


## 7. Service requests.....................................................................................................................................

This clause describes the requests that clients can send to Redfish Services.

### 7.1. Request headers...................................................................................................................

The HTTP Specification defines headers for request messages. The following table defines those
headers and their requirements for Redfish Services and clients.

For Redfish Services:

- Redfish Services shall process the headers in the following table as defined by the HTTP 1.1
    Specification if the value in the **Service requirement** column is **Yes** , or if the value is
    **Conditional** under the conditions noted in the Description column.
- Redfish Services should process the headers in the following tables as defined by the HTTP 1.1
    Specification if the value in the **Service requirement** column is **No**.

For Redfish clients (sending the HTTP requests):

- Redfish clients shall include the headers in the following table as defined by the HTTP 1.1
    Specification if the value in the **Client requirement** column is **Yes** , or if the value is **Conditional**
    under the conditions noted in the Description column.
- Redfish clients should transmit the headers in the following tables as defined by the HTTP 1.1
    Specification if the value in the **Client requirement** column is **No**.

```
Header
Service
requirement
```
```
Client
requirement
```
```
Supported
values
Description
```
```
Accept Yes No RFC7231
```
```
Communicates to the server the media
type or types that this client is prepared
to accept.
```
```
Services shall support resource
requests withAcceptheader values of
application/jsonor
application/
json;charset=utf-8.
```
```
Services shall support XML metadata
requests withAcceptheader values of
application/xmlorapplication/
```
DSP0266 Redfish Specification

Version 1.8.1 Published 29


```
Header
Service
requirement
```
```
Client
requirement
```
```
Supported
values
Description
```
```
xml;charset=utf-8.
```
```
Services shall support OpenAPI YAML
schema requests withAcceptheader
values ofapplication/yamlor
application/
yaml;charset=utf-8or
application/vnd.oai.openapior
application/
vnd.oai.openapi;charset=utf-8.
```
```
Services shall supportSSErequests
withAcceptheader values oftext/
event-streamortext/event-
stream;charset=utf-8.
```
```
Services shall support any request with
Acceptheader values of
application/*,
application/*;charset=utf-8,
*/*, or*/*;charset=utf-8.
```
```
Accept-
Encoding
No No RFC7231
```
```
Indicates whether the client can handle
gzip-encoded responses.
```
```
If a service cannot send an acceptable
response to a request with this header,
it shall respond with the HTTP 406
Not Acceptablestatus code.
```
```
If the request omits this header, the
service shall not return gzip-encoded
responses.
```
```
Accept-
Language
No No RFC7231
The languages that the client accepts in
the response.
```
Redfish Specification DSP0266

30 Published Version 1.8.1


```
Header
Service
requirement
```
```
Client
requirement
```
```
Supported
values
Description
```
```
If the request omits this header, uses
the service's default language for the
response.
```
```
Authorization Conditional Conditional RFC7617
```
```
Required forHTTP basic
authentication.
```
```
A client can access unsecured
resources without this header on
systems that support basic
authentication.
```
```
Content-
Length
No No RFC7231
```
```
The size of the message body.
```
```
To indicate the size of the body, a client
can use theTransfer-Encoding:
chunkedheader.
```
```
If a service needs to useContent-
Lengthand does not support
Transfer-Encoding, it responds
with the HTTP406 Not Acceptable
status code.
```
```
Content-Type Conditional Conditional RFC7231
```
```
The request format. Required for
operations with a request body.
```
```
Services shall accept theContent-
Typeheader set to either
application/jsonor
application/
json;charset=utf-8.
```
```
It is recommended that clients use
these values in requests because other
```
DSP0266 Redfish Specification

Version 1.8.1 Published 31


```
Header
Service
requirement
```
```
Client
requirement
```
```
Supported
values
Description
```
```
values can cause an error.
```
```
Host Yes No RFC7230 Enables support of multiple origin hosts
at a single IP address.
```
```
If-Match Conditional No RFC7232
```
```
To ensure that clients update the
resource from a known state, PUT and
PATCH requests for resources for
which a service returns ETags shall
supportIf-Match.
```
```
While not required for clients, it is highly
recommended for PUT and PATCH
operations.
```
```
If-None-Match No No RFC7232
```
```
A service only returns the resource if
the current ETag of that resource does
not match the ETag sent in this header.
```
```
If the ETag in this header matches the
resource's current ETag, the GET
operation returns the HTTP304 Not
Modifiedstatus code.
```
```
Last-Event-ID No No
```
##### HTML5

##### SSE

```
The event source's lastidfield from
the SSE stream. Requests history
event data.
```
```
SeeServer-Sent Events.
```
```
Max-Forwards No No RFC7231 Limits gateway and proxy hops.
```
Redfish Specification DSP0266

32 Published Version 1.8.1


```
Header
Service
requirement
```
```
Client
requirement
```
```
Supported
values
Description
```
```
Prevents messages from remaining in
the network indefinitely.
```
```
OData-
MaxVersion
No No 4.0
The maximum OData version that an
OData-aware client understands.
```
```
OData-Version Yes No 4.0
```
```
The OData version.
```
```
Services shall reject requests that
specify an unsupported OData version.
```
```
If a service encounters an unsupported
OData version, it should reject the
request with the HTTP 412
Precondition Failedstatus code.
```
```
Origin Yes No
```
##### W3C

##### CORS,

```
Section
5.7
```
```
Enables web applications to consume a
Redfish Service while preventing CSRF
attacks.
```
```
User-Agent Yes No RFC7231
```
```
Traces product tokens and their
versions.
```
```
The header can list multiple product
tokens.
```
```
Via No No RFC7230
```
```
Defines the network hierarchy and
recognizes message loops.
```
```
Each pass inserts its ownViaheader.
```
Redfish Services shall understand and be able to process the headers in the following table as defined by

DSP0266 Redfish Specification

Version 1.8.1 Published 33


this specification if the value in the **Required** column is **_Yes_**.

```
Header
Service
requirement
```
```
Client
requirement
```
```
Supported
values
Description
```
##### X-

```
Auth-
Token
```
```
Yes Conditional
```
```
Opaque
encoded
octet
strings
```
```
Authenticates user sessions.
The token value shall be
indistinguishable from random.
While services shall support this
header, a client can access
unsecured resources without
establishing a session.
```
### 7.2. GET (read requests).............................................................................................................

The GET operation retrieves resources from a Redfish Service. Clients make a GET request to the
individual resource URI. Clients may obtain the resource URI from published sources, such as the
OpenAPI document, or from aresource identifier propertyin a previously retrieved resource response,
such as thelinks property.

The service shall return the resource representation using one of the media types listed in theAccept
header, subject to the requirements of themedia types. If theAcceptheader is absent, the service shall
return the resource's representation asapplication/json. Services may, but are not required to,
support the convention of retrieving individual properties within a resource by appending a segment
containing the property name to the URI of the resource.

- The HTTP GET operation shall retrieve a resource without causing any side effects.
- The service shall ignore the content of the body on a GET.
- The GET operation shall be idempotent in the absence of outside changes to the resource.

#### 7.2.1. Resource collection requests..............................................................................

Clients retrieve a resource collection by making a GET request to the resource collection URI. The
response includes the resource collection's properties and an array of its _members_.

No requirements are placed on implementations to return a consistent set of members when a series of
requests that use paging query parameters are made over time to obtain the entire set of members.
These calls can result in missed or duplicate elements if multiple GETs use paging to retrieve the
Membersarray instances.

- Clients shall not make assumptions about the URIs for the members of a resource collection.
- Retrieved resource collections shall always include thecountproperty to specify the total
    number of entries in itsMembersarray.

Redfish Specification DSP0266

34 Published Version 1.8.1


- Regardless of thenext link propertyor paging, thecountproperty shall return the total number of
    resources that theMembersarray references.

A subset of the members can be retrieved using client pagingquery parameters.

A service may not be able to return all of the contents of a resource collection request in a single
response body. In this case, the response can be paged by the service. If a service pages a response to a
resource collection request, the following rules shall apply:

- Responses may contain a subset of the full resource collection's members.
- Individual members shall not be split across response bodies.
- Anext linkannotation shall be supplied in the response body with the URI to the next set of
    members in the collection.
- Thenext linkproperty shall adhere to the rules in theNext link propertyclause.
- GET Operations on thenext linkshall return the subsequent section of the resource collection
    response.

#### 7.2.2. Service Root request...........................................................................................

The root URL for Redfish version 1.x services shall be/redfish/v1/.

The service returns theServiceRootresource, as defined by this specification, as a response for the
root URL.

Services shall not require authentication to retrieve the Service Root and/redfishresources.

#### 7.2.3. OData service and metadata document requests...............................................

Redfish Services expose two OData-defined documents at specific URIs to enable generic OData clients
to navigate the Redfish Service.

- Service shall expose anOData metadata documentat the/redfish/v1/$metadataURI.
- Service shall expose anOData service documentat the/redfish/v1/odataURI.
- Service shall not require authentication to retrieve the OData metadata document or the OData
    service document.

### 7.3. Query parameters.................................................................................................................

To paginate, retrieve subsets of resources, or expand the results in a single response, clients can include
the query parameters. Some query parameters apply only to resource collections.

Services:

- Shall only support query parameters on GET operations.

DSP0266 Redfish Specification

Version 1.8.1 Published 35


- Should support the$top,$skip,only, andexcerptquery parameters.
- May support the$expand,$filter, and$selectquery parameters.
- Shall include theProtocolFeaturesSupportedobject in the Service Root, if the service
    supports query parameters.
       ◦ This object indicates which parameters and options have been implemented.
- Shall ignore unknown or unsupported query parameters that do not begin with$.
- Shall use the&operator to separate multiple query parameters in a single request.

Services shall return:

- The HTTP501 Not Implementedstatus code for any unsupported query parameters that
    start with$.
- Anextended errorthat indicates the unsupported query parameters for this resource.
- The HTTP400 Bad Requeststatus code for any query parameters that contain values that
    are invalid, or values applied to query parameters without defined values, such asexcerptor
    only.

Services should return:

- The HTTP400 Bad Requeststatus code with theQueryNotSupportedOnResource
    message from the Base Message Registry for any implemented query parameters that are not
    supported on a resource in the request.
- The HTTP400 Bad Requeststatus code with theQueryNotSupportedOnResource
    message from the Base Message Registry for any supported query parameters that apply only
    to resource collections but are used on singular resources. This includes query parameters such
    as$filter,$top,$skip, andonly.
- The HTTP400 Bad Requeststatus code with theQueryNotSupportedOnOperation
    message from the Base Message Registry for any supported query parameters on operations
    other than GET.

The response body shall reflect the evaluation of the query parameters in this order:

- Prior to service-side pagination:$filter,$skip,$top
- After applying any service-side pagination:$expand,$select

```
Queryparameter Descriptionandexample
```
```
excerpt
```
```
Returns a subset of the resource's properties that match the defined
Excerptschema annotation.
```
```
If noExcerptschema annotation is defined for the resource, the entire
resource is returned.
```
Redfish Specification DSP0266

36 Published Version 1.8.1


```
Queryparameter Descriptionandexample
```
```
Example:
```
```
https://resource?excerpt
```
```
$expand=<string>
```
```
Returns a hyperlink and its contents in-line with retrieved resources, as if a
GET call response was included in-line with that hyperlink.
```
```
SeeThe $expand query parameter.
```
```
Example:
```
```
https://resource?$expand=*($levels=3)
```
```
https://resourcecollection?$expand=.($levels=1)
```
```
$filter=<string>
```
```
Applies to resource collections. Returns a subset of collection members
that match the$filterexpression.
```
```
SeeThe $filter query parameter.
```
```
Example:
```
```
https://resourcecollection?$filter=SystemType eq
'Physical'
```
```
only
```
```
Applies to resource collections. If the target resource collection contains
exactly one member, clients can use this query parameter to return that
member's resource.
```
```
If the collection contains either zero members or more than one member,
the response returns the resource collection, as expected.
```
```
Services should return the HTTP400 Bad Requestwith the
QueryCombinationInvalidmessage from the Base Message Registry
ifonlyis being combined with other query parameters.
```
```
Example:
```
DSP0266 Redfish Specification

Version 1.8.1 Published 37


```
Queryparameter Descriptionandexample
```
```
https://resourcecollection?only
```
```
$select=<string>
```
```
Returns a subset of the resource's properties that match the$select
expression.
```
```
SeeThe $select query parameter.
```
```
Example:
```
```
https://resource?$select=SystemType,Status
```
```
$skip=<integer>
```
```
Applies to resource collections. Returns a subset of the members in a
resource collection. This paging query parameter defines the number of
membersin theresource collectionto skip.
```
```
Example:
```
```
https://resourcecollection?$skip=5
```
```
$top=<integer>
```
```
Applies to resource collections. Defines the number of members to show
in the response.
```
```
Minimum value is 1. By default, returns all members.
```
```
Example:
```
```
https://resourcecollection?$top=30
```
#### 7.3.1. The $expand query parameter............................................................................

The$expandquery parameter enables a client to request a response that includes not only the
requested resource, but also includes the contents of the subordinate or hyperlinked resources. The
definition of this query parameter follows theOData-ProtocolSpecification.

The$expandquery parameter has a set of possible options that determine which hyperlinks in a
resource are included in the expanded response. Some resources may already be expanded due to the
resource's schema annotationAutoExpand, such as theTemperatureobject in theThermalresource.

Redfish Specification DSP0266

38 Published Version 1.8.1


The Redfish-supported options for the$expandquery parameter are listed in the following table. The
service may implement some of these options but not others. Any other supported syntax for$expandis
outside the scope of this specification.

```
Option Description Example
```
```
asterisk(*)
Shall expand all
hyperlinks.
https://resource?$expand=*
```
```
$levels
```
```
Number of levels
the service should
cascade the
$expand
operation.
```
```
The default level
shall be 1.
```
```
For example,
$levels=2
expands both:
```
- The
    hyperlinks
    in the
    current
    resource
    (level 1).
- The
    hyperlinks
    in the
    resulting
    expanded
    resources
    (level 2).

```
https://resourcecollection?$expand=.($levels=2)
```
```
period(.)
```
```
Shall expand all
hyperlinks not in
thelinks property
section of the
resource.
```
```
https://resourcecollection?$expand=.
```
```
tilde(~) Shall expand all https://resourcecollection?$expand=~
```
DSP0266 Redfish Specification

Version 1.8.1 Published 39


```
Option Description Example
```
```
hyperlinks found in
thelinks property
section of the
resource.
```
Examples of$expandusage include:

- GET of aSoftwareInventoryCollection.

```
With$expand, the client can request multipleSoftwareInventorycollection member
resources in one request rather than fetching them one at a time.
```
- GET of aComputerSystem.

```
With$levels, a single GET request can include the subordinate resource collections, such as
ProcessorsandMemory.
```
- GET all UUIDs in members of theComputerSystemcollection.

```
To accomplish this result, include both$selectand$expandon the URI.
```
```
The syntax isGET /redfish/v1/Systems?$select=UUID&$expand=.($levels=1)
```
When services execute$expand, they may omit some of the referenced resource's properties.

When clients use$expand, they should be aware that the payload may increase beyond what can be
sent in a single response.

If a service cannot return the payload due to its size, it shall return the HTTP507 Insufficient
Storagestatus code.

The following is an example showing theRoleCollectionresource being expanded with the level set
to 1:

```
{
"@odata.id":"/redfish/v1/AccountService/Roles",
"@odata.type":"#RoleCollection.RoleCollection",
"Name":"Roles Collection",
"Members@odata.count": 3 ,
"Members": [
{
"@odata.id": "/redfish/v1/AccountService/Roles/Administrator",
```
Redfish Specification DSP0266

40 Published Version 1.8.1


```
"@odata.type":"#Role.v1_1_0.Role",
"Id":"Administrator",
"Name":"User Role",
"Description":"Admin User Role",
"IsPredefined":true,
"AssignedPrivileges": [
"Login",
"ConfigureManager",
"ConfigureUsers",
"ConfigureSelf",
"ConfigureComponents"
]
},
{
"@odata.id": "/redfish/v1/AccountService/Roles/Operator",
"@odata.type":"#Role.v1_1_0.Role",
"Id":"Operator",
"Name":"User Role",
"Description":"Operator User Role",
"IsPredefined":true,
"AssignedPrivileges": [
"Login",
"ConfigureSelf",
"ConfigureComponents"
]
},
{
"@odata.id": "/redfish/v1/AccountService/Roles/ReadOnly",
"@odata.type":"#Role.v1_1_0.Role",
"Id":"ReadOnly",
"Name":"User Role",
"Description":"ReadOnly User Role",
"IsPredefined":true,
"AssignedPrivileges": [
"Login",
"ConfigureSelf"
]
}
]
}
```
#### 7.3.2. The $select query parameter...............................................................................

The$selectquery parameter indicates that the implementation should return a subset of the resource's
properties that match the$selectexpression. If a request omits the$selectquery parameter, the
response returns all properties by default. The definition of this query parameter follows theOData-

DSP0266 Redfish Specification

Version 1.8.1 Published 41


ProtocolSpecification.

The$selectexpression shall not affect the resource itself.

The$selectexpression defines a comma-separated list of properties to return in the response body.

The syntax for properties in object types shall be the object and property names concatenated with a
slash (/).

An example of$selectusage is:

```
GET /redfish/v1/Systems/1$select=Name,SystemType,Status/State
```
When services execute$select, they shall return all requested properties of the referenced resource.
The@odata.idand@odata.typeproperties shall be in the response payload and contain the same
values as if$selectwas not performed. If the@odata.contextproperty is supported, it shall be in the
response payload and should be in theContext propertyrecommended format. If the@odata.etag
property is supported, it shall be in the response payload and contain the same values as if$selectwas
not performed.

Any other supported syntax for$selectis outside the scope of this specification.

#### 7.3.3. The $filter query parameter.................................................................................

The$filter parameterenables a client to request a subset of the resource collection's members
based on the$filterexpression. The definition of this query parameter follows theOData-Protocol
Specification.

The$filterquery parameter defines a set of properties and literals with an operator.

A literal value can be:

- A string enclosed in single quotes.
- A number.
- A boolean value.

If the literal value does not match the data type for the specified property, the service should reject
$filterrequests with the HTTP400 Bad Requeststatus code.

The$filtersection of the OData ABNF Components Specification contains the grammar for the
allowable syntax of the$filterquery parameter, with the additional restriction that only built-in filter
operations are supported.

Redfish Specification DSP0266

42 Published Version 1.8.1


The following table lists the Redfish-supported values for the$filterquery parameter. Any other
supported syntax for$filteris outside the scope of this specification.

```
Value Description Example
```
##### ()

```
Precedence grouping
operator.
```
```
(Status/State eq 'Enabled' and Status/Health
eq 'OK') or SystemType eq 'Physical'
```
```
and Logical and operator.
ProcessorSummary/Count eq 2 and
MemorySummary/TotalSystemMemoryGiB gt 64
```
```
eq
Equal comparison
operator.
ProcessorSummary/Count eq 2
```
```
ge Greater than or equal to
comparison operator.
```
```
ProcessorSummary/Count ge 2
```
```
gt Great than comparison
operator.
```
```
ProcessorSummary/Count gt 2
```
```
le
Less than or equal to
comparison operator.
MemorySummary/TotalSystemMemoryGiB le 64
```
```
lt
Less than comparison
operator.
MemorySummary/TotalSystemMemoryGiB lt 64
```
```
ne Not equal comparison
operator.
```
```
SystemType ne 'Physical'
```
```
not Logical negation
operator.
```
```
not (ProcessorSummary/Count eq 2)
```
```
or Logical or operator.
```
```
ProcessorSummary/Count eq 2 or
ProcessorSummary/Count eq 4
```
When evaluating expressions, services shall use the following operator precedence:

- Grouping
- Logical negation
- Relational comparison.gt,ge,lt, andleall have equal precedence.
- Equality comparison.eqandneboth have equal precedence.
- Logicaland
- Logicalor

If the service receives an unsupported$filterquery parameter, it shall reject the request and return

DSP0266 Redfish Specification

Version 1.8.1 Published 43


the HTTP501 Not Implementedstatus code.

### 7.4. HEAD....................................................................................................................................

The HEAD method differs from the GET method in that it shall not return message body information.

However, the HEAD method completes the same authorization checks and returns all the same meta
information and status codes in the HTTP headers as a GET method.

Services may support the HEAD method to:

- Return meta information in the form of HTTP response headers.
- Verify hyperlink validity.

Services may support the HEAD method to verify resource accessibility.

Services shall not support any other use of the HEAD method.

The HEAD method shall be idempotent in the absence of outside changes to the resource.

### 7.5. Data modification requests...................................................................................................

To create, modify, and delete resources, clients issue the following operations:

- POST (create)
- PATCH (update)
- PUT (replace)
- DELETE (delete)
- POST (action)on the resource

The following clauses describe the success and error response requirements common to all data
modification requests.

#### 7.5.1. Modification success responses..........................................................................

For create operations, the response from the service, after the create request succeeds, should be one of
these responses:

- The HTTP201 Createdstatus code with a body that contains the JSON representation of the
    newly created resource after the request has been applied.
- The HTTP202 Acceptedstatus code with aLocationheader set to the URI of a _task_
    _monitor_ when the processing of the request requires additional time to be completed.
       ◦ After processing of the _task_ is complete, the created resource may be returned in
          response to a request to the task monitor URI with the HTTP201 Createdstatus

Redfish Specification DSP0266

44 Published Version 1.8.1


```
code.
```
- The HTTP204 No Contentstatus code with empty payload in the event that the service
    cannot return a representation of the created resource.

For update, replace, and delete operations, the response from the service, after successful modification,
should be one of the following responses:

- The HTTP200 OKstatus code with a body that contains the JSON representation of the
    targeted resource after the modification has been applied, or, for the delete operation, a
    representation of the deleted resource.
- The HTTP202 Acceptedstatus code with aLocationheader set to the URI of a task
    monitor when the processing of the modification requires additional time.
       ◦ After processing of the task is complete, the modified resource may be returned in
          response to a request to the task monitor URI with the HTTP200 OKstatus code.
- The HTTP204 No Contentstatus code with an empty payload in the event that service
    cannot return a representation of the modified or deleted resource.

For details on successful responses to action requests, seePOST (action).

#### 7.5.2. Modification error responses...............................................................................

If the resource exists but does not support the requested operation, services may return the HTTP 405
Method Not Allowedstatus code.

Otherwise, if the service returns a client4XXor service5XXstatus code, the service encountered an error
and the resource shall not have been modified or created as a result of the operation.

### 7.6. PATCH (update)....................................................................................................................

To update a resource's properties, the service shall support the PATCH method.

The request body defines the changes to make to one or more properties in the resource that the request
URI references. The PATCH request does not change any properties that are not in the request body. The
service shall ignore OData annotations in the request body, such asresource identifier,type, andETag
properties. Services may accept a PATCH with an empty JSON object, which indicates that the service
should make no changes to the resource.

When modification succeeds, the response may contain a representation of the updated resource. See
Modification success responses.

To gain the protection semantics of an ETag, the service shall use theIf-MatchorIf-None-Match
header and not the@odata.etagproperty value for that protection.

The implementation may reject the update on certain properties based on its own policies and, in this

DSP0266 Redfish Specification

Version 1.8.1 Published 45


case, not perform the requested update. For the following exception cases, services shall return the
following HTTP status codes and other information:

```
Exception case The service returns
```
```
Modify several properties
where one or more properties
can never be updated.
```
```
For example, when a
property is read-only,
unknown, or unsupported.
```
- The HTTP200 OKstatus code.
- A resource representation with a messageannotation
    that lists the non-updatable properties.
- The service may update other properties in the resource.

```
Modify a single property that
can never be updated.
For example, a property that
is read-only, unknown, or
unsupported.
```
- The HTTP400 Bad Requeststatus code.
- A resource representation with a messageannotation
    that shows the non-updatable property.

```
Modify a resource or all
properties that can never be
updated.
```
- The HTTP 405 status code.

```
A client PATCH request
against a resource collection.
```
- The HTTP 405 status code.

```
A client only provides OData
annotations.
```
- The HTTP400 Bad Requeststatus code with the
    NoOperationmessage from the Base Message
    Registry or one of themodification success responses.

In the absence of outside changes to the resource, the PATCH operation should be idempotent, although
the originalETagvalue may no longer match.

### 7.7. PATCH on array properties...................................................................................................

TheArray propertiesclause describes the three styles of array properties in a resource.

Within a PATCH request, the service shall acceptnullto remove an element, and accept an empty
object{}to leave an element unchanged. Array properties that use the fixed or variable length style
remove those elements, while array properties that use the rigid style replace removed elements with

Redfish Specification DSP0266

46 Published Version 1.8.1


nullelements. A service may indicate the maximum size of an array by paddingnullelements at the
end of the array sequence.

When processing a PATCH request, the order of operations shall be:

- Modifications
- Deletions
- Additions

A PATCH request with fewer elements than in the current array shall remove the remaining elements of
the array.

For example, a fixed length-styleFlavorsarray indicates that the service supports a maximum of six
elements, by padding the array withnullelements, with four populated.

```
{
"Flavors": [
"Chocolate",
"Vanilla",
"Mango",
"Strawberry",
null,
null
]
}
```
A client could issue the following PATCH request to removeVanilla, replaceStrawberrywith
Cherry, and addCoffeeandBananato the array, while leaving the other elements unchanged.

```
{
"Flavors": [
{},
null,
{},
"Cherry",
"Coffee",
"Banana"
]
}
```
After the PATCH operation, the resulting array is:

DSP0266 Redfish Specification

Version 1.8.1 Published 47


```
{
"Flavors": [
"Chocolate",
"Mango",
"Cherry",
"Coffee",
"Banana",
null
]
}
```
### 7.8. PUT (replace)........................................................................................................................

To completely replace a resource, services may support the PUT method. The service may add properties
to the response resource that the client omits from the request body, the resource definition requires, or
the service normally supplies.

The PUT operation should be idempotent in the absence of outside changes to the resource, with the
possible exception that the operation might change ETag values.

When the replace operation succeeds, the response may contain a resource representation after the
replacement occurs. SeeModification success responses.

The following list contains the exception cases for PUT:

- If a service does not implement this method, the service shall return the HTTP405 Method
    Not Allowedstatus code.
- Services may reject requests that do not include properties that the resource definition (schema)
    requires.
- If the client makes a PUT request against a resource collection, services should return the HTTP
    405 Method Not Allowedstatus code.

### 7.9. POST (create).......................................................................................................................

To create a resource, services shall support the POST method on resource collections.

The POST request is submitted to the resource collection to which the new resource will belong. When
the create operation succeeds, the response may contain the new resource representation. See
Modification success responses.

The body of the create request contains a representation of the object to create. The service may ignore
any service-controlled properties, such asId, which would force the service to overwrite those properties.
Additionally, the service shall set theLocationheader in the response to the URI of the new resource.

Redfish Specification DSP0266

48 Published Version 1.8.1


- Submitting a POST request to a resource collection is equivalent to submitting the same request
    to theMembersproperty of that resource collection. Services that support the addition of
    Membersto a resource collection shall support both forms.
       ◦ For example, if a client adds a member to the resource collection at/redfish/v1/
          EventService/Subscriptions, it can send a POST request to either/redfish/
          v1/EventService/Subscriptionsor/redfish/v1/EventService/
          Subscriptions/Members.
- If the service does not enable creation of resources, the service shall return the HTTP 405
    Method Not Allowedstatus code.
- The POST operation shall not be idempotent.
- Services may allow the inclusion of@Redfish.OperationApplyTimeproperty in the request
    body. SeeOperation apply time.
- Services should return the HTTP400 Bad Requeststatus code for requests containing
    properties with the valuenull.

### 7.10. DELETE (delete).................................................................................................................

To remove a resource, the service shall support the DELETE method.

When the delete operation succeeds, the response may contain the resource representation after the
deletion occurs. SeeModification success responses.

- If the resource can never be deleted, the service shall return the HTTP405 Method Not
    Allowedstatus code.
- If the resource was already deleted, the service may return the HTTP404 Not Foundstatus
    code or asuccess code.
- The service may allow the inclusion of the@Redfish.OperationApplyTimeproperty in the
    request body. SeeOperation apply time.

### 7.11. POST (Action).....................................................................................................................

Services shall support the POST method to send actions to resources.

- The POST operation may not be idempotent.
- Services may allow the inclusion of the@Redfish.OperationApplyTimeproperty in the
    request body. SeeOperation apply time.

To request actions on a resource, send the HTTP POST method to the URI of the action. Thetarget
property in the resource'sActionspropertyshall contain the URI of the action. The URI of the action
shall be in the format:

_ResourceUri_ /Actions/ _QualifiedActionName_

DSP0266 Redfish Specification

Version 1.8.1 Published 49


where

```
Variable Description
```
```
ResourceUri URI of the resource that supports the action.
```
```
Actions
Name of the property that contains the actions for a resource, as
defined by this specification.
```
```
QualifiedActionName Qualified name of the action. Includes the namespace.
```
To determine the availableactionsand thevalid parameter valuesfor those actions, clients can query a
resource directly.

Clients provide parameters for the action as a JSON object within the request body of the POST
operation. For information about the structure of the request and required parameters, see theActions
propertyclause. Some parameter information may require that the client examine theRedfish schema
that corresponds to the resource.

The service may ignore unsupported parameters provided by the client. If an action does not have any
required parameters, the service should accept an empty JSON object in the HTTP body for the action
request.

To indicate the success or failure of the action request processing, the service may return a response with
one of the following HTTP status codes and additional information:

```
Toindicate HTTPstatuscode Additionalinformation
```
```
The action
request
succeeds, and
the schema
does not
contain a
response
definition.
```
##### 200 OK

```
The JSON message body, as described inError
responses, with a message that indicates success or
any additional relevant messages. If the action was
successfully processed and completed without errors,
warnings, or other notifications for the client, the service
should return theSuccessmessage from the Base
Message Registry in thecodeproperty in the response
body.
```
```
The action
request
succeeds, and
the schema
contains a
response
definition for
```
##### 200 OK

```
The JSON body in the response conforms to theaction
responsedefined in the schema.
```
Redfish Specification DSP0266

50 Published Version 1.8.1


```
Toindicate HTTPstatuscode Additionalinformation
```
```
the action.
```
```
The action
request may
require extra
time to process.
```
```
202 Accepted
ALocationresponse header set to the URI of a task
monitor.
```
```
The action
request
succeeds, and
the schema
does not
contain a
response
definition.
```
```
204 No Content No JSON message body.
```
```
The client did
not provide all
required
parameters.
```
```
400 Bad
Request
```
```
The response may contain a JSON object, as described
inError responses, which details the error or errors.
```
```
The client
provides a
parameter that
the service
does not
support, and
the service
does not ignore
unsupported
parameters.
```
```
400 Bad
Request
```
```
The response may contain a JSON object, as described
inError responses, which details the error or errors.
```
```
An error was
detected and
the action
request was not
processed.
```
```
400 or greater
The response may contain a JSON object, as described
inError responses, which details the error or errors.
```
If an action requested by the client will have no effect, such as performing a reset of aComputerSystem
where theResetTypeparameter is set toOnand theComputerSystemis alreadyOn, the service
should respond with the HTTP200 OKstatus code and return theNoOperationmessage from the
Base Message Registry.

DSP0266 Redfish Specification

Version 1.8.1 Published 51


Example successful action response:

```
{
"error": {
"code": "Base.1.0.Success",
"message":"Successfully Completed Request",
"@Message.ExtendedInfo": [
{
"@odata.type":"#Message.v1_0_0.Message",
"MessageId":"Base.1.0.Success",
"Message":"Successfully Completed Request",
"Severity":"OK",
"Resolution":"None"
}
]
}
}
```
### 7.12. Operation apply time...........................................................................................................

Services may accept the@Redfish.OperationApplyTimeannotation in thePOST (create),DELETE
(delete), orPOST (action)request body. This annotation enables the client to control when an operation is
carried out.

For example, if the client wants to delete a particularVolumeresource, but can only safely do so when a
reset occurs, the client can use this annotation to instruct the service to delete theVolumeon the next
reset.

If multiple operations are pending, the service shall process them in the order in which the service
receives them.

Services that support the@Redfish.OperationApplyTimeannotation for create and delete
operations on a resource collection shall include the@Redfish.OperationApplyTimeSupport
response annotation for the resource collection.

The following example response for a resource collection supports the
@Redfish.OperationApplyTimeannotation in the create and delete requests:

```
{
"@odata.id":"/redfish/v1/Systems/1/Storage/SATAEmbedded/Volumes",
"@odata.type":"#VolumeCollection.VolumeCollection",
"Name":"Storage Volume Collection",
"Description":"Storage Volume Collection",
```
Redfish Specification DSP0266

52 Published Version 1.8.1


```
"Members@odata.count": 2 ,
"Members": [
{
"@odata.id": "/redfish/v1/Systems/1/Storage/SATAEmbedded/Volumes/1"
},
{
"@odata.id": "/redfish/v1/Systems/1/Storage/SATAEmbedded/Volumes/2"
}
],
"@Redfish.OperationApplyTimeSupport": {
"@odata.type":"#Settings.v1_2_0.OperationApplyTimeSupport",
"SupportedValues": ["Immediate","OnReset"]
}
}
```
In the previous example, a client can annotate their create request body on theVolumeCollection
itself, or a delete operation on theVolumeswithin theVolumeCollection.

The following sample request deletes aVolumeon the next reset:

```
DELETE /redfish/v1/Systems/1/Storage/SATAEmbedded/Volumes/2HTTP/1.1
Content-Type: application/json;charset=utf-8
Content-Length: <computed length>
OData-Version: 4.0
```
```
{
"@Redfish.OperationApplyTime": "OnReset"
}
```
Services that support the@Redfish.OperationApplyTimeannotation for an action shall include the
@Redfish.OperationApplyTimeSupportresponse annotation for the action.

The following example response for aComputerSystemresource supports the
@Redfish.OperationApplyTimeannotation in the reset action request:

```
{
"@odata.id": "/redfish/v1/Systems/1",
"@odata.type": "#ComputerSystem.v1_5_0.ComputerSystem",
"Actions": {
"#ComputerSystem.Reset": {
"target": "/redfish/v1/Systems/1/Actions/ComputerSystem.Reset",
"ResetType@Redfish.AllowableValues": [
```
DSP0266 Redfish Specification

Version 1.8.1 Published 53


```
"On",
"ForceOff",
"ForceRestart",
"Nmi",
"ForceOn",
"PushPowerButton"
],
"@Redfish.OperationApplyTimeSupport": {
"@odata.type": "#Settings.v1_2_0.OperationApplyTimeSupport",
"SupportedValues": [ "Immediate", "AtMaintenanceWindowStart" ],
"MaintenanceWindowStartTime": "2017-05-03T23:12:37-05:00",
"MaintenanceWindowDurationInSeconds": 600,
"MaintenanceWindowResource": {
"@odata.id": "/redfish/v1/Systems/1"
}
}
}
},
...
}
```
In the previous example, a client can annotate their reset action request body on theComputerSystem
in the payload.

The following sample request completes a reset at the start of the next maintenance window:

```
POST /redfish/v1/Systems/1/Actions/ComputerSystem.ResetHTTP/1.1
Content-Type: application/json;charset=utf-8
Content-Length: <computed length>
OData-Version: 4.0
```
```
{
"ResetType":"ForceRestart",
"@Redfish.OperationApplyTime": "AtMaintenanceWindowStart"
}
```
Services that support the@Redfish.OperationApplyTimeannotation for a resource collection or
action shall create a _task_ , and respond with the HTTP202 Acceptedstatus code with aLocation
header set to the URI of a _task monitor_ , if the client's request body contains
@Redfish.OperationApplyTimein the request.

TheSettingsRedfish schema defines the structure of the
@Redfish.OperationApplyTimeSupportobject and the@Redfish.OperationApplyTime
annotation value.

Redfish Specification DSP0266

54 Published Version 1.8.1


## 8. Service responses..................................................................................................................................

This clause describes the responses that Redfish Services can send to clients.

### 8.1. Response headers................................................................................................................

HTTP defines headers for use in response messages. The following table defines those headers and
their requirements for Redfish Services:

- Redfish Services shall return the HTTP 1.1 Specification-defined headers if the value in the
    **Required** column is **Yes**.
- Redfish Services should return the HTTP 1.1 Specification-defined headers if the value in the
    **Required** column is **No**.
- Redfish clients shall be able to both understand and process all the HTTP 1.1 Specification-
    defined headers.

```
Header Required Supportedvalues Description
```
```
Access-
Control-
Allow-Origin
```
```
Yes
```
##### W3C CORS,

```
Section 5.1
```
```
Prevents or allows requests based on
originating domain. Prevents CSRF
attacks.
```
```
Allow Yes
```
##### POST, PUT,

##### PATCH, DELETE,

##### GET, HEAD

```
Shall be returned with the HTTP 405
(Method Not Allowed) status code to
indicate the valid methods for the
request URI. Shall be returned with any
GET or HEAD operation to indicate the
other allowable operations for this
resource.
```
```
Cache-
Control
Yes RFC7234
```
```
Shall be supported and indicates
whether a response can or cannot be
cached.
```
```
Content-
Encoding
No RFC7231
The encoding that has been performed
on the media type.
```
```
Content-
Length
No RFC7231
```
```
The size of the message body. An
optional means of indicating size of the
body usesTransfer-Encoding:
chunked, that does not use the
Content-Lengthheader. If a service
does not supportTransfer-Encoding
```
DSP0266 Redfish Specification

Version 1.8.1 Published 55


```
Header Required Supportedvalues Description
```
```
and needsContent-Lengthinstead,
the service shall respond with the HTTP
411 Length Requiredstatus code.
```
```
Content-Type Yes RFC7231
```
```
The message body's representation
type.
```
```
Services shall specify aContent-Type
ofapplication/jsonwhen returning
resources as JSON.
```
```
Services shall specify aContent-Type
ofapplication/xmlwhen returning
metadata as XML.
```
```
Services shall specify aContent-Type
ofapplication/yamlor
application/vnd.oai.openapi
when returning OpenAPI schema as
YAML.
```
```
Services shall specify aContent-Type
oftext/event-streamwhen
returning anSSEstream.
```
```
;charset=utf-8shall be appended to
theContent-Typeif specified in the
chosen media-type in theAccept
header for the request.
```
```
ETag Conditional RFC7232
```
```
An identifier for a specific version of a
resource, often a message digest. The
ETagheader shall be included on
responses to GETs of
ManagerAccountresources.
```
```
Link Yes SeeLink header
Linkheaders shall be returned, as
described in theLink headersclause.
```
```
Location Conditional RFC7231 A URI that requests a representation of
```
Redfish Specification DSP0266

56 Published Version 1.8.1


```
Header Required Supportedvalues Description
```
```
the resource. Shall be returned upon
creation of a resource.Locationand
X-Auth-Tokenshall be included on
responses that create user sessions.
```
```
Max-Forwards No RFC7231
```
```
Limits gateway and proxy hops.
Prevents messages from remaining in
the network indefinitely.
```
```
OData-
Version
Yes 4.0
The OData version of the payload to
which the response conforms.
```
```
Retry-After No
RFC7231, Section
7.1.3
```
```
Informs a client how long to wait before
requesting the task information again.
```
```
Server Yes RFC7231 A product token and its version. Multiple
product tokens may be listed.
```
```
Via No RFC7230
```
```
Defines the network hierarchy and
recognizes message loops. Each pass
inserts its ownViaheader.
```
##### WWW-

```
Authenticate
Yes RFC7617
```
```
Required for Basic and other optional
authentication mechanisms. For details,
see theSecurity detailsclause.
```
```
X-Auth-Token Yes Opaque encoded
octet strings
```
```
Contains the authentication token for
user sessions. The token value shall be
indistinguishable from random.
```
### 8.2. Link header...........................................................................................................................

TheLinkheaderprovides metadata information on the accessed resource in response to a HEAD or
GET request. The metadata information can include hyperlinks from the resource and JSON Schemas
that describe the resource.

The following example shows theLinkheaders for aManagerAccountwith anAdministratorrole,
in addition to aSettingsannotation:

```
Link: </redfish/v1/AccountService/Roles/Administrator>; path=/Links/Role
Link: <http://redfish.dmtf.org/schemas/Settings.json>
```
DSP0266 Redfish Specification

Version 1.8.1 Published 57


```
Link: </redfish/v1/JsonSchemas/ManagerAccount.v1_0_2.json>; rel=describedby
```
- The firstLinkheader is an example of a hyperlink that comes from the resource. It describes
    hyperlinks within the resource. This type of header is outside the scope of this specification.
- The secondLinkheader is an example of an AnnotationLinkheader as it references the
    JSON Schema that describes the annotation and does not haverel=describedby. This
    example references the public copy of the annotation on the DMTF's Redfish schema repository.
- The thirdLinkheader is an example for the JSON Schema that describes the actual resource.
    ◦ Note that the URL can reference an unversioned JSON Schema because the
       @odata.typein the resource indicates the appropriate version, or reference the
       versioned JSON Schema, which according to previous normative statements need to
       match the version in the@odata.typeproperty of the resource.

ALinkheader containingrel=describedbyshall be returned on GET and HEAD requests. If the
referenced JSON Schema is a versioned schema, it shall match the version contained in the value of the
@odata.typeproperty returned in this resource.

ALinkheader satisfying annotations should be returned on GET and HEAD requests.

### 8.3. Status codes.........................................................................................................................

HTTP defines status codes that appear in responses. The status codes themselves provide general
information about how the request was processed, such as whether the request was successful, if the
client provided bad information, or the service encountered an error when performing the request.

- When the service returns a status code in the4XXor5XXrange, services should return an
    extended error responsein the response body to provide the client more meaningful and
    deterministic error semantics.
- When the service returns a status code in the2XXrange and the response contains a
    representation of a resource, services may useextended informationto convey additional
    information about the resource.
- Extended error messages shall not provide privileged information when authentication failures
    occur.

```
Note: For security implications of extended errors, SeeSecurity details.
```
The following table lists HTTP status codes that have meaning or usage defined for a Redfish Service, or
are otherwise referenced by this specification. Other codes may be returned by the service as
appropriate, and their usage is implementation-specific. For usage and additional requirements imposed
by this specification, see the **Description** column.

- Clients shall understand and be able to process the status codes in the following table as

Redfish Specification DSP0266

58 Published Version 1.8.1


```
defined by the HTTP 1.1 Specification and constrained by additional requirements defined by
this specification.
```
- Services shall respond with the status codes in the following table as defined in description
    column.
- Redfish Services should not return the HTTP 100 status code. Using the HTTP protocol for a
    multipass data transfer should be avoided, except for the upload of extremely large data.
- If no other status code in the4XXrange is appropriate for client-side errors, the default status
    code should be the HTTP400 Bad Requeststatus code.
- If no other status code in the5XXrange is appropriate for service-side errors, the default status
    code should be the HTTP500 Internal Server Errorstatus code.

```
HTTPstatuscode Description
```
```
200 OK Request completed successfully and includes a representation in its body.
```
```
201 Created
```
```
Request to create a resource completed successfully. TheLocationheader
shall be set to the canonical URI for the newly created resource. The
response body may include a representation of the newly created resource.
```
```
202 Accepted
```
```
Request has been accepted for processing but the processing has not been
completed. TheLocationheader shall be set to the URI of a task monitor
that can later be queried to determine the status of the operation. The
response body may include a representation of theTaskresource.
```
```
204 No Content
The request succeeded, but no content is being returned in the body of the
response.
```
```
301 Moved
Permanently
Requested resource resides under a different URI.
```
```
302 Found Requested resource resides temporarily under a different URI.
```
```
304 Not
Modified
```
```
Service has performed a conditional GET request where access is allowed
but the resource content has not changed. Either or both theIf-Modified-
SinceandIf-None-Matchheaders initiate conditional requests to save
network bandwidth if no change has occurred. See HTTP 1.1, sections 14.25
and 14.26.
```
```
400 Bad
Request
```
```
Request could not be processed because it contains invalid information, such
as an invalid input field, or is missing a required value. The response body
shall return an extended error as defined in theError responsesclause.
```
```
401
Unauthorized
Authentication credentials included with this request are missing or invalid.
```
DSP0266 Redfish Specification

Version 1.8.1 Published 59


```
HTTPstatuscode Description
```
```
403 Forbidden
```
```
Service recognized the credentials in the request but those credentials do not
possess authorization to complete this request. This code is also returned
when the user credentials provided need to be changed before access to the
service can be granted. For details, see theSecurity detailsclause.
```
```
404 Not Found Request specified a URI of a resource that does not exist.
```
```
405 Method Not
Allowed
```
```
HTTP verb in the request, such as DELETE, GET, HEAD, POST, PUT, or
PATCH, is not supported for this request URI. The response shall include an
Allowheader that provides a list of methods that the resource identified by
the URI in the client request supports.
```
```
406 Not
Acceptable
```
```
Acceptheader was specified in the request and the resource identified by
this request cannot generate a representation that corresponds to one of the
media types in theAcceptheader.
```
```
409 Conflict
```
```
Creation or update request could not be completed because it would cause a
conflict in the current state of the resources that the platform supports. For
example, a conflict occurred due to an attempt to set multiple properties that
work in a linked manner by using incompatible values.
```
```
410 Gone
```
```
Requested resource is no longer available at the service and no forwarding
address is known. This condition is expected to be considered permanent.
Clients with hyperlink editing capabilities should delete references to the URI
in the client request after user approval. If the service does not know or
cannot determine whether the condition is permanent, client should use the
HTTP404 Not Foundstatus code. This response is cacheable unless
otherwise indicated.
```
```
411 Length
Required
```
```
Request did not use theContent-Lengthheader to specify the length of its
content but perhaps used theTransfer-Encoding: chunkedheader
instead. The addressed resource requires theContent-Lengthheader.
```
```
412
Precondition
Failed
```
```
Precondition check, such as check of theOData-Version,If-Match, or
If-Not-Modifiedheader, failed.
```
##### 415

```
Unsupported
Media Type
```
```
Request specifies aContent-Typefor the body that is not supported.
```
##### 428

```
Precondition
```
```
Request did not provide the required precondition, such as anIf-Matchor
If-None-Matchheader.
```
Redfish Specification DSP0266

60 Published Version 1.8.1


```
HTTPstatuscode Description
```
```
Required
```
```
431 Request
Header Field
Too Large
```
```
Service is unwilling to process the request because either an individual
header field or the collection of all header fields are too large.
```
```
500 Internal
Server Error
```
```
Service encountered an unexpected condition that prevented it from fulfilling
the request. The response body shall return an extended error as defined in
theError responsesclause.
```
```
501 Not
Implemented
```
```
Service does not currently support the functionality required to fulfill the
request. This response is appropriate when the service does not recognize
the request method and cannot support the method for any resource.
```
```
503 Service
Unavailable
```
```
Service currently cannot handle the request due to temporary overloading or
maintenance of the service. A service may use this response to indicate that
the request URI is valid but the service is performing initialization or other
maintenance on the resource. It may also use this response to indicate the
service itself is undergoing maintenance, such as finishing initialization steps
after reboot of the service.
```
```
507
Insufficient
Storage
```
```
Service cannot build the response for the client due to the size of the
response.
```
### 8.4. OData metadata responses..................................................................................................

OData metadata describes resources, resource collections, capabilities, and service-dependent behavior
to generic OData consumers with no specific understanding of this specification. Clients are not required
to request metadata if they already have sufficient understanding of the target service. For example,
clients are not required to request metadata to request and interpret a JSON representation of a resource
that this specification defines.

A client can access the OData metadata at the/redfish/v1/$metadataURI.

A client can access the OData service document at the/redfish/v1/odataURI.

#### 8.4.1. OData $metadata................................................................................................

The OData metadata describes top-level service resources and resource types according toOData
Common Schema Definition Language. The OData metadata is represented as an XML document with
anEdmxroot element in thehttp://docs.oasis-open.org/odata/ns/edmxnamespace with an

DSP0266 Redfish Specification

Version 1.8.1 Published 61


OData version attribute set to4.0.

The service shall use theapplication/xmlorapplication/xml;charset=utf-8MIME types to
return the OData metadata document as an XML document.

```
<edmx:Edmxxmlns:edmx="http://docs.oasis-open.org/odata/ns/edmx" Version="4.0">
<!-- edmx:Reference and edmx:Schema elements go here -->
</edmx:Edmx>
```
**8.4.1.1. Referencing other schemas**

The OData metadata shall include the namespaces for each of the Redfish resource types, along with the
RedfishExtensions.v1_0_0namespace.

These references may use either:

- The standard URI for the published Redfish schema definitions, such as on
    [http://redfish.dmtf.org/schemas.](http://redfish.dmtf.org/schemas.)
- A URI to a local version of the Redfish schema.

```
<edmx:Reference Uri="http://redfish.dmtf.org/schemas/v1/ServiceRoot_v1.xml">
<edmx:IncludeNamespace="ServiceRoot"/>
<edmx:IncludeNamespace="ServiceRoot.v1_0_0"/>
</edmx:Reference>
```
```
...
```
```
<edmx:Reference Uri="http://redfish.dmtf.org/schemas/v1/VirtualMedia_v1.xml">
<edmx:IncludeNamespace="VirtualMedia"/>
<edmx:IncludeNamespace="VirtualMedia.v1_0_0"/>
</edmx:Reference>
<edmx:Reference Uri="http://redfish.dmtf.org/schemas/v1/RedfishExtensions_v1.xml">
<edmx:IncludeNamespace="RedfishExtensions.v1_0_0"Alias="Redfish"/>
</edmx:Reference>
```
The service'sOData metadata documentshall include anEntityContainerthat defines the top-level
resources and resource collections.

**8.4.1.2. Referencing OEM extensions**

The OData metadata document may reference additional schema documents that describe OEM-specific
extensions that the service uses.

For example, the OData metadata document may reference custom types for additional resource

Redfish Specification DSP0266

62 Published Version 1.8.1


collections.

```
<edmx:Reference Uri="http://contoso.org/Schema/CustomTypes">
<edmx:IncludeNamespace="CustomTypes"/>
</edmx:Reference>
```
#### 8.4.2. OData service document.....................................................................................

The OData service document serves as a top-level entry point for generic OData clients. More information
about the OData service document can be found in theOData JSON FormatSpecification.

```
{
"@odata.context":"/redfish/v1/$metadata",
"value": [
{
"name":"Service",
"kind":"Singleton",
"url":"/redfish/v1/"
},
{
"name":"Systems",
"kind":"Singleton",
"url":"/redfish/v1/Systems"
},
...
]
}
```
The service shall use theapplication/jsonMIME type to return the OData service document as a
JSON object.

The JSON object shall contain the@odata.contextcontext property set to/redfish/
v1/$metadata.

The JSON object shall include avalueproperty set to a JSON array that contains an entry for the
Service Rootand each resource that is a direct child of the Service Root.

Each JSON object entry includes:

```
Property Defines
```
```
name User-friendly resource name of the resource.
```
DSP0266 Redfish Specification

Version 1.8.1 Published 63


```
Property Defines
```
```
kind Type of resource. Value isSingletonfor all cases defined by Redfish.
```
```
url Relative URL for the top-level resource.
```
### 8.5. Resource responses.............................................................................................................

Services use theapplication/jsonMIME type to return resources and resource collections as JSON
payloads. A service shall not break responses for a single resource into multiple results.

The format of these payloads is defined by the Redfish schema. For rules about the Redfish schema and
how it maps to JSON payloads, see theData modelandSchema definition languagesclauses.

### 8.6. Error responses....................................................................................................................

HTTP status codes often do not provide enough information to enable deterministic error semantics. For
example, if a client makes a PATCH call and some properties do not match while others are not
supported, the HTTP400 Bad Requeststatus code does not tell the client which values are in error.
Error responses provide the client more meaningful and deterministic error semantics.

To provide the client with as much information about the error as possible, a Redfish Service may provide
multiple error responses in the HTTP response. Additionally, the service may provide Redfish
standardized errors, OEM-defined errors, or both, depending on the implementation's ability to convey the
most useful information about the underlying error.

An extended error response, which is a single JSON object, defines the error responses, with anerror
property, which contains the following properties.

```
Property Description
```
```
code String. Defines aMessageIdfrom the Message Registry.
```
```
message Displays a human-readable error message that corresponds to the
message in the Message Registry.
```
```
@Message.ExtendedInfo Displays an array ofmessage objects. Describes one or more error
messages.
```
```
{
"error": {
"code": "Base.1.0.GeneralError",
```
Redfish Specification DSP0266

64 Published Version 1.8.1


```
"message":"A general error has occurred. See Resolution for information on
how to resolve the error.",
"@Message.ExtendedInfo": [
{
"@odata.type":"#Message.v1_0_0.Message",
"MessageId":"Base.1.0.PropertyValueNotInList",
"RelatedProperties": [
"#/IndicatorLED"
],
"Message":"The value Red for the property IndicatorLED is not in the
list of acceptable values.",
"MessageArgs": [
"RED",
"IndicatorLED"
],
"Severity":"Warning",
"Resolution":"Choose a value from the enumeration list that the
implementation can support and resubmit the request if the operation failed."
},
{
"@odata.type":"#Message.v1_0_0.Message",
"MessageId":"Base.1.0.PropertyNotWritable",
"RelatedProperties": [
"#/SKU"
],
"Message":"The property SKU is a read only property and cannot be
assigned a value.",
"MessageArgs": [
"SKU"
],
"Severity":"Warning",
"Resolution":"Remove the property from the request body and resubmit
the request if the operation failed."
}
]
}
}
```
## 9. Data model.............................................................................................................................................

One of the key tenets of Redfish is the separation of protocol from the data model. This separation makes
the data both transport and protocol agnostic. By concentrating on the data transported in the payload of
the protocol (in HTTP, it is the HTTP body), Redfish can also define the payload in any encoding and the
data model is intended to be schema-language agnostic. While Redfish uses the JSON data-interchange
format, Redfish provides a common encoding type that ensures property naming conventions that make

DSP0266 Redfish Specification

Version 1.8.1 Published 65


development easier in JavaScript, Python, and other languages. This encoding type helps the Redfish
data model be more easily accessible in modern tools and programming environments.

This clause describes common data model, resource, and Redfish schema requirements.

### 9.1. Resources.............................................................................................................................

A _resource_ is a single entity. Services use theapplication/jsonMIME type to return resources as
JSON payloads.

Each resource shall be strongly typed and defined in aRedfish schema document, and identified in the
response payload by a uniquetype identifierproperty.

Responses for a single resource shall contain the following properties:

- @odata.id
    ◦ Registry resourcesare not required to provide@odata.id
- @odata.type
- Id
- Name

Responses may also contain other properties defined within the schema for that resourcetype.
Responses shall not include any properties not defined by that resource type.

### 9.2. Resource collections.............................................................................................................

A _resource collection_ is a set of resources that share the same schema definition. Services use the
application/jsonMIME type to return resource collections as JSON payloads.

Resource collection responses shall contain the following properties:

- @odata.id
- @odata.type
- Name
- Members
- Members@odata.count

Responses for resource collections may contain the following properties:

- @odata.context
- @odata.etag
- Description
- Members@odata.nextLink

Redfish Specification DSP0266

66 Published Version 1.8.1


- Oem

Responses for resource collections shall not contain any other properties with the exception ofpayload
annotations.

### 9.3. OEM resources.....................................................................................................................

OEMs and other third parties can extend the Redfish data model by creating resource types. This is
accomplished by defining an OEM schema for each resource type, and connecting instances of those
resources to the _resource tree_.

Companies, OEMs, and other organizations use theOemproperty in resources, thelinks property, and
actions to define additionalproperties, hyperlinks, andactionsfor standard Redfish resources.

While the information and semantics of these extensions are outside of the standard, the schema
representing the data, the resource itself, and the semantics around the protocol shall conform to the
requirements in this specification. OEMs are encouraged to follow the design tenets and naming
conventions in this specification when defining OEM resources or properties.

### 9.4. Common data types..............................................................................................................

The following clause details the data types found throughout the Redfish data model.

#### 9.4.1. Primitive types.....................................................................................................

The following are the primitive data types in the data model:

```
Type Description
```
```
Boolean A variable with a value oftrueorfalse.
```
```
Number
A number with optional decimal point or exponent. Number properties may restrict the
representation to an integer or a number with decimal point.
```
```
String A sequence of characters enclosed with double quotes (").
```
```
Array
A comma-separated set of the previous types enclosed with square braces ([and]).
See theArray propertiesclause.
```
```
Object
```
```
A set of properties enclosed with curly braces ({and}). See theStructured properties
clause.
```
```
Null
```
```
Thenullvalue, which the service uses when it is unable to determine the property
value, or if the schema has requirements for usingnullfor other conditions.
```
DSP0266 Redfish Specification

Version 1.8.1 Published 67


When receiving values from the client, services should support other valid representations of the data in
the specified JSON type. In particular, services should support valid integer and decimal values in
exponential notation and integer values that contain a decimal point with no non-zero trailing digits.

#### 9.4.2. GUID and UUID values.......................................................................................

Globally Unique Identifier (GUID) and Universally Unique Identifier (UUID) values are unique identifier
strings and shall use the format:

([0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12})

#### 9.4.3. Date-Time values.................................................................................................

Date-Time values are strings according to the ISO 8601 extended format, including the time offset or UTC
suffix.

Date-Time values shall use the format:

_YYYY_ - _MM_ - _DD_ T _hh_ : _mm_ : _ss_ [. _SSS_ ](Z|((+|-) _HH_ : _MM_ ))

where

```
Variableorseparator Description
```
```
YYYY Four-digit year.
```
```
MM Two-digit month (1 to 12).
```
```
DD Two-digit day (1 to 31).
```
```
T Time separator. Shall be a capitalT.
```
```
hh Two-digit hour (0 to 23).
```
```
mm Two-digit minute (0 to 59).
```
```
ss Two-digit second (0 to 59).
```
##### SSS

```
Optional. Decimal fraction of a second. Shall be one or more digits where
the number of digits implies the precision.
```
```
Z Zero offset indicator. Shall be a capitalZ.
```
```
HH Two-digit hour offset (0 to 23).
```
```
MM Two-digit minute offset (0 to 59).
```
Redfish Specification DSP0266

68 Published Version 1.8.1


For example,2015-03-13T04:14:33+06:00represents March 13, 2015 at 4:14:33 with a +06:00 time
offset.

When the time of day is unknown or serves no purpose, the service shall report00:00:00Zfor the time
of day value.

#### 9.4.4. Duration values....................................................................................................

Duration values are strings according to the ISO 8601 duration format. Duration values shall use the
format:

P[ _y_ Y][ _m_ M][ _w_ W][ _d_ D][T[ _h_ H][ _m_ M][ _s_ [. _f_ ]S]]

where

```
Variable Description
```
```
y Number of years.
```
```
m Number of months.
```
```
w Number of weeks.
```
```
d Number of days.
```
```
h Number of hours.
```
```
m Number of minutes.
```
```
s Number of seconds.
```
```
f Fractional seconds.
```
Each field is optional and may contain more than one digit.

For example, the following values represent the following durations:

```
Value Duration
```
```
P3D Three days.
```
```
PT6H Six hours.
```
```
PT10S Ten seconds.
```
```
PT0.001S 0.001 seconds.
```
DSP0266 Redfish Specification

Version 1.8.1 Published 69


```
Value Duration
```
```
PT1H30M One hour and 30 minutes.
```
#### 9.4.5. Reference properties...........................................................................................

Reference properties provide a reference to another resource in the data model. Reference properties are
JSON objects that contain an@odata.idproperty. The@odata.idproperty value is the URI of the
referenced resource.

#### 9.4.6. Non-resource reference properties......................................................................

Non-resource reference properties provide a reference to services or documents that are not Redfish-
defined resources. These properties shall include theUriterm in their property name. For example,
AssemblyBinaryDataUriin the Assembly schema. The access protocol and data format of the
referenced URI may be defined in schema for that property. Non-resource reference properties that refer
to local HTTP/S targets shall follow the Redfish protocol, including use of Redfish sessions and access
control, unless otherwise specified by the property definition in schema.

#### 9.4.7. Array properties...................................................................................................

Array properties contain a set of values or objects, and appear as JSON arrays within a response body.
Array elements shall all contain values of the same data type.

There are three styles of arrays, regardless of the data type of the elements:

```
Arraystyle Description
```
```
Fixed length
Contains a static number of elements. The property definition sets or the
implementation chooses the size of the array.
```
```
Variablelength
```
```
Contains a variable number of elements. The array size is not specified and the
size varies among instances. The array size may change. This array style is the
most common style.
```
```
Rigid
```
```
The array index is meaningful. When elements are added to or removed from the
array, the elements do not change their position, or index, in the array. An
element that is removed from a rigid array shall be replaced by anullelement
and all other elements shall remain at their current index.
```
```
Empty elements in a rigid array property shall be represented bynullelements.
Any array property that uses this style shall indicate the rigid style in thelong
```
Redfish Specification DSP0266

70 Published Version 1.8.1


```
Arraystyle Description
```
```
descriptionof its schema definition.
```
Services may pad an array property withnullelements at the end of the sequence to indicate the array
size to clients. This is useful for small fixed length arrays, and for variable or rigid arrays with a restrictive
maximum size. Services should not pad array properties if the maximum array size is not restrictive. For
example, an array property typically populated with two elements, that a service limits to a maximum of 16
elements, should not pad the array with 14nullelements.

#### 9.4.8. Structured properties...........................................................................................

Structured properties are JSON objects within a response body.

Some structured properties inherit from theResource.v1_0_0.ReferenceableMemberdefinition.
Structured properties that follow this definition shall contain theMemberIdandresource identifier
properties.

Because the definition of structured properties can evolve over time, clients need to be aware of the
inheritance model that the different structured property definitions use.

For example, theLocationdefinition in theResourceschema has gone through several iterations
since theResource.v1_1_0namespace was introduced, and each iteration inherits from the earlier
version so that existing references in other schemas can leverage the additions.

Structured property references need to be resolved for both local and external references.

A local reference is a resource that has a structured property in its own schema, such as
ProcessorSummaryin theComputerSystemresource. In these cases, thetypeproperty for the
resource is the starting point for resolving the structured property definition.

To find the latest applicable version, clients can step theversion of the resourcebackwards.

For example, if a service returns#ComputerSystem.v1_4_0.ComputerSystemas the resource type,
a client can step backwards fromComputerSystem.v1_4_0, toComputerSystem.v1_3_0, to
ComputerSystem.v1_2_0, and so on, until it finds theProcessorSummarystructured property
definition.

An external reference is a resource that has a property that references a definition found in a different
schema, such asLocationin theChassisresource.

In these cases, clients can use the latest version of the external schema file as a starting point to resolve

DSP0266 Redfish Specification

Version 1.8.1 Published 71


the structured property definition.

For example, if the latest version of theResourceschema is1.6.0, a client can go backward from
Resource.v1_6_0, toResource.v1_5_0, toResource.v1_4_0, and so on, until it finds the
Locationstructured property definition.

#### 9.4.9. Message object...................................................................................................

A message object provides additional information about anobject,property, orerror response.

A message object is a JSON object with the following properties:

```
Property Type Required Defines
```
```
MessageId String Yes
```
```
The error or message. Do not confuse this
value with the HTTP status code. Clients can
use this code to access a detailed message
from a Message Registry.
```
```
Message String No
```
```
The human-readable error message that
indicates the semantics associated with the
error. This shall be the complete message,
and not rely on substitution variables.
```
```
RelatedProperties
```
```
An
array of
JSON
pointers
```
```
No
The properties in a JSON payload that the
message describes.
```
```
MessageArgs
```
```
An
array of
strings
```
```
No
```
```
The substitution parameter values for the
message. If the parameterized message
defines aMessageId, the service shall
include theMessageArgsin the response.
```
```
Severity String No The severity of the error.
```
```
Resolution String No The recommended actions to take to resolve
the error.
```
Each instance of a message object shall contain at least aMessageId, together with any applicable
MessageArgs, or aMessageproperty that defines the complete human-readable error message.

MessageIdsidentify specific messages that aMessage Registrydefines.

TheMessageIdproperty value shall be in the format:

Redfish Specification DSP0266

72 Published Version 1.8.1


_RegistryName_. _MajorVersion_. _MinorVersion_. _MessageKey_

where

```
Variable Description
```
```
RegistryName Name of the registry. The registry name shall be Pascal-cased.
```
```
MajorVersion Non-negative integer. The major version of the registry.
```
```
MinorVersion Non-negative integer. The minor version of the registry.
```
```
MessageKey
Human-readable key into the registry. The message key shall be Pascal-cased
and shall not include spaces, periods, or special characters.
```
To search the Message Registry for a message, the client can use theMessageId.

The Message Registry approach has advantages for internationalization because the registry can be
translated easily, and is lightweight for implementations because large strings need not be included with
the implementation.

The use ofBase.1.0.GeneralErroras aMessageIdinExtendedInfois discouraged. If no better
message exists or theExtendedInfoarray contains multiple messages, use
Base.1.0.GeneralErroronly in thecodeproperty of theerrorobject.

When an implementation usesBase.1.0.GeneralErrorinExtendedInfo, the implementation
should include aResolutionproperty with this error to indicate how to resolve the problem.

### 9.5. Properties..............................................................................................................................

Every property included in a Redfish response payload shall be defined in the schema for thatresource.
The following attributes apply to all property definitions:

- Property names in the request and response payload shall match the casing of theName
    attribute value in the defining schema.
- Required properties shall always be returned in a response.
- Properties not returned from a GET operation indicate that the property is not supported by the
    implementation.
- If an implementation supports a property, it shall always provide a value for that property. If a
    value is unknown, then the value ofnullis an acceptable value if supported by the schema
    definition.
- A service may implement a writable property as read-only.

This clause also contains a set of common properties across all Redfish resources. The property names

DSP0266 Redfish Specification

Version 1.8.1 Published 73


in this clause shall not be used for any other purpose.

#### 9.5.1. Resource identifier (@odata.id) property.............................................................

Registry resourcesin a response may include an@odata.idproperty. All otherresourcesin a response
shall include an@odata.idproperty. The value of the identifier property shall be the resourceURI.

#### 9.5.2. Resource type (@odata.type) property...............................................................

Allresourcesin a response shall include an@odata.typetype property. To support generic OData
clients, allstructured propertiesin a response should include an@odata.typetype property. The value
shall be a URL fragment that specifies the type of the resource and shall be in the format:

# _Namespace_. _TypeName_

where

```
Variable Description
```
```
Namespace
Full namespace name of the Redfish schema that defines the type. For Redfish
resources, the versioned namespace name.
```
```
TypeName Name of the resource type.
```
An example of a resource type value is#ComputerSystem.v1_0_0.ComputerSystem, where
ComputerSystem.v1_0_0denotes the version 1.0.0 namespace ofComputerSystem, and the type
itself isComputerSystem.

#### 9.5.3. Resource ETag (@odata.etag) property..............................................................

ETags enable clients to conditionally retrieve or update aresource. Resources should include an
@odata.etagproperty. For a resource, the value shall be theETag.

#### 9.5.4. Resource context (@odata.context) property......................................................

Responses for a singleresourcemay contain an@odata.contextproperty that describes the source of
the payload.

If the@odata.contextproperty is present, it shall be the context URL that describes the resource,
according toOData-Protocol.

The context URL for a resource should be in the format:

/redfish/v1/$metadata# _ResourceType_

Redfish Specification DSP0266

74 Published Version 1.8.1


where

```
Variable Description
```
```
ResourceType
```
```
Fully qualified name of the unversioned resource type. Redfish resource
definitions concatenate the resource type namespace with a period (.) followed
by the resource type.
```
For example, the following context URL specifies that the results show a singleComputerSystem
resource:

```
{
"@odata.context": "/redfish/v1/$metadata#ComputerSystem.ComputerSystem",
```
```
}
```
The context URL for a resource may be in one of the other formats thatOData-Protocolspecifies.

#### 9.5.5. Id..........................................................................................................................

TheIdproperty of aresourceuniquely identifies the resource within the resource collection that contains
it. The value ofIdshall be unique across aresource collection. TheIdproperty shall follow the definition
forIdin theResourceschema.

#### 9.5.6. Name...................................................................................................................

TheNameproperty conveys a human-readable moniker for aresource. The type of theNameproperty
shall be string. The value ofNameis NOT required to be unique across resource instances within a
resource collection. TheNameproperty shall follow the definition forNamein theResourceschema.

#### 9.5.7. Description...........................................................................................................

TheDescriptionproperty conveys a human-readable description of theresource. TheDescription
property shall follow the definition forDescriptionin theResourceschema.

#### 9.5.8. MemberId............................................................................................................

TheMemberIdproperty uniquely identifies an element within an array, where areference propertycan
reference the element. TheMemberIdvalue shall be unique across the array. TheMemberIdproperty
shall follow the definition forMemberIdin theResourceschema.

DSP0266 Redfish Specification

Version 1.8.1 Published 75


#### 9.5.9. Count (Members@odata.count) property............................................................

The count property defines the total number ofresource, or _members_ , that are available in aresource
collection. The count property shall be namedMembers@odata.countand its value shall be the total
number of members available in the resource collection. The$topor$skipquery parametersshall not
affect this count.

#### 9.5.10. Members............................................................................................................

TheMembersproperty of aresource collectionidentifies the _members_ of the collection. TheMembers
property is required and shall be returned in the response for any resource collection. TheMembers
property shall be an array of JSON objects namedMembers. TheMembersproperty shall not benull.
Empty collections shall be an empty JSON array.

#### 9.5.11. Next link (Members@odata.nextLink) property.................................................

The value of the Next Link property shall be an opaque URL to a resource, with the same@odata.type,
which contains the next set of partial _members_ from the original operation. The Next Link property shall
only be present if the number of members in the resource collection is greater than the number of
members returned, and if the payload does not represent the end of the requested resource collection.

TheMembers@odata.countpropertyvalue is the total number of resources available if the client
enumerates all pages of the resource collection.

#### 9.5.12. Links..................................................................................................................

TheLinksproperty represents the hyperlinks associated with theresource, as defined by that resource's
schema definition. All associatedreference propertiesdefined for a resource shall be nested under the
links property. All directly (subordinate) referenced properties defined for a resource shall be in the root of
the resource.

The links property shall be namedLinksand contain a property for each related resource.

To navigate vendor-specific hyperlinks, theLinksproperty shall also include anOemproperty.

**9.5.12.1. Reference to a related resource**

A reference to a singleresourceis a JSON object that contains a singleresource identifier property. The
name of this reference is the name of the relationship. The value of this reference is the URI of the
referenced resource.

```
{
```
Redfish Specification DSP0266

76 Published Version 1.8.1


```
"Links": {
"ManagedBy": {
"@odata.id": "/redfish/v1/Chassis/Encl1"
}
}
}
```
**9.5.12.2. References to multiple related resources**

A reference to a set of zero or more relatedresourcesis an array of JSON objects. The name of this
reference is the name of the relationship. Each element of the array is a JSON object that contains a
resource identifier propertywith the value of the URI of the referenced resource.

```
{
"Links": {
"Contains": [
{
"@odata.id":"/redfish/v1/Chassis/1"
},
{
"@odata.id":"/redfish/v1/Chassis/Encl1"
}
]
}
}
```
#### 9.5.13. Actions...............................................................................................................

TheActionsproperty contains theactionssupported by aresource.

**9.5.13.1. Action representation**

Each supported action is represented as a property nested underActions. The unique name that
identifies the action is used to construct the property name.

This property name shall be in the format:

# _ResourceType_. _ActionName_

where

DSP0266 Redfish Specification

Version 1.8.1 Published 77


```
Variable Description
```
```
ResourceType Resource where the action is defined.
```
```
ActionName Name of the action.
```
The client may use this fragment to identify the action definition in thereferencedRedfish schema
document.

The property for the action is a JSON object and contains the following properties:

- Thetargetproperty shall be present, and defines the relative or absolute URL to invoke the
    action.
- Thetitleproperty may be present,and defines the action's name.

TheOData JSON FormatSpecification defines thetargetandtitleproperties.

To specify the list of supported values for a parameter, the service may include the
@Redfish.AllowableValuesannotation.

For example, the following property defines theResetaction for aComputerSystem:

```
{
"#ComputerSystem.Reset": {
"target": "/redfish/v1/Systems/1/Actions/ComputerSystem.Reset",
"title": "Computer System Reset",
"ResetType@Redfish.AllowableValues": [
"On",
"ForceOff",
"GracefulRestart",
"GracefulShutdown",
"ForceRestart",
"Nmi",
"ForceOn",
"PushPowerButton"
]
},
...
}
```
Given this, the client could invoke a POST request to/redfish/v1/Systems/1/Actions/
ComputerSystem.Resetwith the following body:

Redfish Specification DSP0266

78 Published Version 1.8.1


```
POST /redfish/v1/Systems/1/Actions/ComputerSystem.ResetHTTP/1.1
Content-Type: application/json;charset=utf-8
Content-Length: <computed length>
OData-Version: 4.0
```
```
{
"ResetType":"On"
}
```
The resource may provide a separate@Redfish.ActionInforesource to describe the parameters and
values that a particular instance or implementation supports. Use the@Redfish.ActionInfo
annotation to specify theActionInforesource, which contains a URI to the@Redfish.ActionInfo
resource for the action. For details, see theAction info annotationclause.

**9.5.13.2. Action responses**

Response payloads for actions may contain a JSON body that is described by the schema definition for
the action. See theSchema definition languagesclause for the representation of these definitions.
Actions that do not define a response body may provide anerror responsein the response payload.

#### 9.5.14. Oem...................................................................................................................

TheOemproperty is used forResource extensibility-defined OEM extensions.

#### 9.5.15. Status................................................................................................................

TheStatusproperty represents the status of aresource. TheStatusproperty shall follow the definition
forStatusin theResourceschema.

By having a common representation of status, clients can depend on consistent semantics. TheStatus
property is capable of indicating the current state, health of the resource, and the health of subordinate
resources.

### 9.6. Resource, schema, property, and URI naming conventions.................................................

The Redfish interface is intended to be easily readable and intuitive. Thus, consistency helps the
consumer who is unfamiliar with a newly discovered property understand its use. While this is no
substitute for the normative information in the Redfish Specification and Redfish schema, the following
rules help with readability and client usage.

Standard Redfishresourcesdefined and published in the repository, or those created by others and
republished, shall follow a set of naming conventions. These conventions are intended to ensure
consistent naming and eliminate naming collisions. The resource name is used to construct thetype

DSP0266 Redfish Specification

Version 1.8.1 Published 79


propertyand the schema file name.

Standard Redfish properties follow similar naming conventions, and should use a common definition
when defined in multiple schemas across the Redfish data model. This consistency enables code re-use
across resources and increases interoperability. New resource definitions should leverage existing
property definitions whenever possible.

The resource, schema, property, and URI naming rules are as follows:

- Resource names, property names, and enumerations shall be Pascal-cased.
- The first letter of each word in a name shall be uppercase and spaces between words shall be
    removed. For example,ComputerSystem,PowerState, andSerialNumber.
- Names shall not contain spaces or underscore characters.
- Both characters should be capitalized for two-character acronyms. For example,IPAddressor
    RemoteIP.
- Only the first character of acronyms with three or more characters should be capitalized, except
    the first word of a Pascal-cased identifier, such asWwnorVirtualWwn. If a name is only a
    single acronym or mixed-case name, such as RDMA, iSCSI, or SNMP, the value should use the
    typical capitalization for that name.
- Enumeration values should start with a letter and be followed by letters, numbers, or
    underscores.

Exceptions are allowed for the following cases:

- Well-known technology names likeiSCSIoriSCSITarget.
- Product names likeiLO.
- Well-known abbreviations or acronyms.
- OEM appears asOemin resource and property names either alone or as a portion of a name,
    but should beOEMwhen used alone as an enumeration value.
- Enumeration values should be named for readability as they may appear unmodified on user
    interfaces, whereas property or resource names should follow the previous conventions and
    strive for consistency in naming with existing Redfish resources or properties.

For properties that have units or other special meaning, append a unit identifier to the name. The current
list includes:

- Bandwidth (Mbps). For example,PortSpeedMbps.
- CPU speed (Mhz). For example,ProcessorSpeedMhz.
- Memory size (MB). For example,MemoryMB.
- Counts of items (Count). For example,ProcessorCountorFanCount.
- The state of a resource (State). For example,PowerState.
- State values where work is in process. For example,ApplyingorClearingLogic.

In addition, the following rules apply to Redfish schema-defined URIs:

Redfish Specification DSP0266

80 Published Version 1.8.1


- URI segments should generally follow the name of the Redfish schema that defines the resource
    located at each segment.
- URI segments for resource collections should use the plural form of the resource collection
    schema name, with theCollectionterm omitted. For example,Processorsfor a
    ProcessorCollection.
- For resources that contain hyperlinks to more than one resource or resource collection of the
    same schema type, the URI segments should follow the name of the property that provides the
    hyperlink, for clarity.
- If a hyperlink to a subordinate resource is not found at the root of the resource, the URI
    segments should contain the property path. For example, for theCertificateshyperlink
    found inManagerNetworkProtocolwithin theHTTPSobject,HTTPSshould be one of the URI
    segments.

### 9.7. Resource extensibility...........................................................................................................

In the context of this clause, the OEM term refers to any company, manufacturer, or organization that
provides or defines an extension to the DMTF-published schema and functionality for Redfish. All
Redfish-specifiedresourcesinclude an empty structuredOemproperty. Its value can encapsulate one or
more OEM-specified structured properties. This predefined placeholder can contain OEM-specific
property definitions.

#### 9.7.1. OEM property format and content.......................................................................

Each property contained within theOempropertyshall be a JSON object. The name of the object
(property) shall uniquely identify the OEM or organization that defines the properties contained by that
object. This is described in more detail in the following clause. The OEM-specified object shall also
include atype propertythat provides the location of the schema and the type definition for the property
within that schema. TheOemproperty can simultaneously hold multiple OEM-specified objects, including
objects for more than one company or organization.

The definition of any other properties that are contained within the OEM-specific object, along with the
functional specifications, validation, or other requirements for that content is OEM-specific and outside the
scope of this specification. While there are no Redfish-specified limits on the size or complexity of the
OEM-specified elements within an OEM-specified JSON object, it is intended that OEM properties
typically be used for only a small number of simple properties that augment the Redfishresource. If a
large number of objects or a large quantity of data compared to the size of the Redfish resource is to be
supported, the OEM should consider having the OEM-specified object point to a separate resource for
their extensions.

#### 9.7.2. OEM property naming.........................................................................................

The OEM-specified objects within theOemproperty are named by using a unique OEM identifier for the

DSP0266 Redfish Specification

Version 1.8.1 Published 81


top of the namespace under which the property is defined. There are two specified forms for the identifier.
The identifier shall be either an ICANN-recognized domain name (including the top-level domain suffix),
with all dot (.) separators replaced with underscores (_), or an IANA-assigned Enterprise Number
prefixed with "EID_."

```
Deprecated: The identifier shall be either an ICANN-recognized domain name including the
top-level domain suffix, or an IANA-assigned Enterprise Number prefixed withEID:.
```
Organizations that use.comdomain names may omit the.comsuffix. For example, Contoso.com would
useContosoinstead ofContoso_com, but Contoso.org would useContoso_org. The domain name
portion of an OEM identifier shall be considered to be case independent. That is, the textContoso_biz,
contoso_BIZ,conTOso_biZ, and so on all identify the same OEM and top-level namespace.

The OEM identifier portion of the property name may be followed by an underscore (_) and any additional
string to enable further creation of namespaces of OEM-specified objects as desired by the OEM. For
example,Contoso_xxxxorEID_412_xxxx. The form and meaning of any text that follows the trailing
underscore is completely OEM-specific. OEM-specified extension suffixes may be case sensitive,
depending on the OEM. Generic client software should treat such extensions, if present, as opaque and
not try to parse nor interpret the content.

This suffix could be used in many ways, depending on OEM need. For example, the Contoso company
may have a _Research_ suborganization, in which case the OEM-specified property name might be
extended to _Contoso _Research_. Alternatively, it can identify a namespace for a functional area,
geography, subsidiary, and so on.

The OEM identifier portion of the name typically identifies the company or organization that created and
maintains the schema for the property. However, this is not a requirement. The identifier is only required
to uniquely identify the party that is the top-level manager of a namespace to prevent collisions between
OEM property definitions from different vendors or organizations. Consequently, the organization for the
top of the namespace may be different than the organization that provides the definition of the OEM-
specified property. For example, Contoso may allow one of their customers, such asCustomerA, to
extend a Contoso product with certain CustomerA proprietary properties. In this case, although Contoso
allocated the nameContoso_customers_CustomerA, it could be CustomerA that defines the content
and functionality under that namespace. In all cases, OEM identifiers should not be used except with
permission or as specified by the identified company or organization.

#### 9.7.3. OEM resource naming and URIs.........................................................................

Companies, OEMs, and other organizations can define additionalresourcesand link to them from anOem
propertyfound in a standard Redfish resource. To avoid naming collisions with current or future standard
Redfish schema files, the defining organization's name should be prepended to the resource name. For
example,ContosoDrivewould not conflict with aDriveresource or another OEM's drive-related
resource.

Redfish Specification DSP0266

82 Published Version 1.8.1


To avoid URI collisions with other OEM resources and future Redfish standard resources, the URIs for
OEM resources within the Redfish _resource tree_ shall be in the form:

_BaseUri_ /Oem/ _OemName_ / _ResourceName_

where

```
Variable Description
```
```
BaseUri
```
```
URI segment of the standard Redfish resource starting with/redfish/where
theOemproperty is used. For example,/redfish/v1/Systems/
3AZ38944T523.
```
```
OemName
Name of the OEM, that follows the same naming as defined in theOemproperty
format and contentclause.
```
```
ResourceName Name of the OEM-defined resource.
```
For example, if Contoso defined a newContosoAccountServiceMetricsresource to be linked
through theOemproperty at the/redfish/v1/AccountServiceURI, the OEM resource has the
/redfish/v1/AccountService/Oem/Contoso/AccountServiceMetricsURI.

#### 9.7.4. OEM property examples......................................................................................

The following fragment presents some examples of naming and use of theOemproperty as it might
appear when accessing aresource. The example shows that the OEM identifiers can be of different
forms, that OEM-specified content can be simple or complex, and that the format and usage of
extensions of the OEM identifier is OEM-specific.

```
{
"Oem": {
"Contoso": {
"@odata.type": "#Contoso.v1_2_1.AnvilTypes1",
"slogan": "Contoso anvils never fail",
"disclaimer": "* Most of the time"
},
"Contoso_biz": {
"@odata.type": "#ContosoBiz.v1_1.RelatedSpeed",
"speed" : "ludicrous"
},
"EID_412_ASB_123": {
"@odata.type": "#OtherSchema.v1_0_1.powerInfoExt",
"readingInfo": {
"readingAccuracy": "5",
```
DSP0266 Redfish Specification

Version 1.8.1 Published 83


```
"readingInterval": "20"
}
},
"Contoso_customers_customerA": {
"@odata.type" : "#ContosoCustomer.v2015.slingPower",
"AvailableTargets" : [ "rabbit", "duck", "runner" ],
"launchPowerOptions" : [ "low", "medium", "eliminate" ],
"powerSetting" : "eliminate",
"targetSetting" : "rabbit"
}
},
```
```
}
```
#### 9.7.5. OEM actions........................................................................................................

OEM-specific actions appear in the JSON payload as properties of theOemobject, nested under an
Actions property.

The name of the property that represents the action, which shall follow the form:

# _Namespace_. _Action_

where

```
Variable Description
```
```
Namespace Namespace.
```
```
Action Action.
```
```
{
"Actions": {
"Oem": {
"#Contoso.Ping": {
"target":"/redfish/v1/Systems/1/Actions/Oem/Contoso.Ping"
}
}
},
...
}
```
The URI of the OEM action in thetargetproperty shall be in the form:

Redfish Specification DSP0266

84 Published Version 1.8.1


_ResourceUri_ /Actions/Oem/ _Namespace_. _Action_

where

```
Variable Description
```
```
ResourceUri
URI of the resource that supports invoking the action. For example,
/redfish/v1/Systems/1/.
```
```
Actions Name of the property containing the actions for a resource.
```
```
Oem Name of the OEM property within theActionsproperty.
```
```
Namespace. Action Namespace followed by the action. For example,Contoso.Ping.
```
### 9.8. Payload annotations.............................................................................................................

Resources,objects within a resource, andpropertiesmay include additional annotations as properties
with the name, in the format:

[ _PropertyName_ ]@ _Namespace_. _TermName_

where

```
Variable Description
```
```
PropertyName Name of the property to annotate. If absent, the annotation applies to the entire
JSON object, which may be an entire resource.
```
```
Namespace Namespace that defines the annotation term.
```
```
TermName Annotation term to apply to the resource or property of the resource.
```
Services shall limit the annotation usage to theodata,Redfish, andMessagenamespaces. TheOData
JSON FormatSpecification defines theodatanamespace. TheRedfishnamespace is an alias for the
RedfishExtensions.v1_0_0namespace.

The client can get the definition of the annotation from theOData metadata document, theHTTPLink
header, or may ignore the annotation entirely, but should not fail reading the resource due to
unrecognized annotations, including new annotations that theRedfishnamespace defines.

#### 9.8.1. Allowable values..................................................................................................

To specify the list of allowable values for apropertyoractionparameter, services may use the

DSP0266 Redfish Specification

Version 1.8.1 Published 85


@Redfish.AllowableValuesannotation for properties or action parameters.

To specify the set of allowable values, include a property with the name of the property or action
parameter, followed by@Redfish.AllowableValues. The property value is a JSON array of strings
that define the allowable values for the property or action parameter.

#### 9.8.2. Extended information...........................................................................................

The following clauses describe the methods of providing extended information:

- Extended object information
- Extended property information

**9.8.2.1. Extended object information**

To specify object-level status information, services may annotate a JSON object with the
@Message.ExtendedInfoannotation.

```
{
"@odata.id":"/redfish/v1/Managers/1/SerialInterfaces/1",
"@odata.type":"#SerialInterface.v1_0_0.SerialInterface",
"Name":"Managed Serial Interface 1",
"Description":"Management for Serial Interface",
"Status": {
"State":"Enabled",
"Health":"OK"
},
"InterfaceEnabled":true,
"SignalType":"Rs232",
"BitRate": "115200",
"Parity":"None",
"DataBits": "8",
"StopBits": "1",
"FlowControl":"None",
"ConnectorType":"RJ45",
"PinOut":"Cyclades",
"@Message.ExtendedInfo": [
{
"MessageId": "Base.1.0.PropertyDuplicate",
"Message":"Indicates that a duplicate property was included in the
request body.",
"RelatedProperties": [
"#/InterfaceEnabled"
],
"Severity":"Warning",
"Resolution": "Remove the duplicate property from the request body and
```
Redfish Specification DSP0266

86 Published Version 1.8.1


```
resubmit the request if the operation failed."
}
]
}
```
The property contains an array ofmessage objects.

**9.8.2.2. Extended property information**

Services may use@Message.ExtendedInfo, prepended with the name of the property to annotate an
individual property in a JSON object with extended information:

```
{
"@odata.id":"/redfish/v1/Managers/1/SerialInterfaces/1",
"@odata.type":"#SerialInterface.v1_0_0.SerialInterface",
"Name":"Managed Serial Interface 1",
"Description":"Management for Serial Interface",
"Status": {
"State":"Enabled",
"Health":"OK"
},
"InterfaceEnabled":true,
"SignalType":"Rs232",
"BitRate": 115200 ,
"Parity":"None",
"DataBits": 8 ,
"StopBits": 1 ,
"FlowControl":"None",
"ConnectorType":"RJ45",
"PinOut":"Cyclades",
"PinOut@Message.ExtendedInfo": [
{
"MessageId": "Base.1.0.PropertyValueNotInList",
"Message":"The value Contoso for the property PinOut is not in the list
of acceptable values.",
"Severity":"Warning",
"Resolution": "Choose a value from the enumeration list that the
implementation can support and resubmit the request if the operation failed."
}
]
}
```
DSP0266 Redfish Specification

Version 1.8.1 Published 87


#### 9.8.3. Action info annotation..........................................................................................

The action info annotation conveys the parameter requirements and allowable values on parameters for
actions. This is done using@Redfish.ActionInfoterm within theaction representation. This term
contains a URI to theActionInforesource.

Example#ComputerSystem.Resetaction with the@Redfish.ActionInfoannotation and resource:

```
{
"Actions": {
"#ComputerSystem.Reset": {
"target": "/redfish/v1/Systems/1/Actions/ComputerSystem.Reset",
"@Redfish.ActionInfo": "/redfish/v1/Systems/1/ResetActionInfo"
}
},
...
}
```
TheResetActionInforesource contains a more detailed description of the parameters and the
supported values. This resource follows theActionInfoschema definition.

```
{
"@odata.id":"/redfish/v1/Systems/1/ResetActionInfo",
"@odata.type":"#ActionInfo.v1_0_0.ActionInfo",
"Id":"ResetActionInfo",
"Name":"Reset Action Info",
"Parameters": [
{
"Name":"ResetType",
"Required":true,
"DataType":"String",
"AllowableValues": [
"On",
"ForceOff",
"ForceRestart",
"Nmi",
"ForceOn",
"PushPowerButton"
]
}
]
}
```
Redfish Specification DSP0266

88 Published Version 1.8.1


#### 9.8.4. Settings and settings apply time annotations......................................................

See theSettings resourceclause.

#### 9.8.5. Operation apply time and operation apply time support annotations..................

See theOperation apply timeclause.

#### 9.8.6. Maintenance window annotation.........................................................................

Thesettings apply timeandoperation apply timeannotations allow for an operation to be performed
during a maintenance window. The@Redfish.MaintenanceWindowterm at the root of a resource
configures the start time and duration of a maintenance window for a resource.

The following example body for the/redfish/v1/Systems/1resource configures the maintenance
window to start at2017-05-03T23:12:37-05:00and last for 600 seconds.

```
{
"@odata.id": "/redfish/v1/Systems/1",
"@odata.type": "#ComputerSystem.v1_5_0.ComputerSystem",
"@Redfish.MaintenanceWindow": {
"MaintenanceWindowStartTime": "2017-05-03T23:12:37-05:00",
"MaintenanceWindowDurationInSeconds": 600
},
```
```
}
```
#### 9.8.7. Collection capabilities annotation........................................................................

Resource collectionsmay contain a collection capabilities annotation. The
@Redfish.CollectionCapabilitiesterm at the root of a resource collection shows what properties
a client is allowed to use in aPOST requestfor creating a new resource.

The followingComputerSystemCollectionexample body contains the collection capabilities
annotation. TheUseCaseproperty contains theComputerSystemCompositionvalue, and the
CapabilitiesObjectproperty contains the/redfish/v1/Systems/Capabilitiesvalue. The
resource at/redfish/v1/Systems/Capabilitiesdescribes the POST request format for creating a
ComputerSystemresource for compositions.

```
{
"@odata.id":"/redfish/v1/Systems",
```
DSP0266 Redfish Specification

Version 1.8.1 Published 89


```
"@odata.type":"#ComputerSystemCollection.ComputerSystemCollection",
"Name":"Computer System Collection",
"Members@odata.count": 0 ,
"Members": [],
"@Redfish.CollectionCapabilities": {
"@odata.type":"#CollectionCapabilities.v1_1_0.CollectionCapabilities",
"Capabilities": [
{
"CapabilitiesObject": {
"@odata.id":"/redfish/v1/Systems/Capabilities"
},
"UseCase":"ComputerSystemComposition",
"Links": {
"TargetCollection": {
"@odata.id":"/redfish/v1/Systems"
} } } ] } }
```
TheCapabilitiesObjectresource follows the same schema for the resource that the resource
collection contains. It contains annotations to show which properties the client is allowed to use in the
POST request body. The annotations describe which properties are required, optional, or if other rules are
associated with the properties.

```
Annotation Description
```
```
PropertyName @Redfish.RequiredOnCreate Required in the POST request body.
```
```
PropertyName @Redfish.OptionalOnCreate Not required in the POST request body.
```
```
PropertyName @Redfish.SetOnlyOnCreate Cannot be modified after the resource is
created.
```
```
PropertyName @Redfish.UpdatableAfterCreate
Can be modified after the resource is
created.
```
```
PropertyName @Redfish.AllowableValues Can be set to any of the listed values.
```
```
@Redfish.RequestedCountRequired
```
```
Required in the POST request body for
the corresponding object to indicate the
number of requested object instances.
```
Redfish Specification DSP0266

90 Published Version 1.8.1


```
Annotation Description
```
```
Used forcomposition requests.
```
```
@Redfish.ResourceBlockLimits
```
```
Indicates restrictions regarding
quantities ofResourceBlock
resources of a given type in the POST
request body.
```
```
Used forcomposition requests.
```
ExampleCapabilitiesObjectresource:

```
{
"@odata.id":"/redfish/v1/Systems/Capabilities",
"@odata.type":"#ComputerSystem.v1_8_0.ComputerSystem",
"Id":"Capabilities",
"Name":"Capabilities for the system collection",
"Name@Redfish.RequiredOnCreate":true,
"Name@Redfish.SetOnlyOnCreate": true,
"Description@Redfish.OptionalOnCreate":true,
"Description@Redfish.SetOnlyOnCreate":true,
"HostName@Redfish.OptionalOnCreate":true,
"HostName@Redfish.UpdatableAfterCreate": true,
"Links@Redfish.RequiredOnCreate":true,
"Links": {
"ResourceBlocks@Redfish.RequiredOnCreate":true,
"ResourceBlocks@Redfish.UpdatableAfterCreate": true
},
"@Redfish.ResourceBlockLimits": {
"MinCompute": 1 ,
"MaxCompute": 1 ,
"MaxStorage": 8
}
}
```
#### 9.8.8. Requested count and allow over-provisioning annotations.................................

Clients use the requested count and allow over-provisioning annotations incomposition requeststo
express the quantity of a type ofresourceto allocate:

DSP0266 Redfish Specification

Version 1.8.1 Published 91


```
Annotation Description
```
```
@Redfish.RequestedCount Number of requested resources.
```
```
@Redfish.AllowOverprovisioning
```
```
Boolean. Iftrue, the service may provision more
resources than the@Redfish.RequestedCount
annotation requests. Default isfalse.
```
Example client request for four or moreProcessorresources:

```
{
"Processors": {
"Members": [
{
"@Redfish.RequestedCount": 4,
"@Redfish.AllowOverprovisioning": true
}
]
},
```
```
}
```
#### 9.8.9. Zone affinity annotation.......................................................................................

The zone affinity annotation is used by clients incomposition requeststo indicate the components for the
composition come from the specified Resource Zone. The@Redfish.ZoneAffinityterm in the
request body contains the value of theIdproperty of the requested Resource Zone.

Example client request for components to be allocated from the Resource Zone with theIdproperty
containing 1 :

```
{
"@Redfish.ZoneAffinity": "1",
```
```
}
```
#### 9.8.10. Supported certificates annotation......................................................................

Resource collectionsof typeCertificateCollectionshould contain a supported certificates
annotation. The@Redfish.SupportedCertificatesterm at the root of a resource collection shows
the different certificate formats allowed in the resource collection.

Redfish Specification DSP0266

92 Published Version 1.8.1


ExampleCertificateCollectionthat only supports PEM style certificates:

```
{
"@odata.id":"/redfish/v1/Managers/BMC/NetworkProtocol/HTTPS/Certificates",
"@odata.type":"#CertificateCollection.CertificateCollection",
"Name":"Certificate collection",
"Members@odata.count": 1 ,
"Members": [
{
"@odata.id": "/redfish/v1/Managers/BMC/NetworkProtocol/HTTPS/Certificates/
1"
}
],
"@Redfish.SupportedCertificates": [
"PEM"
]
}
```
#### 9.8.11. Deprecated annotation.......................................................................................

Services may annotatepropertieswith@Redfish.Deprecatedif the schema definition has the property
marked as deprecated.

Example deprecated property:

```
{
"VendorID": "0xABCD",
"VendorID@Redfish.Deprecated": "This property has been deprecated in favor of
ModuleManufacturerID.",
```
```
}
```
### 9.9. Settings resource..................................................................................................................

A settings resource represents the future intended state of aresource. Some resources have properties
that can be updated and the updates take place immediately; however, some properties need to be
updated at a certain point in time, such as a system reset. While the resource represents the current
state, the settings resource represents the future intended state. The service represents properties of a
resource that can only be updated at a certain point in time using a@Redfish.Settingspayload
annotation. The settings annotation contains a link to a subordinate resource with the same schema
definition. The properties within the settings resource contain the properties that are updated at a certain
point in time.

DSP0266 Redfish Specification

Version 1.8.1 Published 93


For resources that support a future state and configuration, the response shall contain a property with the
@Redfish.Settingsannotation. When a settings annotation is used, the following conditions shall
apply:

- The settings resource linked to current resource with the@Redfish.Settingsannotation shall
    be of the same schema definition.
- The settings resource should be a subset of properties that can be updated.
- The settings resource shall not contain the@Redfish.Settingsannotation.
- The settings resource may contain the@Redfish.SettingsApplyTimeannotation.

The settings resource includes several properties to help clients monitor when the resource is consumed
by the service and determine the results of applying the values, which may or may not have been
successful.

- TheMessagesproperty is a collection of messages that represent the results of the last time the
    values of the settings resource were applied.
- TheETagproperty contains the ETag of the settings resource that was last applied.
- TheTimeproperty indicates the time when the settings resource was last applied.

The following resource example body supports a settings resource. A client can use the
SettingsObjectproperty to locate the URI of the settings resource.

```
{
"@Redfish.Settings": {
"@odata.type": "#Settings.v1_0_0.Settings",
"SettingsObject": {
"@odata.id": "/redfish/v1/Systems/1/Bios/SD"
},
"Time": "2017-05-03T23:12:37-05:00",
"ETag": "A89B031B62",
"Messages": [
{
"MessageId": "Base.1.0.PropertyNotWritable",
"RelatedProperties": [
"#/Attributes/ProcTurboMode"
]
}
]
},
...
}
```
When a client updates the settings resource, it may include the@Redfish.SettingsApplyTime
annotation in the request to indicate when to apply the settings.

Redfish Specification DSP0266

94 Published Version 1.8.1


- If a service enables a client to indicate when to apply settings, the settings resource shall contain
    a property with the@Redfish.SettingsApplyTimeannotation.
- Only settings resources shall contain the@Redfish.SettingsApplyTimeannotation.

In the following example request, the client indicates that the settings resource values are applied either
on reset or during the specified maintenance window:

```
{
"@Redfish.SettingsApplyTime": {
"@odata.type": "#Settings.v1_1_0.PreferredApplyTime",
"ApplyTime": "OnReset",
"MaintenanceWindowStartTime": "2017-05-03T23:12:37-05:00",
"MaintenanceWindowDurationInSeconds": 600
},
```
```
}
```
### 9.10. Special resource situations.................................................................................................

#### 9.10.1. Overview............................................................................................................

Resourcesneed to exhibit common semantic behavior whenever possible. This can be difficult in some
situations discussed in this clause.

#### 9.10.2. Absent resources...............................................................................................

Resourcesmay be absent or their state unknown at the time a client requests information about that
resource. For resources that represent removable or optional components, absence provides useful
information to clients because it indicates a capability, such as an empty PCIe slot, DIMM socket, or drive
bay, that would not be apparent if the resource simply did not exist.

This also applies to resources that represent a limited number of items or unconfigured capabilities within
an implementation, but this usage should be applied sparingly and should not apply to resources limited
in quantity due to arbitrary limits. For example, an implementation that limitsSoftwareInventoryto a
maximum of 20 items should not populate 18 absent resources when only two items are present.

For resources that provide useful data in an absent state and where the URI is expected to remain
constant, such as when a DIMM is removed from a memory socket, the resource should exist and should
return a value ofAbsentfor theStateproperty in theStatusobject.

In this circumstance, any required properties for which there is no known value shall be represented as
null. Properties whose support is based on the configuration choice or the type of component installed,
and therefore unknown while in the absent state, should not be returned. Likewise, subordinate resources

DSP0266 Redfish Specification

Version 1.8.1 Published 95


for an absent resource should not be populated until their support can be determined. For example, the
PowerandThermalresources under aChassisresource should not exist for an absent Chassis.

Client software should be aware that when absent resources are later populated, the updated resource
may represent a different configuration or physical item, and previous data, including read-only properties,
obtained from that resource may be invalid. For example, theMemoryresource shows details about an
single DIMM socket and the installed DIMM. When that DIMM is removed, theMemoryresource remains
as an absent resource to indicate the empty DIMM socket. Later, a new DIMM is installed in that socket,
and theMemoryresource represents data about this new DIMM, which could have completely different
characteristics.

### 9.11. Registries............................................................................................................................

Registryresourcesassist the client in interpreting Redfish resources beyond the Redfish schema
definitions. To get more information about a resource, event, message, or other item, use an identifier to
search registries. This information can include other properties, property restrictions, and the like.
Registries are themselves resources.

Redfish defines the following types of registries:

```
Registry Description See
```
##### BIOS

```
Determines the semantics of each property in a
BIOS or BIOSsettings resource. Because BIOS
information can vary from platform to platform,
Redfish cannot define a fixed schema for these
values.
```
```
This registry contains both property descriptions
and other information, such as data type,
allowable values, and user menu information.
```
```
Message
```
```
Constructs a message from aMessageIdand
other message information to present to an end
user. The messages in these registries appear in
both eventing and error responses to operations.
```
```
This registry is the most common type of registry.
```
- Error responses
- Eventing

Redfish Specification DSP0266

96 Published Version 1.8.1


```
Registry Description See
```
```
Privilege
```
```
Maps the resources in a Redfish Service to the
privileges that can complete specified operations
against those resources.
```
```
A client can use this information to:
```
- Determine which roles should have
    specific privileges.
- Map accounts to those roles so that the
    accounts can complete operations on
    Redfish resources.

```
Privilegemodelandauthorization
```
### 9.12. Schema annotations...........................................................................................................

The schema definitions of the data model use schema annotations to provide additional documentation
for developers. This clause describes the different types of schema annotations that the Redfish data
model uses. For information about how each of the annotations are implemented in their respective
schema languages, see theSchema definition languagesclause.

#### 9.12.1. Description annotation.......................................................................................

The description annotation can be applied to any type, property, action, or parameter to provide a
description of Redfish schema elements suitable for end users or user interface help text.

A description annotation shall be included on the following schema definitions:

- Redfish types
- Properties
- Reference properties
- Enumeration values
- Resourcesandresource collections
- Structured types

#### 9.12.2. Long description annotation..............................................................................

The long description annotation can be applied to any type, property, action, or parameter to provide a
formal, normative specification of the schema element.

When the long descriptions in the Redfish schema contain normative language, the service shall be
required to conform with the statement.

DSP0266 Redfish Specification

Version 1.8.1 Published 97


A long description annotation shall be included on the following schema definitions:

- Redfish types
- Properties
- Reference properties
- Resourcesandresource collections
- Structured types

#### 9.12.3. Resource capabilities annotation.......................................................................

The resource capabilities annotation can be applied toresourcesandresource collectionsto express the
different type of HTTP operations a client can invoke on the given resource or resource collection.

- Insert capabilities indicate whether a client can perform a POST on the resource.
- Update capabilities indicate whether a client can perform a PATCH or PUT on the resource.
- Delete capabilities indicate whether a client can perform a DELETE on the resource.
- A service may implement a subset of the capabilities that are allowed on the resource or
    resource collection.

All schema definitions for Redfish resources and resource collections shall include resource capabilities
annotations.

#### 9.12.4. Resource URI patterns annotation....................................................................

The resource URI patterns annotation expresses the valid URI patterns for aresourceorresource
collection.

The strings for the URI patterns may use{and}characters to express parameters within a given URI
pattern. Items between the{and}characters are treated as identifiers within the URI for given instances
of a Redfish resource. Clients interpret this as a string to be replaced to access a given resource. A URI
pattern may contain multiple identifier terms to support multiple levels of nested resource collections. The
identifier term in the URI pattern shall match theIdstring property for the corresponding resource, or the
MemberIdstring property for the corresponding object within a resource. The process for forming the
strings that are concatenated to form the URI pattern are in theresource, schema, property, and URI
naming conventionsclause.

The following string is an example URI pattern that describes aManagerAccountresource:/redfish/
v1/AccountService/Accounts/{ManagerAccountId}

Using the previous example,{ManagerAccountId}is replaced by theIdproperty of the corresponding
ManagerAccountresource. If theIdproperty for aManagerAccountresource isJohn, the full URI for
that resource is/redfish/v1/AccountService/Accounts/John.

The URI patterns are constructed based on the formation of the _resource tree_. When constructing the URI

Redfish Specification DSP0266

98 Published Version 1.8.1


pattern for a subordinate resource, the URI pattern for the current resource is used and appended. For
example, theRoleCollectionresource is subordinate toAccountService. Because the URI pattern
forAccountServiceis/redfish/v1/AccountService, the URI pattern for theRoleCollection
resource is/redfish/v1/AccountService/Roles.

In some cases, the subordinate resource is found inside of astructured propertyof a resource. In these
cases, the name of the structured property appears in the URI pattern for the subordinate resource. For
example, theCertificateCollectionresource is subordinate to theManagerNetworkProtocol
resource from theHTTPSproperty. Because the URI pattern forManagerNetworkProtocolis
/redfish/v1/Managers/{ManagerId}/NetworkProtocol, the URI pattern for the
CertificateCollectionresource is/redfish/v1/
Managers/{ManagerId}/NetworkProtocol/HTTPS/Certificates.

All schema definitions for Redfish resources and Redfish resource collections shall be annotated with the
resource URI patterns annotation.

All Redfish resources and Redfish resource collections implemented by a service shall match the URI
pattern described by the resource URI patterns annotation for their given definition.

#### 9.12.5. Additional properties annotation........................................................................

The additional properties annotation specifies whether a type can contain additionalpropertiesoutside of
those defined in the schema. Types that do not support additional properties shall not contain properties
beyond those described in the schema.

#### 9.12.6. Permissions annotation.....................................................................................

The permissions annotation specifies whether a client can modify the value of aproperty, or if the
property is read-only.

A service may implement a modifiable property as read-only.

#### 9.12.7. Required annotation..........................................................................................

The required annotation specifies whether a service needs to support aproperty. Required properties
shall be annotated with the required annotation. All other properties are optional.

#### 9.12.8. Required on create annotation..........................................................................

The required on create annotation specifies that apropertyis required to be provided by the client on
creation of theresource. Properties not annotated with the required on create annotation are not required
to be provided by the client on a create operation.

DSP0266 Redfish Specification

Version 1.8.1 Published 99


#### 9.12.9. Units of measure annotation............................................................................

In addition to followingnaming conventions,propertiesrepresenting units of measure shall be annotated
with the units of measure annotation to specify the units of measurement for the property.

The value of the annotation shall be a string that contains the case-sensitive "(c/s)" symbol of the unit of
measure as listed in theUnified Code for Units of Measure (UCUM), unless the symbolic representation
does not reflect common usage. For example,RPMcommonly reports fan speeds in revolutions-per-
minute but has no simple UCUM representation. For units with prefixes, the case-sensitive (c/s) symbol
for the prefix as listed in UCUM should be prepended to the unit symbol. For example, Mebibyte (1024^2
bytes), which has the UCUMMiprefix andBysymbol, would useMiByas the value for the annotation.
For values that also include rate information, such as megabits per second, the rate unit's symbol should
be appended and use a slash (/) character as a separator. For example,Mbit/s.

#### 9.12.10. Expanded resource annotation......................................................................

The expanded resource annotation can be applied to areference propertyto specify that the default
behavior for the service is to include the contents of the relatedresourceorresource collectionin
responses. This behavior follows the same semantics of theexpand query parameterwith a level of 1.

Reference properties annotated with this term shall be expanded by the service, even if not requested by
the client. A service may pageresource collections.

#### 9.12.11. Owning entity annotation...............................................................................

The owning entity annotation can be applied to a schema to specify the name of the entity responsible for
development, publication, and maintenance of a given schema.

### 9.13. Versioning.........................................................................................................................

As stated previously, a resource can be an individual entity or a resource collection, which acts as a
container for a set of resources.

Aresource collectiondoes not contain any version information because it defines a singleMembers
property, and the overall collection definition never grows over time.

Aresourcehas both unversioned and versioned definitions.

References from other resources use the unversioned definition of a resource to ensure no version
dependencies exist between the definitions. The unversioned definition of a resource contains no
property information about the resource.

The versioned definition of a resource contains a set of properties, actions, and other definitions
associated with the given resource. The version of a resource follows the format:

Redfish Specification DSP0266

100 Published Version 1.8.1


v _X_. _Y_. _Z_

where

```
Variable Type Version Description
```
```
X Integer Major
version.
Backward-incompatible change.
```
```
Y Integer
Minor
version.
```
```
Minor update. Redfish introduces new functionality but does
not remove any functionality. The minor version preserves
compatibility with earlier minor versions. For example, a new
property introduces a new minor version of the resource.
```
```
Z Integer
Errata
version.
```
```
Fix in an earlier version. For example, a fix to aschema
annotationon a property introduces an errata version of the
resource.
```
### 9.14. Localization.......................................................................................................................

The creation of separate localized copies of Redfish schemas and registries is allowed and encouraged.
Localized schema and registry files may be submitted to the DMTF for republication in the Redfish
Schema Repository.

Property names, parameter names, and enumeration values in the JSON response payload are never
localized but translated copies of those names may be provided as additional annotations in the localized
schema for use by client applications. A separate file for each localized schema or registry shall be
provided for each supported language. The English-language versions of Redfish schemas and registries
shall be the normative versions, and alterations of meaning due to translation in localized versions of
schemas and registries shall be forbidden.

Schemas and registries in non-English languages shall use the appropriate schema annotations to
identify their language. Descriptive property, parameter, and enumeration text not translated into the
specified language shall be removed from localized versions. This removal enables software and tools to
combine normative and localized copies, especially for minor schema version differences.

## 10. File naming and publication................................................................................................................

For consistency in publication and to enable programmatic access, all Redfish-related files shall follow a
set of rules to construct the name of each file. TheSchema definition languagesclause describes the file
name construction rules, while the following clauses describe the construction rules for other file types.

DSP0266 Redfish Specification

Version 1.8.1 Published 101


### 10.1. Registry file naming..........................................................................................................

Redfish Message or Privilege Registry Files shall use the registry name to construct the file name, in this
format:

_RegistryName_. _MajorVersion_. _MinorVersion_. _Errata_ .json

For example, the file name of the Base Message Registry v1.0.2 isBase.1.0.2.json.

### 10.2. Profile file naming.............................................................................................................

The document that describes a profile follows the Redfish schema file naming conventions. The file name
format for profiles shall be:

_ProfileName_ .v _MajorVersion_ _ _MinorVersion_ _ _Errata_ .json

For example, the file name of the BasicServer profile v1.2.0 isBasicServer.v1_2_0.json. The file
name shall include the profile name and version, which matches those property values within the
document.

### 10.3. Dictionary file naming........................................................................................................

The binary file describing a Redfish Device Enablement Dictionary follows the Redfish schema file
naming conventions for the schema definition language that the dictionary is converted from. Because a
single Dictionary file contains all minor revisions of the schema, only the major version appears in the file
name. The file names for Dictionaries shall be formatted as:

_DictionaryName_ _v _MajorVersion_ .dict

For example, the file name of the Chassis dictionary v1.2.0 isChassis_v1.dict.

### 10.4. Localized file naming........................................................................................................

Localized schemas and registries shall follow the same file naming conventions as the English language
versions. When multiple localized copies are present in a repository and which have the same file name,
files in languages other than English shall be organized into subfolders named to match theISO 639-1
language code for those files. English language files may be duplicated in anensubfolder for
consistency.

### 10.5. DMTF Redfish file repository............................................................................................

All Redfish schemas, registries, dictionaries, and profiles published or republished by the DMTF's Redfish

Redfish Specification DSP0266

102 Published Version 1.8.1


Forum are available from the DMTF websitehttp://redfish.dmtf.org/for download. Programs may use the
following durable URLs to access the repository. Programs incorporating remote repository access should
implement a local cache to reduce latency, program requirements for Internet access and undue traffic
burden on the DMTF website.

Organizations creating Redfish-related files such as OEM schemas, Redfish Interoperability Profiles, or
Message Registries are encouraged to use the form athttps://redfish.dmtf.org/redfish/portalto submit
those files to the DMTF for republication in the DMTF Redfish file repository.

The files are organized on the site in the following manner:

```
URL Folder contents
```
```
redfish.dmtf.org/
schemas
```
```
Current (most recent minor or errata) release of each schema file in
CSDL, JSON Schema, and/or OpenAPI formats.
```
```
redfish.dmtf.org/
schemas/v1
```
```
Durable URL for programmatic access to all v1.xx schema files. Every
v1.xx minor or errata release of each schema file in CSDL, JSON
Schema, OpenAPI formats.
```
```
redfish.dmtf.org/
schemas/v1/{code}
```
```
Durable URL for programmatic access to localized v1.xx schema files.
Localized schemas are organized in subfolders using the two-character
ISO 639-1 language code as the {code} segment.
```
```
redfish.dmtf.org/
schemas/archive
Subfolders contain schema files specific to a particular version release.
```
```
redfish.dmtf.org/
registries
Current (most recent minor or errata) release of each registry file.
```
```
redfish.dmtf.org/
registries/v1
```
```
Durable URL for programmatic access to all v1.xx registry files. Every
v1.xx minor or errata release of each registry file.
```
```
redfish.dmtf.org/
registries/
v1/{code}
```
```
Durable URL for programmatic access to localized v1.xx registry files.
Localized schemas are organized in subfolders using the two-character
ISO 639-1 language code as the {code} segment.
```
```
redfish.dmtf.org/
registries/
archive
```
```
Subfolders contain registry files specific to a particular version release.
```
```
redfish.dmtf.org/
profiles
```
```
Current release of each Redfish Interoperability Profile (.json) file and
associated documentation.
```
```
redfish.dmtf.org/ Durable URL for programmatic access to all v1.xx Redfish
```
DSP0266 Redfish Specification

Version 1.8.1 Published 103


```
URL Folder contents
```
```
profiles/v1 Interoperability Profile (.json) files.
```
```
redfish.dmtf.org/
profiles/archive
```
```
Subfolders contain profile files specific to a particular profile version or
release.
```
```
redfish.dmtf.org/
dictionaries
```
```
Durable URL for programmatic access to all v1.xx Redfish Device
Enablement Dictionary files.
```
```
redfish.dmtf.org/
dictionaries/v1
```
```
Durable URL for programmatic access to all v1.xx Redfish Device
Enablement Dictionary files.
```
```
redfish.dmtf.org/
dictionaries/
archive
```
```
Subfolders contain dictionary files specific to a particular version release.
```
## 11. Schema definition languages..............................................................................................................

Individual resources and their dependent types and actions are defined within a Redfish schema
document. This clause describes how these documents are constructed in the following formats:

- OData Common Schema Definition Language
- JSON Schema
- OpenAPI

### 11.1. OData Common Schema Definition Language.................................................................

OData Common Schema Definition Language (CSDL) is an XML schema format defined by theOData
CSDLSpecification. The following clause describes how Redfish uses CSDL to describe resources and
resource collections.

#### 11.1.1. File naming conventions for CSDL..................................................................

Redfish CSDL schema files shall be named using theresource namevalue, followed by_vand the major
version of the schema. Because a single CSDL schema file contains all minor revisions of the schema,
only the major version appears in the file name. The file name shall be formatted as:

_TypeName_ _v*MajorVersion*.xml

For example, version 1.3.0 of the Chassis schema isChassis_v1.xml.

Redfish Specification DSP0266

104 Published Version 1.8.1


#### 11.1.2. Core CSDL files...............................................................................................

The fileResource_v1.xmlcontains all base definitions for resources, resource collections, and
common properties such asStatus.

The fileRedfishExtensions_v1.xmlcontains the definitions for all Redfish types and annotations.

#### 11.1.3. CSDL format....................................................................................................

The outer element of the OData schema representation document shall be theEdmxelement, and shall
have aVersionattribute with a value of4.0.

```
<edmx:Edmxxmlns:edmx="http://docs.oasis-open.org/odata/ns/edmx" Version="4.0">
<!-- edmx:Reference and edmx:DataService elements go here -->
</edmx:Edmx>
```
TheReferencing other CSDL filesandCSDL data servicesclauses describe the items that are found
within theEdmxelement.

**11.1.3.1. Referencing other CSDL files**

CSDL files may reference types defined in other CSDL documents. This is done by includingReference
tags.

The Reference element uses theUriattribute to specify a CSDL file. The Reference element also
contains one or moreIncludetags that specify theNamespaceattribute containing the types to be
referenced, along with an optionalAliasattribute for that namespace.

Type definitions generally reference the OData and Redfish namespaces for common type annotation
terms. Redfish CSDL files always use theAliasattribute on the following namespaces:

- Org.OData.Core.V1is aliased asOData.
- Org.OData.Measures.V1is aliased asMeasures.
- RedfishExtensions.v1_0_0is aliased asRedfish.
- Validation.v1_0_0is aliased asValidation.

```
<edmx:Reference Uri="http://docs.oasis-open.org/odata/odata/v4.0/cs01/vocabularies/
Org.OData.Core.V1.xml">
<edmx:IncludeNamespace="Org.OData.Core.V1"Alias="OData"/>
</edmx:Reference>
<edmx:Reference
Uri="http://docs.oasis-open.org/odata/odata/v4.0/os/vocabularies/
```
DSP0266 Redfish Specification

Version 1.8.1 Published 105


```
Org.OData.Measures.V1.xml">
<edmx:IncludeNamespace="Org.OData.Measures.V1"Alias="Measures"/>
</edmx:Reference>
<edmx:Reference Uri="http://redfish.dmtf.org/schemas/v1/RedfishExtensions_v1.xml">
<edmx:IncludeNamespace="RedfishExtensions.v1_0_0"Alias="Redfish"/>
<edmx:IncludeNamespace="Validation.v1_0_0"Alias="Validation"/>
</edmx:Reference>
<edmx:Reference Uri="http://redfish.dmtf.org/schemas/v1/Resource_v1.xml">
<edmx:IncludeNamespace="Resource"/>
<edmx:IncludeNamespace="Resource.v1_0_0"/>
</edmx:Reference>
```
**11.1.3.2. CSDL data services**

Define structures, enumerations, and other definitions in CSDL within a namespace. Use aSchematag to
define the schema and use theNamespaceattribute to declare the name of the namespace.

Redfish uses namespaces to differentiate different versions of the schema. CSDL enables structures to
inherit from other structures, which enables newer namespaces to define only the changes. TheElements
of CSDL namespacesclause describes this behavior.

TheSchemaelement is a child of theDataServiceselement, which is a child of theEdmxelement:

```
<edmx:DataServices>
<Schemaxmlns="http://docs.oasis-open.org/odata/ns/edm"Namespace="MyTypes.v1_0_0">
<!-- Type definitions for version 1.0.0 of MyTypes go here -->
</Schema>
<Schemaxmlns="http://docs.oasis-open.org/odata/ns/edm"Namespace="MyTypes.v1_1_0">
<!-- Type definitions for version 1.1.0 of MyTypes go here -->
</Schema>
</edmx:DataServices>
```
#### 11.1.4. Elements of CSDL namespaces......................................................................

The following clauses describe the definitions within each namespace:

- Qualified names
- Entity type and complex type elements

**11.1.4.1. Qualified names**

Many definitions in CSDL use references to qualified names. CSDL defines this as a string in the form:

_Namespace_. _TypeName_

Redfish Specification DSP0266

106 Published Version 1.8.1


where

```
Variable Description
```
```
Namespace Namespace name.
```
```
TypeName Name of the element in the namespace.
```
For example, if a reference is made toMyType.v1_0_0.MyDefinition, the definition can be found in
theMyType.v1_0_0namespace with an element namedMyDefinition.

**11.1.4.2. Entity type and complex type elements**

Use theEntityTypeandComplexTypetags to define the entity type and complex type elements,
respectively. These elements define a JSON structure and their set of properties. This is done by defining
property elementsandnavigation property elementswithin theEntityTypeorComplexTypetags.

All entity types and complex types contain aNameattribute, which specifies the name of the definition.

Entity types and complex types may have aBaseTypeattribute, which specifies aqualified name. When
theBaseTypeattribute is used, all definitions of the referencedBaseTypeare available to the entity type
or complex type being defined.

Allresourcesandresource collectionsare defined with the entity type element. Resources inherit from
Resource.v1_0_0.Resource, and resource collections inherit from
Resource.v1_0_0.ResourceCollection.

Moststructured propertiesare defined with the complex type element. Some use the entity type element
that inherits fromResource.v1_0_0.ReferenceableMember. The entity type element enables
references to be made by using theNavigation Property element, whereas the complex type element
does not allow for this usage.

Example entity type and complex type element:

```
<EntityTypeName="TypeA"BaseType="Resource.v1_0_0.Resource">
<AnnotationTerm="OData.Description"String="The TypeA entity type description."/>
<AnnotationTerm="OData.LongDescription" String="The TypeA entity type normative
description."/>
<!-- Property and navigation property definitions go here -->
</EntityType>
<ComplexType Name="PropertyTypeA">
<AnnotationTerm="OData.Description"String="The TypeA structured property
description."/>
<AnnotationTerm="OData.LongDescription" String="The TypeA structured property
```
DSP0266 Redfish Specification

Version 1.8.1 Published 107


```
normative description."/>
<!-- Property and navigation property definitions go here -->
</ComplexType>
```
**11.1.4.3. Action element**

Use theActiontag to define the action element. This element defines anactionthat can be performed
on aresource.

All action elements contain aNameattribute, which specifies the name of the action. The action shall be
represented in payloads as thequalified nameof the action, preceded by#.

In Redfish, all action elements contain theIsBoundattribute that is always set totrue, which indicates
that the action appears as a member of a structured type.

The action element contains one or moreParametertags that specify theNameandTypeof each
parameter.

Because all action elements in Redfish use the termIsBound="true", the first parameter is called the
"binding parameter" and specifies thestructured typeto which the action belongs. In Redfish, this is
always going to be one of the followingcomplex type elements:

- For standard actions, theActionscomplex type for the resource.
- For OEM actions, theOemActionscomplex type for the resource.

The remainingParameterelements describe additional parameters to be passed to the action.
Parameters containing the termNullable="false"are required to be provided in the action request.

```
<Schemaxmlns="http://docs.oasis-open.org/odata/ns/edm"Namespace="MyType">
<ActionName="MyAction"IsBound="true">
<ParameterName="Thing"Type="MyType.Actions"/>
<ParameterName="Parameter1" Type="Edm.Boolean"/>
<ParameterName="Parameter2" Type="Edm.String"Nullable="false"/>
</Action>
```
```
<ComplexTypeName="Actions">
...
</ComplexType>
```
```
...
```
```
</Schema>
```
Redfish Specification DSP0266

108 Published Version 1.8.1


**11.1.4.3.1. Action element for OEM actions**

OEM-specific actions shall be defined by using the action element with the binding parameter set to the
OemActionscomplex type for the resource. For example, the following definition defines the OEM
#Contoso.Pingaction for aComputerSystem.

```
<Schemaxmlns="http://docs.oasis-open.org/odata/ns/edm"Namespace="Contoso">
<ActionName="Ping"IsBound="true">
<ParameterName="ComputerSystem"Type="ComputerSystem.v1_0_0.OemActions"/>
</Action>
</Schema>
```
**11.1.4.3.2. Action with a response body**

A response body for an action is defined using theReturnTypetag within an Action element. For
example, the following definition defines theGenerateCSRaction with a response that contains the
definition specified byGenerateCSRResponse.

```
<ActionName="GenerateCSR"IsBound="true">
<ParameterName="CertificateService"Type="CertificateService.v1_0_0.Actions"/>
...
<ReturnTypeType="CertificateService.v1_0_0.GenerateCSRResponse"Nullable="false"/>
</Action>
```
```
<ComplexType Name="GenerateCSRResponse">
<AnnotationTerm="OData.AdditionalProperties"Bool="false"/>
<AnnotationTerm="OData.Description"String="The response body for the GenerateCSR
action."/>
<NavigationPropertyName="CertificateCollection"
Type="CertificateCollection.CertificateCollection"Nullable="false">
<AnnotationTerm="OData.Permissions"EnumMember="OData.Permission/Read"/>
<AnnotationTerm="OData.Description"String="The link to the certificate
resource collection where the certificate is installed."/>
<AnnotationTerm="Redfish.Required"/>
</NavigationProperty>
<PropertyName="CSRString"Type="Edm.String"Nullable="false">
<AnnotationTerm="OData.Permissions"EnumMember="OData.Permission/Read"/>
<AnnotationTerm="OData.Description"String="The string for the certificate
signing request."/>
<AnnotationTerm="Redfish.Required"/>
</Property>
</ComplexType>
```
Using the above example, the following payload is an example response for theGenerateCSRaction.

DSP0266 Redfish Specification

Version 1.8.1 Published 109


```
{
"CSRString":"-----BEGIN CERTIFICATE REQUEST-----...-----END CERTIFICATE
REQUEST-----",
"CertificateCollection": {
"@odata.id":"/redfish/v1/Managers/BMC/NetworkProtocol/HTTPS/Certificates"
}
}
```
**11.1.4.4. Property element**

Propertiesofresources,resource collections, andstructured propertiesare defined using the property
element. ThePropertytag defines a property element insideentity type and complex type elements.

All property elements contain aNameattribute, which specifies the name of the property.

All property elements contain aTypeattribute specifies the data type. TheTypeattribute shall be one of
the following names or types:

- Aqualified namethat references anenum type element.
- Aqualified namethat references acomplex type element.
- A primitive data type.
- An array of the previous names or types by using theCollectionterm.

Primitive data types shall be one of the following:

```
Type Meaning
```
```
Edm.Boolean True or False.
```
```
Edm.DateTimeOffset Date-timestring.
```
```
Edm.Decimal Numeric values with fixed precision and scale.
```
```
Edm.Double IEEE 754 binary64 floating-point number (15-17 decimal digits).
```
```
Edm.Duration Durationstring.
```
```
Edm.Guid GUID/UUIDstring.
```
```
Edm.Int64 Signed 64-bit integer.
```
```
Edm.String UTF-8 string.
```
Property elements may specify aNullableattribute. If the attribute isfalse, the property value cannot
benull. If the attribute istrueor absent, the property value can benull.

Redfish Specification DSP0266

110 Published Version 1.8.1


Example property element:

```
<PropertyName="Property1"Type="Edm.String" Nullable="false">
<AnnotationTerm="OData.Description"String="The Property1 property description."/>
<AnnotationTerm="OData.LongDescription" String="The Property1 property normative
description."/>
<AnnotationTerm="OData.Permissions"EnumMember="OData.Permission/Read"/>
<AnnotationTerm="Redfish.Required"/>
<AnnotationTerm="Measures.Unit"String="Watts"/>
</Property>
```
**11.1.4.5. Navigation property element**

Reference propertiesofresources,resource collections, andstructured propertiesare defined using the
navigation property element. TheNavigationPropertytag defines a navigation property element
insideentity type and complex type elements.

All navigation property elements contain aNameattribute, which specifies the name of the property.

All navigation property elements contain aTypeattribute specifies the data type. TheTypeattribute is a
qualified namethat references anentity type element. This can also be made into an array using the
Collectionterm.

Navigation property elements may specify aNullableattribute. If the attribute isfalse, the property
value cannot benull. If the attribute istrueor absent, the property value can benull.

Unless the reference property is to beexpanded, all navigation properties in Redfish use the
OData.AutoExpandReferencesannotation element to show that the reference is always available.

Example navigation property element:

```
<NavigationPropertyName="RelatedType"Type="MyTypes.TypeB">
<AnnotationTerm="OData.Description"String="The RelatedType navigation property
description."/>
<AnnotationTerm="OData.LongDescription" String="The RelatedType navigation
property normative description."/>
<AnnotationTerm="OData.AutoExpandReferences"/>
</NavigationProperty>
```
**11.1.4.6. Enum type element**

Use theEnumTypetag to define the enum type element. This element defines a set of enumeration
values, which may be applied to one or more properties.

DSP0266 Redfish Specification

Version 1.8.1 Published 111


All enum type elements contain aNameattribute, which specifies the name of the set of enumeration
values.

Enum type elements containMembertags that define the members of the enumeration. TheMembertags
contain aNameattribute that specifies the string value of the member name.

```
<EnumTypeName="EnumTypeA">
<AnnotationTerm="OData.Description"String="The EnumTypeA enum type
description."/>
<AnnotationTerm="OData.LongDescription" String="The EnumTypeA enum type normative
description."/>
<MemberName="MemberA">
<AnnotationTerm="OData.Description"String="The description of MemberA"/>
</Member>
<MemberName="MemberB">
<AnnotationTerm="OData.Description"String="The description of MemberB"/>
</Member>
</EnumType>
```
**11.1.4.7. Annotation element**

Annotations in CSDL are expressed using theAnnotationelement. TheAnnotationelement can be
applied to any schema element in CSDL.

The following examples show how eachRedfish schema annotationis expressed in CSDL.

- TheOData Core Schemadefines terms with theODataprefix.
- TheOData Measures Schemadefines terms with theMeasuresprefix.
- TheRedfishExtensions Schemadefines terms with theRedfishprefix.

Exampledescription annotation:

```
<AnnotationTerm="OData.Description"String="This property contains the user name
for the account."/>
```
Examplelong description annotation:

```
<AnnotationTerm="OData.LongDescription"String="This property shall contain the
user name for the account."/>
```
Exampleadditional properties annotation:

Redfish Specification DSP0266

112 Published Version 1.8.1


```
<AnnotationTerm="OData.AdditionalProperties"/>
```
Examplepermissions annotation(read-only):

```
<AnnotationTerm="OData.Permissions"EnumMember="OData.Permission/Read"/>
```
Examplepermissions annotation(read/write):

```
<AnnotationTerm="OData.Permissions"EnumMember="OData.Permission/ReadWrite"/>
```
Examplerequired annotation:

```
<AnnotationTerm="Redfish.Required"/>
```
Examplerequired on create annotation:

```
<AnnotationTerm="Redfish.RequiredOnCreate"/>
```
Exampleunits of measure annotation:

```
<AnnotationTerm="Measures.Unit"String="MiBy"/>
```
Exampleexpanded resource annotation:

```
<AnnotationTerm="OData.AutoExpand"/>
```
Exampleinsert capabilities annotation(showing POST is not allowed):

```
<AnnotationTerm="Capabilities.InsertRestrictions">
<Record>
<PropertyValueProperty="Insertable"Bool="false"/>
</Record>
</Annotation>
```
DSP0266 Redfish Specification

Version 1.8.1 Published 113


Exampleupdate capabilities annotation(showing PATCH and PUT are allowed):

```
<AnnotationTerm="Capabilities.UpdateRestrictions">
<Record>
<PropertyValueProperty="Updatable"Bool="true"/>
<AnnotationTerm="OData.Description"String="Manager accounts can be updated to
change the password and other writable properties."/>
</Record>
</Annotation>
```
Exampledelete capabilities annotation(showing DELETE is allowed):

```
<AnnotationTerm="Capabilities.DeleteRestrictions">
<Record>
<PropertyValueProperty="Deletable"Bool="true"/>
<AnnotationTerm="OData.Description"String="Manager accounts are removed with a
Delete operation."/>
</Record>
</Annotation>
```
Exampleresource URI patterns annotation:

```
<AnnotationTerm="Redfish.Uris">
<Collection>
<String>/redfish/v1/AccountService/Accounts/{ManagerAccountId}</String>
</Collection>
</Annotation>
```
Exampleowning entity annotation:

```
<AnnotationTerm="Redfish.OwningEntity"String="DMTF"/>
```
### 11.2. JSON Schema...................................................................................................................

TheJSON Schema Specificationdefines a JSON format for describing JSON payloads. The following
clause describes how Redfish uses JSON Schema to describe resources and resource collections.

#### 11.2.1. File naming conventions for JSON Schema....................................................

Versioned Redfish JSON Schema files shall use theresource nameto name the file, in this format:

Redfish Specification DSP0266

114 Published Version 1.8.1


_ResourceName_ .v _MajorVersion_ _ _MinorVersion_ _ _Errata_ .json

For example, version 1.3.0 of the Chassis schema isChassis.v1_3_0.json.

Unversioned Redfish JSON Schema files shall use theresource nameto name the file, in this format:

_ResourceName_ .json

For example, the unversioned definition of the Chassis schema isChassis.json.

#### 11.2.2. Core JSON Schema files.................................................................................

```
File Description
```
```
odata-v4.json Definitions for common OData properties.
```
```
redfish-
error.v1_0_0.json
Payload definition of theRedfish error response.
```
```
redfish-schema-v1.json
Extensions to the JSON Schema that define Redfish JSON
Schema files.
```
```
Resource.jsonand its
subsequent versions
```
```
All base definitions for resources, resource collections, and
common properties, such asStatus.
```
#### 11.2.3. JSON Schema format......................................................................................

Each JSON Schema file contains a JSON object to describeresources,resource collections, and other
definitions for the data model.

The JSON object contains the following terms:

```
Term Description
```
```
$id Reference to the URI where the schema file is published.
```
```
$ref
For a schema file that describes a resource or resource collection, the reference
to the structural definition of the resource or resource collection.
```
```
$schema
URI to the Redfish schema extensions for JSON Schema. The value should be
http://redfish.dmtf.org/schemas/v1/redfish-schema-v1.json.
```
```
copyright Copyright statement for the organization producing the JSON Schema.
```
```
definitions Structures, enumerations, and other definitions defined by the schema.
```
DSP0266 Redfish Specification

Version 1.8.1 Published 115


```
Term Description
```
```
title
For a schema file that describes a resource or resource collection, the matching
type identifierfor the resource or resource collection.
```
#### 11.2.4. JSON Schema definitions body.......................................................................

This clause describes the types of definitions found in thedefinitionsterm of a Redfish JSON
Schema file.

**11.2.4.1. Resource definitions in JSON Schema**

To satisfyversioningrequirements, the JSON Schema representation of eachresourcehas one
unversioned schema file, and a set of versioned schema files.

The unversioned definition of a resource contains ananyOfstatement. This statement consists of an
array of$refterms, which point to the following definitions:

- The JSON Schema definition for areference property.
- The versioned definitions of the resource.

The unversioned definition of a resource also uses theuristerm to express theallowable URIs for the
resource, and thedeletable,insertable, andupdatableterms to express thecapabilities of the
resource.

The following example shows an unversioned resource definition in JSON Schema:

```
{
"ComputerSystem": {
"anyOf": [
{
"$ref": "http://redfish.dmtf.org/schemas/v1/
odata.v4_0_3.json#/definitions/idRef"
},
{
"$ref": "http://redfish.dmtf.org/schemas/v1/
ComputerSystem.v1_0_0.json#/definitions/ComputerSystem"
},
{
"$ref": "http://redfish.dmtf.org/schemas/v1/
ComputerSystem.v1_0_1.json#/definitions/ComputerSystem"
},
{
"$ref": "http://redfish.dmtf.org/schemas/v1/
```
Redfish Specification DSP0266

116 Published Version 1.8.1


```
ComputerSystem.v1_6_0.json#/definitions/ComputerSystem"
}
],
"deletable": true,
"description": "The ComputerSystem schema represents a general purpose machine
or system.",
"insertable": false,
"longDescription": "This resource shall represent resources that represent a
computing system.",
"updatable": true,
"uris": [
"/redfish/v1/Systems/{ComputerSystemId}"
]
},
...
}
```
The versioned definition of a resource contains the property definitions for the given version of the
resource.

**11.2.4.2. Enumerations in JSON Schema**

Definitions for enumerations can consist of these terms:

```
Term Description
```
```
enum String array that contains the possible enumeration values.
```
```
enumDescriptions Object that contains thedescriptionsfor each of the enumerations as
name-value pairs.
```
```
enumLongDescriptions Object that contains thelong descriptionsfor each of the
enumerations as name-value pairs.
```
```
type
```
```
Because all enumerations in Redfish are strings, thetypeterm
always has thestringvalue.
```
The following example shows an enumeration definition in JSON Schema:

```
{
"IndicatorLED": {
"enum": [
"Lit",
"Blinking",
```
DSP0266 Redfish Specification

Version 1.8.1 Published 117


```
"Off"
],
"enumDescriptions": {
"Blinking": "The Indicator LED is blinking.",
"Lit": "The Indicator LED is lit.",
"Off": "The Indicator LED is off."
},
"enumLongDescriptions": {
"Blinking": "This value shall represent the Indicator LED is in a blinking
state where the LED is being turned on and off in repetition.",
"Lit": "This value shall represent the Indicator LED is in a solid on
state.",
"Off": "This value shall represent the Indicator LED is in a solid off
state."
},
"type": "string"
},
...
}
```
**11.2.4.3. Actions in JSON Schema**

Versioned definitions ofresourcescontain a definition calledActions. This definition is a container with
a set of terms that point to the differentactionssupported by the resource. The names of standard actions
shall be in the form:

# _ResourceType_. _ActionName_

ExampleActionsdefinition:

```
{
"Actions": {
"additionalProperties": false,
"description": "The available actions for this resource.",
"longDescription": "This type shall contain the available actions for this
resource.",
"properties": {
"#ComputerSystem.Reset": {
"$ref": "#/definitions/Reset"
}
},
"type": "object"
},
...
}
```
Redfish Specification DSP0266

118 Published Version 1.8.1


Another definition within the same schema file describes the action itself. This definition contains a term
calledparametersto describe the client request body. It also contains property definitions for the
targetandtitleproperties shown in response payloads for the resource.

The following example shows a definition of an action:

```
{
"Reset": {
"additionalProperties": false,
"description": "This action resets the system.",
"longDescription": "This action shall perform a reset of the ComputerSystem.",
"parameters": {
"ResetType": {
"$ref": "http://redfish.dmtf.org/schemas/v1/Resource.json#/definitions/
ResetType",
"description": "The type of reset to be performed.",
"longDescription": "This parameter shall define the type of reset to
be performed."
}
},
"properties": {
"target": {
"description": "Link to invoke action",
"format": "uri",
"type": "string"
},
"title": {
"description": "Friendly action name",
"type": "string"
}
},
"type": "object"
},
...
}
```
**11.2.4.3.1. OEM actions in JSON Schema**

OEM-specific actions shall be defined by using an action definition in an appropriately named JSON
Schema file. For example, the following definition defines the OEM#Contoso.Pingaction, assuming it's
found in the versioned Contoso JSON Schema file, such asContoso.v1_0_0.json.

```
{
"Ping": {
```
DSP0266 Redfish Specification

Version 1.8.1 Published 119


```
"additionalProperties": false,
"parameters": {},
"properties": {
"target": {
"description": "Link to invoke action",
"format": "uri",
"type": "string"
},
"title": {
"description": "Friendly action name",
"type": "string"
}
},
"type": "object"
},
...
}
```
**11.2.4.3.2. Action with a response body**

A response body for an action is defined using theactionResponseterm within the action definition.
For example, the following definition defines theGenerateCSRaction with a response that contains the
definition specified by#/definitions/GenerateCSRResponse.

```
{
"GenerateCSR": {
"actionResponse": {
"$ref":"#/definitions/GenerateCSRResponse"
},
"parameters": {}
},
"GenerateCSRResponse": {
"additionalProperties":false,
"description":"The response body for the GenerateCSR action.",
"properties": {
"CSRString": {
"description":"The string for the certificate signing request.",
"readonly":true,
"type":"string"
},
"CertificateCollection": {
"$ref":"http://redfish.dmtf.org/schemas/v1/
CertificateCollection.json#/definitions/CertificateCollection",
"description":"The link to the certificate resource collection where
the certificate is installed.",
```
Redfish Specification DSP0266

120 Published Version 1.8.1


```
"readonly":true
}
},
"required": [
"CertificateCollection",
"CSRString"
],
"type": "object"
}
}
```
In the previous example, the following payload is an example response for theGenerateCSRaction.

```
{
"CSRString":"-----BEGIN CERTIFICATE REQUEST-----...-----END CERTIFICATE
REQUEST-----",
"CertificateCollection": {
"@odata.id":"/redfish/v1/Managers/BMC/NetworkProtocol/HTTPS/Certificates"
}
}
```
#### 11.2.5. JSON Schema terms.......................................................................................

Redfish uses the following JSON Schema terms to provideschema annotationsfor Redfish JSON
Schema:

```
JSON Schema term Related Redfish schema annotation
```
```
description
enumDescriptions
Description
```
```
longDescription
enumLongDescriptions
Long description
```
```
additionalProperties Additional properties
```
```
readonly Permissions
```
```
required Required
```
```
requiredOnCreate Required on create
```
```
units Units of measure
```
DSP0266 Redfish Specification

Version 1.8.1 Published 121


```
JSON Schema term Related Redfish schema annotation
```
```
autoExpand Expanded resource
```
```
deletable
insertable
updatable
```
```
Resource capabilities
```
```
uris Resource URI patterns
```
```
owningEntity Owning entity
```
### 11.3. OpenAPI............................................................................................................................

TheOpenAPI Specificationdefines a format for describing JSON payloads and the set of URIs a client
can access on a service. The following clause describes how Redfish uses OpenAPI to describe
resources and resource collections.

#### 11.3.1. File naming conventions for OpenAPI schema................................................

Versioned Redfish OpenAPI files shall be named using theresource name, following the format:

_ResourceName_ .v _MajorVersion_ _ _MinorVersion_ _ _Errata_ .yaml

For example, version 1.3.0 of the Chassis schema isChassis.v1_3_0.yaml.

Unversioned Redfish OpenAPI files shall use theresource nameto name the file, in this format:

_ResourceName_ .yaml

For example, the unversioned definition of the Chassis schema isChassis.yaml.

#### 11.3.2. Core OpenAPI schema files.............................................................................

```
File Description
```
```
odata-v4.yaml Definitions for common OData properties.
```
```
openapi.yaml URI paths and their respective payload structures.
```
```
Resource.yamland its
subsequent versions
```
```
All base definitions for resources, resource collections, and
common properties, such asStatus.
```
Redfish Specification DSP0266

122 Published Version 1.8.1


#### 11.3.3. openapi.yaml....................................................................................................

Theopenapi.yamlfile is the starting point for clients to understand the construct of the service. It
contains the following terms:

```
Term Description
```
```
components Global definitions. For Redfish, contains the format of theRedfish error response.
```
```
info
Structure consisting of information about what theopenapi.yamlis describing,
such as the author of the file and any contact information.
```
```
openapi Version of OpenAPI the document follows.
```
```
paths URIs supported by the document, with possible methods, response bodies, and
request bodies.
```
The service shall return theopenapi.yaml, if present in the Redfish Service, as a YAML document by
using either theapplication/yamlorapplication/vnd.oai.openapiMIME types. The service
may append;charset=utf-8to the MIME type. Note that while theapplication/yamltype is in
common use today, theapplication/vnd.oai.openapitype was recently defined and approved
specifically to support OpenAPI. Implementations should use caution when selecting the MIME type as
this specification may change in the future to reflect adoption of the OpenAPI-specific MIME type.

Thepathsterm contains an array of thepossible URIs. For each URI, it also lists thepossible methods.
For each method, it lists the possible response bodies and request bodies.

Examplepathsentry for a resource:

```
/redfish/v1/Systems/{ComputerSystemId}:
get:
parameters:
```
- description: The value of the Id property of the ComputerSystem resource
    in: path
    name: ComputerSystemId
    required: true
    schema:
       type: string
responses:
    '200':
       content:
          application/json:
             schema:
                $ref: [http://redfish.dmtf.org/schemas/v1/](http://redfish.dmtf.org/schemas/v1/)

DSP0266 Redfish Specification

Version 1.8.1 Published 123


```
ComputerSystem.v1_6_0.yaml#/components/schemas/ComputerSystem
description: The response contains a representation of the ComputerSystem
resource
default:
content:
application/json:
schema:
$ref: '#/components/schemas/RedfishError'
description: Error condition
```
Examplepathsentry for an action:

```
/redfish/v1/Systems/{ComputerSystemId}/Actions/ComputerSystem.Reset:
post:
parameters:
```
- description: The value of the Id property of the ComputerSystem resource
    in: path
    name: ComputerSystemId
    required: true
       type: string
requestBody:
    content:
       application/json:
          schema:
             $ref: [http://redfish.dmtf.org/schemas/v1/](http://redfish.dmtf.org/schemas/v1/)
ComputerSystem.v1_6_0.yaml#/components/schemas/ResetRequestBody
required: true
responses:
    '200':
       content:
          application/json:
             schema:
                $ref: '#/components/schemas/RedfishError'
       description: The response contains the results of the Reset action
    '202':
       content:
          application/json:
             schema:
                $ref: [http://redfish.dmtf.org/schemas/v1/Task.v1_4_0.yaml#/components/](http://redfish.dmtf.org/schemas/v1/Task.v1_4_0.yaml#/components/)
schemas/Task
description: Accepted; a task has been generated
    '204':
       description: Success, but no response data
    default:
       content:

Redfish Specification DSP0266

124 Published Version 1.8.1


```
application/json:
schema:
$ref: '#/components/schemas/RedfishError'
description: Error condition
```
#### 11.3.4. OpenAPI file format..........................................................................................

With the exception ofopenapi.yaml, each OpenAPI file contains a YAML object to describeresources,
resource collections, or other definitions for the data model. The YAML object contains the following
terms:

```
Term Description
```
```
components Structures, enumerations, and other definitions defined by the schema.
```
```
x-
copyright
Copyright statement for the organization producing the OpenAPI file.
```
```
title For a schema file that describes a resource or resource collection, the matching
type identifierfor the resource or resource collection.
```
#### 11.3.5. OpenAPI components body.............................................................................

This clause describes the types of definitions that can be found in thecomponentsterm of a Redfish
OpenAPI file.

**11.3.5.1. Resource definitions in OpenAPI**

To satisfyversioningrequirements, the OpenAPI representation of eachresourcehas one unversioned
schema file, and a set of versioned schema files.

The unversioned definition of a resource contains ananyOfstatement. This statement consists of an
array of$refterms, which point to the following definitions:

- The OpenAPI definition for areference property.
- The versioned definitions of the resource.

Example unversioned resource definition in OpenAPI:

```
ComputerSystem:
anyOf:
```
- $ref: [http://redfish.dmtf.org/schemas/v1/odata.v4_0_3.yaml#/components/schemas/](http://redfish.dmtf.org/schemas/v1/odata.v4_0_3.yaml#/components/schemas/)

DSP0266 Redfish Specification

Version 1.8.1 Published 125


```
idRef
```
- $ref: [http://redfish.dmtf.org/schemas/v1/ComputerSystem.v1_0_0.yaml#/components/](http://redfish.dmtf.org/schemas/v1/ComputerSystem.v1_0_0.yaml#/components/)
schemas/ComputerSystem
- $ref: [http://redfish.dmtf.org/schemas/v1/ComputerSystem.v1_0_1.yaml#/components/](http://redfish.dmtf.org/schemas/v1/ComputerSystem.v1_0_1.yaml#/components/)
schemas/ComputerSystem
- $ref: [http://redfish.dmtf.org/schemas/v1/ComputerSystem.v1_6_0.yaml#/components/](http://redfish.dmtf.org/schemas/v1/ComputerSystem.v1_6_0.yaml#/components/)
schemas/ComputerSystem
description: The ComputerSystem schema represents a general purpose machine
or system.
x-longDescription: This resource shall be used to represent resources that represent
a computing system.

The versioned definition of a resource contains the property definitions for the given version of the
resource.

**11.3.5.2. Enumerations in OpenAPI**

Definitions for enumerations can consist of the following terms:

```
Term Description
```
```
enum String array that contains the possible enumeration values.
```
```
type
```
```
Because all enumerations in Redfish are strings, thetypeterm
always has the valuestring.
```
```
x-enumDescriptions Object that contains thedescriptionsfor each of the enumerations as
name-value pairs.
```
```
x-
enumLongDescriptions
```
```
Object that contains thelong descriptionsfor each enumeration as a
name-value pair.
```
Example enumeration definition in OpenAPI:

```
IndicatorLED:
enum:
```
- Lit
- Blinking
- 'Off'
type: string
x-enumDescriptions:
    Blinking: The Indicator LED is blinking.
    Lit: The Indicator LED is lit.
    'Off': The Indicator LED is off.

Redfish Specification DSP0266

126 Published Version 1.8.1


```
x-enumLongDescriptions:
Blinking: This value shall represent the Indicator LED is in a blinking state
where the LED is being turned on and off in repetition.
Lit: This value shall represent the Indicator LED is in a solid on state.
'Off': This value shall represent the Indicator LED is in a solid off state.
```
**11.3.5.3. Actions in OpenAPI**

Versioned definitions ofresourcescontain a definition calledActions. This definition is a container with
a set of terms that point to the differentactionssupported by the resource. The names of standard actions
shall be in the form:

# _ResourceType_. _ActionName_

ExampleActionsdefinition:

```
Actions:
additionalProperties: false
description: The available actions for this resource.
properties:
'#ComputerSystem.Reset':
$ref: '#/components/schemas/Reset'
type: object
x-longDescription: This type shall contain the available actions for this resource.
```
Another definition within the same schema file describes the action itself. This definition contains property
definitions for thetargetandtitleproperties shown in response payloads for the resource.

The following example shows a definition of an action:

```
Reset:
additionalProperties: false
description: This action resets the system.
properties:
target:
description: Link to invoke action
format: uri
type: string
title:
description: Friendly action name
type: string
type: object
x-longDescription: This action shall reset the ComputerSystem.
```
DSP0266 Redfish Specification

Version 1.8.1 Published 127


The parameters for the action are shown in another definition withRequestBodyappended to the name
of the action. This gets mapped from theopenapi.yamlfile for expressing the POST method for the
URI of the action.

The following example shows a definition of parameters of an action:

```
ResetRequestBody:
additionalProperties: false
description: This action resets the system.
properties:
ResetType:
$ref: http://redfish.dmtf.org/schemas/v1/Resource.yaml#/components/schemas/
ResetType
description: The reset type.
x-longDescription: This parameter shall define the type of reset to perform.
type: object
x-longDescription: This action shall reset the ComputerSystem.
```
**11.3.5.3.1. OEM actions in OpenAPI**

OEM-specific actions shall be defined by using an action definition in an appropriately named OpenAPI
file. For example, the following definition defines the OEM#Contoso.Pingaction, assuming it's found in
the versioned Contoso OpenAPI file with a name, such asContoso.v1_0_0.yaml.

```
Ping:
additionalProperties: false
properties:
target:
description: Link to invoke action
format: uri
type: string
title:
description: Friendly action name
type: string
type: object
PingRequestBody:
additionalProperties: false
properties: {}
type: object
```
#### 11.3.6. OpenAPI terms used by Redfish......................................................................

The following OpenAPI terms provideschema annotationsfor Redfish OpenAPI files:

Redfish Specification DSP0266

128 Published Version 1.8.1


```
OpenAPI term Related Redfish schema annotation
```
```
description
x-enumDescriptions
Description
```
```
x-longDescription
x-enumLongDescriptions
Long description
```
```
additionalProperties Additional properties
```
```
readOnly Permissions
```
```
required Required
```
```
x-requiredOnCreate Required on create
```
```
x-units Units of measure
```
```
x-autoExpand Expanded resource
```
```
x-owningEntity Owning entity
```
### 11.4. Schema modification rules................................................................................................

Schema referenced from the implementation may vary from the canonical definitions of those schema
defined by the Redfish schema or other entities, provided they adhere to the following rules. Clients
should take this into consideration when attempting operations on the resources defined by schema.

- Modified schema may constrain aread/write property to be read only.
- Modified schema may constrain thecapabilities of a resource or resource collectionto remove
    support for HTTP operations.
- Modified schema may removeproperties.
- Modified schema may change any external references to point to Redfish schema that adheres
    to the modification rules.
- Modified schema may change theowning entity annotationto specify who made the
    modifications.
- Other modifications to the schema shall not be allowed.

## 12. Service details....................................................................................................................................

### 12.1. Eventing............................................................................................................................

This clause describes how to use the REST-based mechanism to subscribe to and receive event

DSP0266 Redfish Specification

Version 1.8.1 Published 129


messages.

```
Note: For security implications of eventing, see theSecurity detailsclause.
```
The Redfish Service requires a client or administrator to create _subscriptions_ to receive events.

To create a subscription, use one of these methods:

- Directly HTTPPOST to the subscription collection.
- Indirectlyopen a Server-Sent Events (SSE) connectionfor the Event Service.

#### 12.1.1. POST to subscription collection.......................................................................

To locate the Event Service, the client traverses the Redfish Service interface. The Event Service is
located in the Service Root, as described in theServiceRootschema.

Once the client discovers the service, they send an HTTP POST to the resource collection URI for
Subscriptionsin the Event Service to subscribe to events. For the _subscription_ body syntax, see the
RedfishEventDestinationschema. This request includes:

- The URI where an event-receiver client expects events to be sent. When an event is triggered
    within the Redfish Service, the service sends an event to that URI.
- The type of events to send.

If the subscription request succeeds, the service shall return:

- An HTTP201 Createdstatus code.
- TheLocationheader that contains a URI of the newly created subscription resource.

If the subscription request succeeds, the service should return:

- A response body containing a representation of the subscription resource that conforms to the
    EventDestinationschema.

After a subscription is registered with the service, clients begin receiving events. Clients do not receive
events retroactively. The service does not retain historical events.

Services shall:

- Support _push_ style eventing for all resources that can send events.
- Respond to a request to create a subscription with an error if the body of the request is
    conflicting. For instance, if parameters in the request are not supported, the service shall return
    the HTTP400 Bad Requeststatus code.
- Respond to a request to create a subscription with an error if the body of the request contains
    bothRegistryPrefixesandMessageIds, and shall return the HTTP400 Bad Request

Redfish Specification DSP0266

130 Published Version 1.8.1


```
status code. These properties are considered mutually exclusive.
```
- Retain subscriptions as persistent across service restarts.

Services shall not:

- _Push_ events by using HTTP POST unless an event subscription has been created. To terminate
    the event stream at any time, either the client or the service can delete the subscription.
- Send a _push_ event payload larger than 1 Mebibyte (1 MiB). If there is more than 1 MiB worth of
    data to send the service shall divide the payload on the nearestEvententry such that the total
    payload transmitted to the client is less than 1 MiB. This restriction shall not apply to metric
    reports.

Services may:

- Terminate a subscription by sending aSubscriptionTerminatedmessage from the Base
    Message Registry as the last event.
- Terminate a subscription if the number of delivery errors exceeds preconfigured thresholds.

To unsubscribe from the events associated with this subscription, the client or administrator shall send an
HTTP DELETE request to the subscription's resource URI.

Subsequent requests to subscription resources that have been terminated respond with the HTTP 404
Not Foundstatus code.

Some configurable properties define the behavior for all event subscriptions. For details, see the Redfish
EventServiceschema.

#### 12.1.2. Open an SSE connection................................................................................

A service may support theServerSentEventUriproperty in theEventServiceresource. If a client
performs a GET on the URI that theServerSentEventUricontains, an SSE connection opens for the
client. For details about this method, see the Server-Sent EventsEvent Serviceclause.

#### 12.1.3. EventType-based eventing..............................................................................

```
Deprecation notice: EventType-based eventing is deprecated in the Redfish schema.
```
A Redfish Service generates these types of events:

```
Event Occurs when Description
```
```
Lifecycle Resources are Not every modification of a resource results in an event.
```
DSP0266 Redfish Specification

Version 1.8.1 Published 131


```
Event Occurs when Description
```
```
created, modified,
or destroyed.
```
```
Usually indicates
that the resource
and, optionally, its
properties have
changed.
```
```
This behavior is similar to when ETags are changed and
implementations may not send an event for every
resource change.
```
```
For example, if an event is sent for every Ethernet packet
that is received or each time that a sensor changes one
degree, more events than fit in a scalable interface are
generated.
```
```
Alert
```
```
An event of some
significance
happens.
```
```
Depending on the
resource, may be
generated directly
or indirectly.
```
```
Usually adopts a Message Registry approach similar to
extended error handling in that aMessageIdis included.
```
```
An example of an alert event is, a chassis is opened, a
button is pushed, a cable is unplugged, or a threshold
exceeded.
```
```
These events usually do not correspond well to life cycle-
type events. Therefore, alerts have their own category.
```
```
Metricreport
```
```
The Telemetry
Service generates
or updates a metric
report.
```
```
Generated as specified by the
MetricReportDefinitionresources found
subordinate to the Telemetry Service. Can occur
periodically, on demand, or when changes are detected in
the metric properties.
```
```
For details, see the RedfishMetricReportDefinition
schema.
```
#### 12.1.4. Subscribing to events......................................................................................

To subscribe to events and filter received messages, a subscriber provides these properties:

```
Property Description
```
```
RegistryPrefixes An array of standard or OEM Message Registries.
```
Redfish Specification DSP0266

132 Published Version 1.8.1


```
Property Description
```
```
An event is sent to the subscriber if one of the Message Registries that
RegistryPrefixeslists defines the event message.
```
```
To receive messages from all registries, pass an empty array.
```
```
The contents of the array does not include the registry version.
```
```
For example, if the registry isBase.1.5.0, the property value isBase.
```
```
ResourceTypes
```
```
An array of standard or OEM resource types.
```
```
An event is sent to the subscriber if theOriginOfConditionresource
type matches one of theResourceTypesvalues.
```
```
The contents of the array does not include the schema version. For
example, if the resource type isTask.v1_2_0.Task, the property value
isTask.
```
```
To receive messages from any resource, pass an empty array.
```
```
OriginResources
```
```
An array of URIs to resources.
```
```
An event is sent to the subscriber if theOriginOfConditionproperty
matches one of the URIs listed inOriginResources.
```
```
To receive messages from any resource, pass an empty array.
```
```
To include subordinate resources regardless of depth, set the
SubordinateResourcesproperty totrue.
```
```
EventFormatType
```
```
The format that can be sent by using theEventFormatTypesproperty in
the Event Service.
```
```
Represents the format of the payload sent to the event destination.
```
```
If the subscriber omits this value, the payload corresponds to theEvent
schema.
```
DSP0266 Redfish Specification

Version 1.8.1 Published 133


#### 12.1.5. Event formats..................................................................................................

The event formats are:

```
Event format Description
```
```
Metricreportmessageobjects
```
```
Used when the Telemetry Service generates a new or updates an
existing metric report. Metric report message objects sent to the
specified client endpoint shall contain the properties, as described
in the RedfishMetricReportschema.
```
```
Event message objects
```
```
Used for all other types of events. Event message objects
POSTed to the specified client endpoint shall contain the
properties as described in the RedfishEventschema. Supports a
Message Registry. In a Message Registry approach, a Message
Registry lists theMessageIdsin a well-known format. These
MessageIdsare terse in nature and thus they are much smaller
than actual messages, making them suitable for embedded
environments.
```
```
The registry also contains a message. The message itself can
have arguments and default values for severity and recommended
actions. TheMessageIdproperty is in the format:
```
```
RegistryName. MajorVersion. MinorVersion. MessageKey
```
```
where
```
```
Variable Description
```
```
RegistryName Pascal-cased name of the registry.
```
```
MajorVersion
Positive integer, which is the major
version of the registry.
```
```
MinorVersion
Positive integer, which is the minor
version of the registry.
```
```
MessageKey
```
```
Human-readable Pascal-cased key into
the registry. Shall not include spaces,
periods, or special characters.
```
Redfish Specification DSP0266

134 Published Version 1.8.1


```
Event format Description
```
```
Event messages may also have anEventGroupIdproperty,
which lets clients know that different messages may be from the
same event. For instance, if a LAN cable is disconnected, they
may get a specific message from one registry about the LAN
cable being disconnected, another message from a general
registry about the resource changing, perhaps a message about
resource state change, and maybe more. For the client to
determine whether these have the same root cause, these
messages have the same value for theEventGroupIdproperty.
```
#### 12.1.6. OEM extensions..............................................................................................

OEMs can extend both messages and Message Registries. Any individual message, per the
MessageRegistryschema definition, define OEM sections. Thus, if OEMs wish to provide additional
information or properties, use the OEM section.

OEMs shall not supply additional message arguments beyond those in a standard Message Registry.
OEMs may substitute their own Message Registry for the standard registry to provide the OEM section
within the registry but shall not change the standard values, such as messages, in such registries.

### 12.2. Asynchronous operations.................................................................................................

Services that support asynchronous operations implement theTaskServiceandTaskresources.

The Task Service describes the service that handles _task_. It contains a resource collection of zero or more
Taskresources. TheTaskresource describes a long-running operation that is spawned when a request
takes longer than a few seconds, such as when a service is instantiated.

TheTaskschema defines task structure, including the start time, end time, task state, task status, and
zero or more task-associated messages.

Each task has a number of possible states. TheTaskschema defines the exact states and their
semantics.

When a client issues a request for a long-running operation, the service returns the HTTP 202
Acceptedstatus code and aLocationheader that contains the URI of the _task monitor_ and, optionally,
theRetry-Afterheader that defines the amount of time that the client should wait before querying the
status of the operation.

DSP0266 Redfish Specification

Version 1.8.1 Published 135


The task monitor is an opaque service-generated URI that the client who initiates the request can use. To
query the status of an operation, and determine when the operation has been completed and whether it
succeeded, the client performs a GET request on the task monitor. The client should not include the
application/httpMIME type in theAcceptheader.

The202 Acceptedresponse body should contain an instance of theTaskresource that describes the
state of the task.

As long as the operation is in process, the service shall continue to return the HTTP202 Accepted
status code when the client queries the task monitor URI.

If a service supports cancellation of a task, it shall have DELETE in theAllowheader for the task
monitor. To cancel the operation, the client may perform a DELETE on the task monitor URI. The service
determines when to delete the associatedTaskresource.

To cancel the operation, the client may also perform a DELETE on theTaskresource. Deleting theTask
resource may invalidate the associated task monitor. A subsequent GET request on the task monitor URI
returns either the HTTP410 Gonestatus code or the HTTP404 Not Foundstatus code.

In the unlikely event that a DELETE of the task monitor orTaskresource returns the HTTP 202
Acceptedstatus code, an additional task shall not be started and instead the client may monitor the
existingTaskresource for the status of the cancellation request. When the task finally completes
cancellation, operations to the task monitor andTaskresources shall return the HTTP404 Not Found
status code.

After the operation has been completed, the service shall update theTaskStatewith the appropriate
value. TheTaskschema defines the task completed values.

After the operation has been completed, the task monitor shall return:

- The appropriate HTTP status code, such as but not limited to200 OKfor most operations or
    201 Createdfor POST to create a resource.
- The headers and response body of the initial operation, as if it had completed synchronously.

If the initial operation fails, the response body shall contain anerror response.

If the operation has been completed and the service has already deleted the task, the service may return
the HTTP410 Goneor404 Not Foundstatus code. This situation can occur if the client waits too long
to read the task monitor.

To continue to get status information, the client can use theresource identifierfrom the202 Accepted
response to directly query theTaskresource.

- Services that support asynchronous operations shall implement theTaskresource.

Redfish Specification DSP0266

136 Published Version 1.8.1


- The response to an asynchronous operation shall return the HTTP202 Acceptedstatus code
    and set the HTTPLocationresponse header to the URI of a task monitor associated with the
    task. The response may also include theRetry-Afterheader that defines the amount of time
    that the client should wait before polling for status. The response body should contain a
    representation of theTaskresource.
- GET requests to either the task monitor orTaskresource shall return the current status of the
    operation without blocking.
- HTTP GET, PUT, and PATCH operations should always be synchronous.
- Clients shall be prepared to handle both synchronous and asynchronous responses for HTTP
    GET, PUT, PATCH, POST, and DELETE requests.
- Services shall persist pending tasks produced by client requests containing
    @Redfish.OperationApplyTimeacross service restarts, until the task begins execution.
- Tasks that are pending execution should include the@Redfish.OperationApplyTime
    property to indicate when the task will start. If the@Redfish.OperationApplyTimevalue is
    AtMaintenanceWindowStartorInMaintenanceWindowOnReset, the task should also
    include the@Redfish.MaintenanceWindowproperty.

### 12.3. Resource tree stability......................................................................................................

The _resource tree_ , which is defined as the set of URIs and array elements within the implementation,
should be consistent on a single service across device resets or power cycles, and should withstand a
reasonable amount of configuration change, such as adding an adapter to a server.

The resource tree on one service may not be consistent across instances of devices. The client should
traverse the data model and discover resources to interact with them.

Some resources might remain very stable from system to system, such as manager network settings.
However, the architecture does not guarantee this stability.

- A resource tree should remain stable across service restarts and minor device configuration
    changes. Thus, the set of URIs and array element indexes should remain constant.
- A client shall not expect the resource tree to be consistent between instances of services.

### 12.4. Discovery..........................................................................................................................

Automatic discovery of managed devices supporting Redfish may be accomplished by using the Simple
Service Discovery Protocol (SSDP). This protocol enables network-efficient discovery without resorting to
ping-sweeps, router table searches, or restrictive DNS naming schemes. Use of SSDP is optional, and if
implemented, shall enable the user to disable the protocol through theManagerNetworkProtocol
resource.

The objective of discovery is for client software to locate managed devices that conform to the Redfish

DSP0266 Redfish Specification

Version 1.8.1 Published 137


Specification. Therefore, the primary SSDP functionality is incorporated in the M-SEARCH query. Redfish
also follows the SSDP extensions and naming that UPnP uses, where applicable, so that systems that
conform to the Redfish Specification can also implement UPnP without conflict.

#### 12.4.1. UPnP compatibility..........................................................................................

For compatibility with general-purpose SSDP client software, primarily UPnP, the service should use UDP
port 1900 for all SSDP traffic. In addition, the Time-to-Live (TTL) hop count setting for SSDP multicast
messages should default to 2.

#### 12.4.2. USN format......................................................................................................

The UUID in the USN field of the service shall equal the UUID property in the Service Root. If multiple or
redundant managers exist, the UUID of the service shall remain static regardless of redundancy failover.
The unique ID shall be in the canonical UUID format, followed by::dmtf-org.

#### 12.4.3. M-SEARCH response......................................................................................

The Redfish Service Search Target (ST) is defined as:

```
urn:dmtf-org:service:redfish-rest:1
```
The managed device shall respond to M-SEARCH queries for Search Target (ST) of the Redfish Service,
as well asssdp:all. For UPnP compatibility, the managed device should respond to M-SEARCH
queries for Search Target (ST) ofupnp:rootdevice.

The URN provided in theSTheader in the reply shall use theredfish-rest:service name followed by
the major version of the Redfish Specification. If the minor version of the Redfish Specification to which
the service conforms is a non-zero value, that minor version shall be appended with and preceded by a
colon (:).

For example, a service that conforms to a Redfish Specification v1.4 would reply with aredfish-
rest:1:4service.

The managed device shall provide clients with theALheader that points to the Redfish Service Root
URL.

For UPnP compatibility, the managed device should provide clients with theLocationheader that points
to the UPnP XML descriptor.

The response to an M-SEARCH multicast or unicast query shall use the following format:

Redfish Specification DSP0266

138 Published Version 1.8.1


```
HTTP/1.1 200 OK
CACHE-CONTROL:max-age=<seconds, at least 1800>
ST:urn:dmtf-org:service:redfish-rest:1
USN:uuid:<UUID of the service>::urn:dmtf-org:service:redfish-rest:1
AL:<URL of Redfish Service Root>
EXT:
```
A service may provide additional headers for UPnP compatibility. Fields in brackets are placeholders for
device-specific values.

#### 12.4.4. Notify, alive, and shutdown messages.............................................................

Redfish devices may implement the additional UPnP-defined SSDP messages to announce their
availability to software. If implemented, services shall allow the end user to disable the traffic separately
from the M-SEARCH response functionality. This capability enables users to use the discovery
functionality with minimal amounts of generated network traffic.

### 12.5. Server-Sent Events...........................................................................................................

#### 12.5.1. General............................................................................................................

Server-Sent Events (SSE), as defined by the Web Hypertext Application Technology Working Group,
enables a client to open a connection with a web service. The web service can continuously push data to
the client, as needed.

Successful resource responses for SSE shall:

- Return the HTTP200 OKstatus code.
- Have aContent-Typeheader set astext/event-streamortext/event-
    stream;charset=utf-8.

Unsuccessful resource responses for SSE shall:

- Return an HTTP status code of 400 or greater.
- Have aContent-Typeheader set asapplication/jsonorapplication/
    json;charset=utf-8.
- Contain a JSON object in the response body, as described inError responses, which details the
    error or errors.

A service may occasionally send a comment within a stream to keep the connection alive. Services shall
separate events with blank lines. Blank lines should be sent as part of the end of an event, otherwise
dispatch may be delayed in conforming consumers.

DSP0266 Redfish Specification

Version 1.8.1 Published 139


The following clauses describe how Redfish uses SSE in different Redfish data model contexts. For
details about SSE, see theHTML5 Specification.

#### 12.5.2. Event Service..................................................................................................

A service's implementation of theEventServiceresource may contain theServerSentEventUri
property. If a client performs a GET on the URI specified by theServerSentEventUriproperty, the
service shall keep the connection open and conform to theHTML5 Specificationuntil the client closes the
socket. Service-generated events shall be sent to the client by using the open connection.

When a client opens an SSE stream for the Event Service, the service shall create an
EventDestinationresource in theSubscriptionscollection for the Event Service to represent the
connection. TheContextproperty in theEventDestinationresource shall be a service-generated
opaque string.

The service shall delete the correspondingEventDestinationresource when the connection is closed.
The service shall close the connection if the correspondingEventDestinationresource is deleted.

The service shall use theidfield in the SSE stream to uniquely identify a payload in the SSE stream. The
value of theidfield is determined by the service. A service should accept theLast-Event-IDheader
from the client to allow a client to restart the event stream in case the connection is interrupted.

The service shall use thedatafield in the SSE stream based on the payload format. The SSE streams
have these formats:

- Metric report SSE stream. Services shall use this format when the Telemetry Service generates
    or updates a metric report.
- Event message SSE stream. Services shall use this format for all other types of events.

To reduce the amount of data returned to the client, the service should support the$filterquery
parameter in the URI for the SSE stream.

```
Note: The$filtersyntax shall follow the format in the$filter query parameter clause.
```
The service should support these properties as filter criteria:

- EventFormatType

```
The service sends events of the matchingEventFormatType.
```
```
Example:
```
```
https://sseuri?$filter=EventFormatType eq Event
```
Redfish Specification DSP0266

140 Published Version 1.8.1


```
Valid values are theEventFormatTypeenumerated string values that the Redfish
EventServiceschema defines.
```
- EventType

```
The service sends events of the matchingEventType.
```
```
Example:
```
```
https://sseuri?$filter=EventType eq StatusChange
```
```
Valid values are theEventTypeenumerated string values that the RedfishEventschema
defines.
```
- MessageId

```
The service sends events with the matchingMessageId.
```
```
Example:
```
```
https://sseuri?$filter=MessageId eq 'Contoso.1.0.TempAssert'
```
- MetricReportDefinition

```
The service sends metric reports generated from theMetricReportDefinition.
```
```
Example:
```
```
https://sseuri?$filter=MetricReportDefinition eq '/redfish/v1/
TelemetryService/MetricReportDefinitions/PowerMetrics'
```
- OriginResource

```
The service sends events for the resource.
```
```
Example:
```
```
https://sseuri?$filter=OriginResource eq '/redfish/v1/Chassis/1/Thermal'
```
- RegistryPrefix

DSP0266 Redfish Specification

Version 1.8.1 Published 141


```
The service sends events with messages that are part of theRegistryPrefix.
```
```
Example:
```
```
https://sseuri?$filter=(RegistryPrefix eq Resource) or (RegistryPrefix eq
Task)
```
- ResourceType

```
The service sends events for resources that match theResourceType.
```
```
Example:
```
```
https://sseuri?$filter=(ResourceType eq 'Power') or (ResourceType eq
'Thermal')
```
- SubordinateResources

```
WhenSubordinateResourcesistrueandOriginResourceis specified, the service sends
events for the resource and its subordinate resources.
```
```
Example:
```
```
https://sseuri?$filter=(OriginResource eq '/redfish/v1/Systems/1') and
(SubordinateResources eq true)
```
**12.5.2.1. Event message SSE stream**

The service shall use thedatafield in the SSE stream to include the JSON representation of theEvent
object.

The following example payload shows a stream that contains a single event with theidfield set to 1 , and
adatafield that contains a singleEventobject.

```
id: 1
data:{
data: "@odata.type": "#Event.v1_1_0.Event",
data: "Id": "1",
data: "Name": "Event Array",
data: "Context": "ABCDEFGH",
```
Redfish Specification DSP0266

142 Published Version 1.8.1


```
data: "Events": [
data: {
data: "MemberId": "1",
data: "EventType": "Alert",
data: "EventId": "1",
data: "Severity": "Warning",
data: "EventTimestamp": "2017-11-23T17:17:42-0600",
data: "Message": "The LAN has been disconnected",
data: "MessageId": "Alert.1.0.LanDisconnect",
data: "MessageArgs": [
data: "EthernetInterface 1",
data: "/redfish/v1/Systems/1"
data: ],
data: "OriginOfCondition": {
data: "@odata.id": "/redfish/v1/Systems/1/EthernetInterfaces/1"
data: },
data: "Context": "ABCDEFGH"
data: }
data: ]
data:}
```
**12.5.2.2. Metric report SSE stream**

The service shall use thedatafield in the SSE stream to include the JSON representation of the
MetricReportobject.

The following example payload shows a stream that contains a metric report with theidfield set to 127 ,
and thedatafield containing the metric report object.

```
id: 127
data:{
data: "@odata.id": "/redfish/v1/TelemetryService/MetricReports/
AvgPlatformPowerUsage",
data: "@odata.type": "#MetricReport.v1_3_0.MetricReport",
data: "Id": "AvgPlatformPowerUsage",
data: "Name": "Average Platform Power Usage metric report",
data: "MetricReportDefinition": {
data: "@odata.id": "/redfish/v1/TelemetryService/MetricReportDefinitions/
AvgPlatformPowerUsage"
data: },
data: "MetricValues": [
data: {
data: "MetricId": "AverageConsumedWatts",
data: "MetricValue": "100",
data: "Timestamp": "2016-11-08T12:25:00-05:00",
```
DSP0266 Redfish Specification

Version 1.8.1 Published 143


```
data: "MetricProperty": "/redfish/v1/Chassis/Tray_1/Power#/0/
PowerConsumedWatts"
data: },
data: {
data: "MetricId": "AverageConsumedWatts",
data: "MetricValue": "94",
data: "Timestamp": "2016-11-08T13:25:00-05:00",
data: "MetricProperty": "/redfish/v1/Chassis/Tray_1/Power#/0/
PowerConsumedWatts"
data: },
data: {
data: "MetricId": "AverageConsumedWatts",
data: "MetricValue": "100",
data: "Timestamp": "2016-11-08T14:25:00-05:00",
data: "MetricProperty": "/redfish/v1/Chassis/Tray_1/Power#/0/
PowerConsumedWatts"
data: }
data: ]
data:}
```
### 12.6. Update Service.................................................................................................................

#### 12.6.1. Overview............................................................................................................

This clause covers the mechanism for software updates by using the Update Service.

#### 12.6.2. Software update types.....................................................................................

Clients can use these methods to update software through the Update Service:

- Simple updates: The service _pulls_ the update from a client-indicated network location.
- Multipart HTTP push updates: The client uses HTTP or HTTPS with a multipart-formatted
    request body to _push_ a software image to the service.

**12.6.2.1. Simple updates**

A service may support theSimpleUpdateaction within theUpdateServiceresource. A client can
perform a POST to the action target URI to initiate a pull-based update, as define by the
UpdateServiceschema. After a successful POST, the service should return the HTTP202 Accepted
status code with theLocationheader set to the URI of a _task monitor_. Clients can use this _task_ to
monitor the progress and results of the update, which includes the progress of image transfer to the
service.

Redfish Specification DSP0266

144 Published Version 1.8.1


**12.6.2.2. Multipart HTTP push updates**

A service may support theMultipartHttpPushUriproperty within theUpdateServiceresource. A
client can perform an HTTP or HTTPS POST on the URI specified by this property to initiate a push-
based update.

- Access to this URI shall require the same privilege as access to the Update Service.
- A client POST to this URI shall contain theContent-TypeHTTP header with the value
    multipart/form-data, with the body formatted as defined by this specification. For more
    information aboutmultipart/form-dataHTTP requests, seeRFC7578.
- The client POST request shall contain the binary image as one of the parts in amultipart/
    form-datarequest body, as defined by the following table. In addition, the request shall include
    parameters for the update in a JSON formatted part in the samemultipart/form-data
    request body, as defined by the following table. If the request has no parameters, an empty
    JSON object shall be used.
- A service may require theContent-LengthHTTP header for POST requests to this URI. In
    this case, if a client does not include the requiredContent-Lengthheader in the POST
    request, the service shall return the HTTP411 Length Requiredstatus code.
- A service should return the HTTP412 Precondition Failedstatus code if the size of the
    binary image is larger than the maximum image size that the service supports, as advertised in
    MaxImageSizeBytesproperty in theUpdateServiceresource.
- After a successful POST to this URI, the service shall return the HTTP202 Acceptedstatus
    code with aLocationheader set to the URI of a _task monitor_. This _task_ can be used by clients
    to monitor the progress and results of the update.

The following table describes the requirements of amultipart/form-datarequest body for HTTP
push software update:

```
Request
body part
```
##### HTTP

```
headers
```
```
Header value and
parameters
Required Description
```
```
Update
parameters
JSON part
```
```
Content-
Disposition
```
```
form-data;
name="UpdateParameters"
Yes
```
```
JSON-formatted part for
passing the update
parameters. The value
of thenamefield shall be
"UpdateParameters".
The format of the JSON
shall follow the definition
of the
UpdateParameters
object in the
UpdateService
```
DSP0266 Redfish Specification

Version 1.8.1 Published 145


```
Request
body part
```
##### HTTP

```
headers
```
```
Header value and
parameters
Required Description
```
```
schema.
```
```
Content-
Type
```
```
application/
json;charset=utf-8or
application/json
```
```
Yes
```
```
The media type format
and character set of this
request part.
```
```
Update file
binary part
```
```
Content-
Disposition
```
```
form-data;
name="UpdateFile";
filename=string
```
```
Yes
```
```
Binary file to use for this
software update. The
value of thenamefield
shall be
"UpdateFile". The
value of thefilename
field should reflect the
name of the file as
loaded by the client.
```
```
Content-
Type
```
```
application/octet-
stream
Yes
The media type format
of the binary update file.
```
##### OEM

```
specific
parts
```
```
Content-
Disposition
```
```
form-data;
name="OemXXXX"
No
```
```
Optional OEM part. The
value of thenamefield
shall start with"Oem.
Content-Typeis
optional, and depends
on the OEM part type.
```
This example shows amultipart/form-datarequest to push an update image:

```
POST /redfish/v1/UpdateService/uploadHTTP/1.1
Host: <host-path>
Content-Type: multipart/form-data; boundary=---------------------------d74496d66958873e
Content-Length: <computed-length>
Connection: keep-alive
X-Auth-Token: <session-auth-token>
```
```
-----------------------------d74496d66958873e
Content-Disposition: form-data; name="UpdateParameters"
Content-Type: application/json
```
```
{
```
Redfish Specification DSP0266

146 Published Version 1.8.1


```
"Targets": [
"/redfish/v1/Managers/1"
],
"@Redfish.OperationApplyTime": "OnReset",
"Oem": {}
}
```
```
-----------------------------d74496d66958873e
Content-Disposition: form-data; name="UpdateFile"; filename="flash.bin"
Content-Type: application/octet-stream
```
```
<softwareimagebinary>
```
## 13. Security details...................................................................................................................................

### 13.1. Transport Layer Security (TLS) protocol...........................................................................

Implementations shall support the Transport Layer Security (TLS) protocol v1.1 or later.

Implementations should support:

- TheStorage Networking Industry Association (SNIA) TLS Specification for Storage Systems.
- The latest version of the TLS v1.x specification.

#### 13.1.1. Cipher suites....................................................................................................

Implementations should support AES-256-based ciphers from the TLS suites.

Redfish implementations should consider the support of ciphers, such as the following ciphers, which
enable authentication and identification without trusted certificates:

```
TLS_PSK_WITH_AES_256_GCM_SHA384
TLS_DHE_PSK_WITH_AES_256_GCM_SHA384
TLS_RSA_PSK_WITH_AES_256_GCM_SHA384
```
The advantage of these recommended ciphers is:

```
AES-GCM is not only efficient and secure, but hardware implementations can achieve high
speeds with low cost and low latency because the mode can be pipelined.
```
Additionally, Redfish implementations should support the following cipher:

DSP0266 Redfish Specification

Version 1.8.1 Published 147


```
TLS_RSA_WITH_AES_128_CBC_SHA
```
For more information, seeRFC5288andRFC5487.

#### 13.1.2. Certificates.......................................................................................................

Redfish implementations shall support replacement of the default certificate if one is provided.

Redfish implementations shall use certificates that conform to X.509-v3, as defined inRFC5280.

### 13.2. Operations that contain sensitive data..............................................................................

Operations that contain sensitive data should use HTTPS only. For example, aSimpleUpdateaction
with a user name and password should use HTTPS to protect the sensitive data.

### 13.3. Authentication...................................................................................................................

Services:

- Shall support bothHTTP Basic authenticationandRedfish session login authentication.
- Shall not require a client that uses HTTP Basic authentication to create a session.
- May implement other authentication mechanisms.

#### 13.3.1. HTTP header security......................................................................................

Services shall authenticate all write requests to Redfish resources. For example:

- POST, except to theSessionsresource collection for authentication
- PUT
- PATCH
- DELETE

Redfish resources shall not be available as unauthenticated, except for:

- The Service Root to identify the device and service locations
- TheRedfish metadata documentto get resource types
- TheOData service documentfor compatibility with OData clients
- The RedfishOpenAPI YAML documentfor compatibility with OpenAPI clients
- Theversionobject at/redfish

```
Note: This specification does not cover external services that are linked through external
references. These services may have other security requirements.
```
Redfish Specification DSP0266

148 Published Version 1.8.1


#### 13.3.2. HTTP redirect....................................................................................................

An HTTP redirect shall enforce the privilege requirements for the target resource.

Generally, if the location is reachable without authentication but only over HTTPS, the service shall issue
a redirect to the HTTPS version of the resource. When the resource is accessible only with
authentication, the service should return the HTTP404 Not Foundstatus code.

#### 13.3.3. Extended error handling..................................................................................

When authentication fails, extended error messages shall not provide privileged information.

#### 13.3.4. HTTP header authentication............................................................................

Services:

- Shall process HTTP headers for authentication before other headers that may affect the
    response. For example,ETag,If-Modified, and so on.
- Shall not use HTTP cookies to authenticate any activity, such as GET, POST, PUT, PATCH, and
    DELETE.

**13.3.4.1. HTTP Basic authentication**

Services shall support HTTP Basic authentication, as defined byRFC7617, and shall use only
connections that conform to TLS to transport the data between any third-party authentication service and
clients.

All requests that use HTTP Basic authentication shall require HTTPS.

**13.3.4.2. Request-level or message-level authentication**

An authentication header shall accompany every request that establishes a secure channel.

#### 13.3.5. Session management......................................................................................

**13.3.5.1. Session life cycle management**

Service shall provide login sessions that conform with this specification.

Session management is determined by the implementation of the Redfish Service, which includes
orphaned session timeout and the management of the number of simultaneous open sessions.

**13.3.5.2. Redfish login sessions**

For improved performance and security, a client should use the session management interface to create a

DSP0266 Redfish Specification

Version 1.8.1 Published 149


Redfish login session. The Session Service specifies the URI for session management.

To establish a session, find the URI in either:

- The Session Service'sSessionsproperty.
- The Service Root'slinks propertyunder theSessionsproperty.

Both URIs shall be the same.

```
{
"SessionService": {
"@odata.id": "/redfish/v1/SessionService"
},
"Links": {
"Sessions": {
"@odata.id": "/redfish/v1/SessionService/Sessions"
}
},
...
}
```
**13.3.5.3. Session login**

To create a Redfish session without an authentication header, perform an HTTP POST request to the
Session Service'sSessionsresource collection. Include the following POST body:

```
POST /redfish/v1/SessionService/SessionsHTTP/1.1
Host: <host-path>
Content-Type: application/json;charset=utf-8
Content-Length: <computed-length>
Accept: application/json;charset=utf-8
OData-Version: 4.0
```
```
{
"UserName": "<username>",
"Password": "<password>"
}
```
Fields in brackets are placeholders for client-specific values.

To verify that the request has been initiated from an authorized client domain, services should save the
Originheader in reference to this session creation and compare it to subsequent requests using this
session.

Redfish Specification DSP0266

150 Published Version 1.8.1


The response to the POST request to create a session shall include:

- X-Auth-Tokenheader. Contains asession authentication tokenthat the client can use in
    subsequent requests.
- Locationheader. Contains a hyperlink to the newSessionresource.
- JSON response body. Contains the full representation of the new session resource, as follows:

```
Location: /redfish/v1/SessionService/Sessions/1
X-Auth-Token: <session-auth-token>
```
```
{
"@odata.id":"/redfish/v1/SessionService/Sessions/1",
"@odata.type":"#Session.v1_0_0.Session",
"Id":"1",
"Name":"User Session",
"Description":"User Session",
"UserName":"<username>"
}
```
The client that sends the session login request should save thesession authentication tokenand the
contents of theLocationheader from the login POST request.

To authenticate subsequent requests, the client sets theX-Auth-Tokenheader to thesession
authentication tokenthat the POST login request returns.

To log out of or terminate the session, the client uses the URI that theLocationheader of the POST
request returns.

```
Note: The session ID differs from the session authentication token, as follows:
```
- **Session ID** : The session ID uniquely identifies theSessionresource. The response
    data with the last segment of theLocationheader URI returns is the session ID. To
    view active sessions and terminate any session, an administrator with sufficient
    privileges can use the session ID.
- **Session authentication token** : Only the client that executes the login has the session
    authentication token.

**13.3.5.4. HTTP X-Auth-Token header**

Services shall use only connections that conform to TLS to transport the data between any third-party
authentication service and clients.

The POST to create a session shall only be supported with HTTPS. If both HTTP and HTTPS are
enabled, a POST request to create a session through the HTTP port should redirect to the HTTPS port.

DSP0266 Redfish Specification

Version 1.8.1 Published 151


**13.3.5.5. Session lifetime**

Unlike some token-based methods that use token expiration times, Redfish sessions time out. As long as
a client continues to send requests more frequently than the session timeout period, the session remains
open and thesession authentication tokenremains valid. If the session times out, it is automatically
terminated.

**13.3.5.6. Session termination or logout**

When the client logs out, the Redfish session terminates. The session terminates through a DELETE
request to theSessionresource defined in either theLocationheader URI or the session ID in the
response data.

This ability to DELETE a session through theSessionresource enables an administrator with sufficient
privileges to terminate other users' sessions from a different session.

When a session is terminated, the service shall not affect independent connections established originally
by this session for other purposes, such as connections forServer-Sent Eventsor transferring an image
for theUpdate Service.

#### 13.3.6. Account Service...............................................................................................

- Implementations should store user passwords with one-way encryption techniques.
- Implementations may support exporting user accounts with passwords, but shall do so using
    encryption methods to protect them.
- User accounts shall support ETags and atomic operations. Implementations may reject requests
    that do not include an ETag.
- When authentication fails, extended error messages shall not provide privileged information.

#### 13.3.7. Password management...................................................................................

A Redfish Service provides local user accounts through a collection ofManagerAccountresources
located under the Account Service. TheManagerAccountresources enable users to manage their own
account information, and for administrators to create, delete, and manage other user accounts.

When account properties are changed, the service may close open sessions for this account and require
re-authentication.

**13.3.7.1. Password change required handling**

The service may require that passwords assigned by the manufacturer be changed by the end user prior
to accessing the service. In addition, administrators may require users to change their account's
password upon first access.

TheManagerAccountresource contains aPasswordChangeRequiredboolean property to enable

Redfish Specification DSP0266

152 Published Version 1.8.1


this functionality. Resources that have the property set totrueshall require the user to change the write-
onlyPasswordproperty in that resource before access is granted. Manufacturers including user
credentials for the service may use this method to force a change to those credentials before access is
granted.

When a client accesses the service by using credentials from aManagerAccountresource that has a
PasswordChangeRequiredvalue oftrue, the service shall allow:

- A session login and include a@Message.ExtendedInfoobject in the response containing the
    PasswordChangeRequiredmessage from the Base Message Registry. This indicates to the
    client that their session is restricted to performing only the password change operation before
    access is granted.
- A GET operation on theManagerAccountresource associated with the account.
- A PATCH operation on theManagerAccountresource associated with the account to update
    thePasswordproperty. If the value ofPasswordis changed, the service shall also set the
    PasswordChangeRequiredproperty tofalse.

For all other operations, the service shall respond with the HTTP403 Forbiddenstatus code and
include a@Message.ExtendedInfoobject that contains thePasswordChangeRequiredmessage
from the Base Message Registry.

#### 13.3.8. Asynchronous tasks........................................................................................

Irrespective of which user or privileged context starts a task, the information in the _task_ object shall
enforce the privileges required to access that object.

#### 13.3.9. Event subscriptions.........................................................................................

Before pushing event data object to the destination, the service may verify the destination for identity
purposes.

#### 13.3.10. Privilege model and authorization.................................................................

To control which users have access to resources and the type of access that users have, the
authorization subsystem uses roles and privileges.

A role is a defined set of privileges. Two roles with the same privileges shall behave equivalently. Each
user shall be assigned exactly one role.

This Specification defines a set of predefined roles, where **Role name** is the value of theIdproperty in
theRoleresource:

DSP0266 Redfish Specification

Version 1.8.1 Published 153


```
Role name Assigned privileges
```
```
Administrator
```
```
Login,ConfigureManager,ConfigureUsers,ConfigureComponents,
ConfigureSelf
```
```
Operator Login,ConfigureComponents,ConfigureSelf
```
```
ReadOnly Login,ConfigureSelf
```
Services shall support the previous predefined roles. Services may include OEM privileges in the
predefined roles. TheAssignedPrivilegesproperty in theRoleresource for the predefined roles
shall not be modifiable.

A service may define additional custom roles. A service may allow users to create custom roles through a
POST to theRolesresource collection.

A predefined role or a custom role shall be assigned to a user when a manager account is created. The
client shall provide theRoleIdproperty when creating a manager account to select the predefined role
or a custom role.

A privilege is a permission to complete an operation, such as read or write, within a defined management
domain, such as configuring users. TheAssignedPrivilegesarray in theRoleresource defines a set
of assigned privileges for the associated role. A service may also includeOemPrivilegesin theRole
resource for additional privileges.

Services shall enforce the same privilege model for ETag-related activity as is enforced for the data being
represented by the ETag. For example, when the activity that requires privileged access to read a data
item that the ETag represents requires the same privileged access to read the ETag.

#### 13.3.11. Redfish Service operation-to-privilege mapping............................................

For every request that a client makes to a service, the service shall determine that the authenticated
identity of the requester has the authorization to complete the requested operation on the resource in the
request.

Using the role and privileges authorization model where an authenticated identity context is assigned a
role and a role is a set of privileges, the service typically checks an HTTP request against a mapping of
the authenticated requesting identity role and privileges to determine whether the identity privileges are
sufficient to complete the operation in the request.

**13.3.11.1. Why specify operation-to-privilege mapping?**

Initial versions of the Redfish Specifications defined several role-to-privilege mappings for standardized
roles and normatively identified several privilege labels but did not normatively detail what these

Redfish Specification DSP0266

154 Published Version 1.8.1


privileges or how privilege-to-operations mappings could be specified or represented in a normative
fashion.

The lack of a methodology to define which privileges are required to complete a requested operation
against the URI in the request puts at risk the interoperability between service implementations that
clients may encounter due to variances in privilege requirements between implementations.

Also, a lack of methodology for specifying and representing the operation-to-privilege mapping prevents
the Redfish Forum or other governing organizations from normatively defining privilege requirements for a
service.

**13.3.11.2. Representing operation-to-privilege mappings**

A service should provide a Privilege Registry in the registry collection. This registry represents the
privileges required to complete HTTP operations against resources supported by the service.

The Privilege Registry is a JSON document that contains aMappingsarray of where an individual entry
exists for every resource type that the service supports.

The operation-to-privilege mapping is defined for every resource type and applies to every resource the
service implements for the applicable resource type.

In several situations, specific resources or properties may have differing operation-to-privilege mappings
than the resource type-level mappings. In these cases, the resource type-level mappings need to be
overridden. ThePrivilegeRegistryschema defines the methodology for resource type-level
operation-to-privilege mappings and related overrides.

If a service provides a Privilege Registry, the service shall use the Redfish Forum's Privilege Registry
definition as a base operation-to-privilege mapping definition for operations that the service supports to
promote interoperability for Redfish clients.

**13.3.11.3. Operation map syntax**

An operation map defines the set of privileges required to complete an operation on a resource-type.

The mapped operations are GET, PUT, PATCH, POST, DELETE, and HEAD. A privilege mapping is
defined for each operation, irrespective of whether the service or data model supports the operation on
the resource-type.

The privilege labels may be the Redfish standardized labels that thePrivilegeTypeenumeration in the
Privilegesschema defines and they may be OEM-defined privilege labels. The required privileges for
an operation are specified using logical AND and OR behavior. For more information, see thePrivilege
AND and OR syntaxclause.

The following example defines the privileges required for various operations on theManagerresource.

DSP0266 Redfish Specification

Version 1.8.1 Published 155


Unless the implementation defines mapping overrides to theOperationMaparray, the specified
operation-to-privilege mapping represents behavior for allManagerresources in a service
implementation.

```
{
"Entity":"Manager",
"OperationMap": {
"GET": [
{
"Privilege": ["Login"]
}
],
"HEAD": [
{
"Privilege": ["Login"]
}
],
"PATCH": [
{
"Privilege": ["ConfigureManager"]
}
],
"POST": [
{
"Privilege": ["ConfigureManager"]
}
],
"PUT": [
{
"Privilege": ["ConfigureManager"]
}
],
"DELETE": [
{
"Privilege": ["ConfigureManager"]
}
]
}
}
```
**13.3.11.4. Mapping overrides syntax**

In several situations, operation-to-privilege mapping varies from the resource type-level mapping.

Redfish Specification DSP0266

156 Published Version 1.8.1


```
Situation Description
```
```
Property
override
```
```
A property has different privilege requirements than the resource in which it resides.
For example, thePasswordproperty in theManagerAccountresource requires
theConfigureSelforConfigureUsersprivilege to change, in contrast to the
ConfigureUsersprivilege required for the other properties inManagerAccount
resources. If multiple properties with the same name are present in a resource, the
property override applies to all property instances.
```
```
Subordinate
override
```
```
A resource is used in context of another resource and the contextual privileges need
to govern. For example, the privileges for PATCH operations on
EthernetInterfaceresources depend on whether the resource is subordinate to
theManagerresource, whereConfigureManageris required, or the
ComputerSystemresource, whereConfigureComponentsis required.
```
```
Resource
URI
override
```
```
A resource instance has different privilege requirements for an operation than those
defined for the resource type.
```
The overrides are defined in the context of the operation-to-privilege mapping for a resource type.

If multiple overrides are specified for a single resource type, the following precedence should be used for
determining the appropriate override to apply:

- Property override
- Resource URI override
- Subordinate override

**13.3.11.5. Property override example**

In the following example, thePasswordproperty on theManagerAccountresource requires the
ConfigureSelforConfigureUsersprivilege to change, in contrast to theConfigureUsers
privilege required for the other properties inManagerAccountresources:

```
{
"Entity":"ManagerAccount",
"OperationMap": {
"GET": [
{
"Privilege": ["ConfigureManager"]
},
{
"Privilege": ["ConfigureUsers"]
```
DSP0266 Redfish Specification

Version 1.8.1 Published 157


```
},
{
"Privilege": ["ConfigureSelf"]
}
],
"HEAD": [
{
"Privilege": ["Login"]
}
],
"PATCH": [
{
"Privilege": ["ConfigureUsers"]
}
],
"POST": [
{
"Privilege": ["ConfigureUsers"]
}
],
"PUT": [
{
"Privilege": ["ConfigureUsers"]
}
],
"DELETE": [
{
"Privilege": ["ConfigureUsers"]
}
]
},
"PropertyOverrides": [
{
"Targets": [ "Password"],
"OperationMap": {
"PATCH": [
{
"Privilege": ["ConfigureUsers"]
},
{
"Privilege": ["ConfigureSelf"]
} ] } } ] }
```
Redfish Specification DSP0266

158 Published Version 1.8.1


**13.3.11.6. Subordinate override**

TheTargetsproperty inSubordinateOverrideslists a hierarchical representation for when to apply
the override. In the following example, the override for anEthernetInterfaceresource is applied
when it is subordinate to anEthernetInterfaceCollectionresource, which in turn is subordinate to
aManagerresource. If a client were to PATCH anEthernetInterfaceresource that matches this
override condition, it requires theConfigureManagerprivilege. Otherwise, the client requires the
ConfigureComponentsprivilege.

```
{
"Entity":"EthernetInterface",
"OperationMap": {
"GET": [
{
"Privilege": ["Login"]
}
],
"HEAD": [
{
"Privilege": ["Login"]
}
],
"PATCH": [
{
"Privilege": ["ConfigureComponents"]
}
],
"POST": [
{
"Privilege": ["ConfigureComponents"]
}
],
"PUT": [
{
"Privilege": ["ConfigureComponents"]
}
],
"DELETE": [
{
"Privilege": ["ConfigureComponents"]
}
]
},
"SubordinateOverrides": [
{
"Targets": [
```
DSP0266 Redfish Specification

Version 1.8.1 Published 159


```
"Manager",
"EthernetInterfaceCollection"
],
"OperationMap": {
"PATCH": [
{
"Privilege": ["ConfigureManager"]
}
],
"POST": [
{
"Privilege": ["ConfigureManager"]
}
],
"PUT": [
{
"Privilege": ["ConfigureManager"]
}
],
"DELETE": [
{
"Privilege": ["ConfigureManager"]
} ] } } ] }
```
**13.3.11.7. Resource URI override**

The following example demonstrates the resource URI override syntax to define operation privilege
variations for resource URIs.

The example defines bothConfigureComponentsandOEMAdminPrivprivileges as required to make
a PATCH operation on the two resource URIs listed as targets.

```
{
"Entity":"ComputerSystem",
"OperationMap": {
"GET": [
{
"Privilege": ["Login"]
}
],
```
Redfish Specification DSP0266

160 Published Version 1.8.1


```
"HEAD": [
{
"Privilege": ["Login"]
}
],
"PATCH": [
{
"Privilege": ["ConfigureComponents"]
}
],
"POST": [
{
"Privilege": ["ConfigureComponents"]
}
],
"PUT": [
{
"Privilege": ["ConfigureComponents"]
}
],
"DELETE": [
{
"Privilege": ["ConfigureComponents"]
}
]
},
"ResourceURIOverrides": [
{
"Targets": [
"/redfish/v1/Systems/VM6",
"/redfish/v1/Systems/Sys1"
],
"OperationMap": {
"GET": [
{
"Privilege": ["Login"]
}
],
"PATCH": [
{
"Privilege": ["ConfigureComponents","OEMSysAdminPriv"]
} ] } } ] }
```
DSP0266 Redfish Specification

Version 1.8.1 Published 161


**13.3.11.8. Privilege AND and OR syntax**

The array placement of the privilege labels in theOperationMapGET, HEAD, PATCH, POST, PUT, and
DELETE operation element arrays define the logical combinations of privileges that are required to call an
operation on a resource or property.

For OR logical combinations, the privilege label appears in the operation element array as individual
elements.

The following example defines eitherLoginorOEMPrivilege1privileges as required to perform a GET
operation.

```
{
"GET": [
{
"Privilege": [ "Login"]
},
{
"Privilege": [ "OEMPrivilege1"]
}
]
}
```
For logical AND combinations, the privilege label appears in thePrivilegeproperty array in the
operation element.

The following example defines bothConfigureComponentsandOEMSysAdminPrivas required to
perform a PATCH operation.

```
{
"PATCH": [
{
"Privilege": [ "ConfigureComponents","OEMSysAdminPriv"]
}
]
}
```
## 14. Redfish Host Interface........................................................................................................................

The Redfish Host Interface Specification defines how software that runs on a host computer system can
interface with a Redfish Service that manages the host. For details, seeDSP0270.

Redfish Specification DSP0266

162 Published Version 1.8.1


## 15. Redfish Composability........................................................................................................................

A service may implement theCompositionServiceresource off ofServiceRootto bind resources.
One example is disaggregated hardware, which allows for independent components, such as processors,
memory, I/O controllers, and drives, to be bound together to create logical constructs that operate
together. This enables a client to dynamically assign resources for an application.

A service that supports composability shall implement Resource Blocks, defined by theResourceBlock
schema, and the Resource Zones, defined in theZoneschema, for the Composition Service. Resource
Blocks provide an inventory of components available to the client for building compositions. Resource
Zones describe the binding restrictions of the Resource Blocks that the service manages.

The Resource Zones within the Composition Service shall include thecollection capabilities annotationin
responses. The collection capabilities annotation allows a client to discover which resource collections in
the service support compositions, the differentcomposition requesttypes allowed, and how the POST
request for the resource collection is formatted, as well as what properties are required.

### 15.1. Composition requests.......................................................................................................

A service that implements the Composition Service, as defined by theCompositionServiceschema,
shall support one or more of the following types of composition requests:

- Specific composition
- Constrained composition
- Expandable resources

A service that supports the removal of a composed resource shall support the DELETE method on the
composed resource.

#### 15.1.1. Specific composition........................................................................................

A specific composition is when a client identifies an exact set of resources in which to build a logical
entity.

A service that supports specific compositions shall support a POST request that contains an array of
hyperlinks to Resource Blocks. The schema for the resource being composed defines where the
Resource Blocks are specified in the request.

The following example shows aComputerSystembeing composed with a specific composition request:

```
POST /redfish/v1/SystemsHTTP/1.1
Content-Type: application/json;charset=utf-8
```
DSP0266 Redfish Specification

Version 1.8.1 Published 163


```
Content-Length: <computed length>
OData-Version: 4.0
```
```
{
"Name":"Sample Composed System",
"Links": {
"ResourceBlocks": [
{
"@odata.id":"/redfish/v1/CompositionService/ResourceBlocks/
ComputeBlock0"
},
{
"@odata.id":"/redfish/v1/CompositionService/ResourceBlocks/
DriveBlock2"
},
{
"@odata.id":"/redfish/v1/CompositionService/ResourceBlocks/NetBlock4"
}
]
}
}
```
#### 15.1.2. Constrained composition.................................................................................

A constrained composition is when a client has identified a set of criteria, or constraints, in which to build
a logical entity. This includes criteria such as quantities of components, or characteristics of components.
A service that supports constrained compositions shall support a POST request that contains the set of
characteristics to apply to the composed resource. The specific format of the request is defined by the
schema for the resource being composed. This type of request may include expanded elements of
resources subordinate to the composed resource.

The following example shows aComputerSystembeing composed with a constrained composition
request:

```
POST /redfish/v1/SystemsHTTP/1.1
Content-Type: application/json;charset=utf-8
Content-Length: <computed length>
OData-Version: 4.0
```
```
{
"Name":"Sample Composed System",
"PowerState":"On",
"BiosVersion":"P79 v1.00 (09/20/2013)",
"Processors": {
```
Redfish Specification DSP0266

164 Published Version 1.8.1


```
"Members": [
{
"@Redfish.RequestedCount": 4 ,
"@Redfish.AllowOverprovisioning":true,
"ProcessorType":"CPU",
"ProcessorArchitecture":"x86",
"InstructionSet":"x86-64",
"MaxSpeedMHz": 3700 ,
"TotalCores": 8 ,
"TotalThreads": 16
}
]
},
"Memory": {
"Members": [
{
"@Redfish.RequestedCount": 4 ,
"CapacityMiB": 8192 ,
"MemoryType":"DRAM",
"MemoryDeviceType": "DDR4"
}
]
},
"SimpleStorage": {
"Members": [
{
"@Redfish.RequestedCount": 6 ,
"Devices": [
{
"CapacityBytes": 322122547200
}
]
}
]
},
"EthernetInterfaces": {
"Members": [
{
"@Redfish.RequestedCount": 1 ,
"SpeedMbps": 1000 ,
"FullDuplex":true,
"NameServers": [
"names.redfishspecification.org"
],
"IPv4Addresses": [
{
"SubnetMask":"255.255.252.0",
```
DSP0266 Redfish Specification

Version 1.8.1 Published 165


```
"AddressOrigin":"Dynamic",
"Gateway": "192.168.0.1"
} ] } ] } }
```
#### 15.1.3. Expandable resources.....................................................................................

An expandable resource is when a service has a baseline composition that cannot be removed. Instead
of a client making requests to create a composed resource, a client can only add or remove resources
from the composed resource. A service that supports expandable resources shall support one or more of
the update methods that theUpdating a composed resourceclause describes.

### 15.2. Updating a composed resource........................................................................................

A service that supports updating a composed resource shall provide one or more of the following
methods to update composed resources:

- The PUT or PATCH methods on the composed resource with a modified list of Resource Blocks.
- Actions on the composed resource for adding and removing Resource Blocks.
    ◦ If the actions for adding and removing Resource Blocks are present in the resource,
       clients should use this method before attempting PUT or PATCH.

## 16. ANNEX A (informative).......................................................................................................................

### 16.1. Change log........................................................................................................................

```
Version Date Description
```
##### 1.8.1 2019-12-06

```
Many changes for style consistency, grammar, and general clarity.
Except for the following additions, no normative changes were made.
Any clarifications that inadvertently altered the normative behavior are
considered errata, and will be corrected in future revisions to the
Specification.
```
```
Clarified SSE with regards to requiring a blank line after each event.
```
```
Clarified order of precedence for resolving multiple operation overrides
```
Redfish Specification DSP0266

166 Published Version 1.8.1


```
Version Date Description
```
```
within the Privilege Registry.
```
```
Clarified cases for property overrides in the Privilege Registry where
multiple objects in the same resource contain the same property name.
```
```
Updated references for HTTP Basic authentication to use RFC7617
instead of RFC7235.
```
```
Addedtext/event-stream,application/yaml, and
application/vnd.oai.openapiusage to theAcceptand
Content-Typeheader table entries.
```
```
Added clause that provides guidance on service behavior whennullis
a property value in POST (create) operations.
```
```
Loosened requirements on SSEidbased on client usage.
```
```
Added documentation for settings, settings apply time, operation apply
time, operation apply time support, maintenance window, collection
capabilities, requested count, allow over-provisioning, zone affinity,
supported certificates, and deprecated terms to the Payload
annotations clause.
```
```
Added clauses that document responses for actions with a response
body defined in schema.
```
```
Clarified the allowable values payload annotation to show it can be used
for both properties and action parameters.
```
##### 1.8.0 2019-08-08

```
Added clause for using/redfish/v1/openapi.yamlas the well-
known URI for the OpenAPI document.
```
```
Added clause that specifies non-resource reference properties withUri
in the name are accessed using Redfish protocol semantics.
```
```
AddedSubordinateResources$filter parameter for SSE.
```
```
Added Update Service clause that describes requirements for the
SimpleUpdateaction and theMultipartHttpPushUriproperty.
```
##### 1.7.1 2019-08-08

```
Added statements about the owning entity annotation term and its
usage in schema modifications.
```
```
Clarified SSEidfromIdin an event payload andEventIdwithin an
```
DSP0266 Redfish Specification

Version 1.8.1 Published 167


```
Version Date Description
```
```
event record.
```
```
Fixed recommended sequencing of the SSEidto be related to
EventIdwithin an event record.
```
```
Clarified that services are allowed to close sessions for an account
when its password has changed.
```
```
Corrected the Password management clause to describe how a user
can GET their respective account resources when a password change
is required.
```
```
Clarified that registries are not required to return@odata.id.
```
```
Clarified that services should use HTTP400 Bad Requestfor invalid
query requests.
```
```
Clarified that services should use HTTP400 Bad Requestwhen the
onlyquery is being combined with other query parameters.
```
```
Clarified that services should use HTTP400 Bad Requestwhen
query parameters are used on non-GET operations.
```
```
Added clause about how to construct enumeration values.
```
```
Clarified references to specific messages to also reference their
Message Registry.
```
```
Added language about the construction of action names in payloads.
```
```
Added informative text for how OEM actions can be defined.
```
```
Added guidance for using HTTPS whenever sensitive data is being
transmitted.
```
```
Added clause restricting the maximum size of an event payload to be
1MiB.
```
```
Clarified that auto expanded resource collections can use paging.
```
```
Clarified error response format for SSE.
```
```
Clarified thatcharset=utf-8is not required within theContent-
Typeheader for SSE.
```
Redfish Specification DSP0266

168 Published Version 1.8.1


```
Version Date Description
```
```
Added clause about how URI patterns are constructed.
```
```
Added Excerpt term.
```
##### 1.7.0 2019-05-16

```
The Specification has been significantly rewritten for clarity. Except for
the following additions, no normative changes were made. Any
clarifications that inadvertently altered the normative behavior are
considered errata, and will be corrected in future revisions to the
Specification.
```
```
Added normative statements about how to handle array properties and
PATCH operations on arrays.
```
```
Separated data model and schema language clauses.
```
```
Added clauses that describe how JSON Schema and OpenAPI files are
formatted.
```
```
Added clause that describes the schema versioning methodology.
```
```
Added clause about how URI patterns are constructed based on the
resource tree and property hierarchy.
```
```
Added Dictionary file naming rules and repository locations.
```
```
Enhanced localization definitions and defined repository locations.
```
```
Added statement about SSE to the Eventing mechanism clause.
```
```
Added Constrained composition and Expandable resources clauses
to Redfish Composability.
```
```
Added clause about requiring event subscriptions to be persistent
across service restarts.
```
```
Added clause about persistence of tasks generated as a result of using
@Redfish.OperationApplyTimeacross service restarts.
```
```
Added clause about using@Redfish.OperationApplyTimeand
@Redfish.MaintenanceWindowwithin task responses.
```
```
Removed@odata.contextproperty from example payloads.
```
```
Added Password management clause to describe functional behavior
for restricting access when an account requires a password change.
```
DSP0266 Redfish Specification

Version 1.8.1 Published 169


```
Version Date Description
```
```
Added clause around the usage of the HTTP403 Forbiddenstatus
code when an account requires a password change.
```
##### 1.6.1 2018-12-13

```
Added clause about percent encoding being allowed for query
parameters.
```
```
Changed$expandexample to useSoftwareInventoryinstead of
LogEntry.
```
```
Added clause about the use of a separator for multiple query
parameters.
```
```
Fixed$filterexamples to use/instead of.for property paths.
```
```
Clarified the usage of messages in a successful action response;
provided an example.
```
```
Added clarification about services supporting a subset of HTTP
operations on resources specified in schema.
```
```
Added clarification about services implementing writable properties as
read only.
```
```
Added clarification about session termination not affecting connections
opened by the session.
```
```
Added "Redfish Provider" term definition.
```
```
Updated JSON Schema references to point to Draft 7 of the JSON
Schema Specification.
```
```
Added clarifications about scenarios for when a request to add an event
subscription contains conflicting information and how services respond.
```
```
Removed language about ignoring theLinksproperty in PATCH
requests.
```
```
Clarified usage of ETags to show that a client is not supposed to PATCH
@odata.etagwhen attempting to use ETag protection for a resource.
```
```
Clarified usage of theonlyquery parameter to show it's not to be
combined with$expandand not to be used with singular resources.
```
```
Clarified the usage of the HTTP status codes with task monitors.
```
Redfish Specification DSP0266

170 Published Version 1.8.1


```
Version Date Description
```
```
Various spelling and grammar fixes.
```
##### 1.6.0 2018-08-23

```
Added methods of using$filteron the SSE URI for the Event
Service.
```
```
Added support for the OpenAPI Specification v3.0. This allows
OpenAPI-conforming software to access Redfish Service
implementations.
```
```
Added strict definitions for the URI patterns used for Redfish resources
to support OpenAPI. Each URI is now constructed using a combination
of fixed, defined path segments and the values ofIdproperties for
resource collections. Also added restrictions on usage of unsafe
characters in URIs. Implementations reporting support for Redfish
v1.6.0 conform to these URI patterns.
```
```
Added support for creating and naming Redfish schema files in the
OpenAPI YAML-based format.
```
```
Added URI construction rules for OEM extensions.
```
```
Changed ETag usage to require strong ETag format.
```
```
Added requirement for HTTPAllowheader as a response header for
GET and HEAD operations.
```
```
Added metric reports as a type of event that can be produced by a
Redfish Service. Added support for SSE streaming of metric reports in
support of new Telemetry Service.
```
```
Added registry, resource, origin, orEventFormatType-based event
subscription methods as detailed in the Specification and schema.
Added anEventFormatTypeto enable additional payload types for
subscription-based or streaming events. DeprecatedEventType-based
event subscription mechanism.
```
```
Added Event message grouping capability.
```
```
Provided guidance for defining and using OEM extensions for
messages and Message Registries.
```
```
Addedexcerptandonlyquery parameters.
```
```
Clarified requirements for resource collection responses, which includes
```
DSP0266 Redfish Specification

Version 1.8.1 Published 171


```
Version Date Description
```
```
required properties that were expected, but not listed explicitly in the
Specification.
```
```
Made inclusion of the@odata.contextannotation optional.
```
```
Removed requirement for clients to include theOData-VersionHTTP
header in all requests.
```
##### 1.5.1 2018-08-10

```
Added clarifications to required properties in structured properties
derived fromReferenceableMembers.
```
```
Reorganized Eventing clause to break out the different subscription
methods to differentiate pub-sub from SSE.
```
```
Removed statements referencing OData conformance levels.
```
```
Clarified terminology to explain usage of absolute versus relative
reference throughout.
```
```
Clarified client-side HTTPAcceptheader requirements.
```
```
Added evaluation order for supported query parameters and clarified
examples.
```
```
Clarified handling of annotations in response payloads when used with
$selectqueries.
```
```
Clarified service handling of annotations in PATCH requests.
```
```
Clarified handling of various PATCH request error conditions.
```
```
Clarified ability to create resource collection members by POST
operations to the resource collection or theMembersarray within the
resource.
```
```
Corrected several examples to show required properties in payload.
```
```
Clarified usage of theLinkheader and values ofrel=describedBy.
```
```
Clarified that the HTTP status code table only describes Redfish-
specific behavior and that unless specified, all other usage follows the
definitions within the appropriate RFCs.
```
```
Added entry for the HTTP431 Request Header Fields Too
Largestatus code.
```
Redfish Specification DSP0266

172 Published Version 1.8.1


```
Version Date Description
```
```
Added statement that the HTTP503 Service Unavailablestatus
code can be used during reboot or reset of a service to indicate that the
service is temporarily unavailable.
```
```
Clarified usage of the@odata.typeannotation within embedded
objects.
```
```
Added statements about the requiredName,Id, andMemberId
properties, and the commonDescriptionproperty, which have
always been shown as required in schema files, but which the
Specification did not mention.
```
```
Added guidance for the value of time-date properties when time is
unknown.
```
```
Added thetitleproperty description in actions.
```
```
Clarified usage of the@odata.nextLinkannotation at the end of
resource collections.
```
```
Added additional guidance for naming properties and enumeration
values that contain "OEM" or that include acronyms.
```
```
Corrected requirements for description and long description
annotations.
```
```
Corrected name ofConfigureComponentsin the Operation-to-
privilege mapping clause.
```
```
Various typographical errors and grammatical improvements.
```
##### 1.5.0 2018-04-05

```
Added support for Server-Sent Eventing for streaming events to web-
based GUIs or other clients.
```
```
Added@Redfish.OperationApplyTimeannotation to provide a
mechanism for specifying deterministic behavior for the application of
Create, Delete or Action (POST) operations.
```
```
1.4.1 2018-04-05 Updated name of the DMTF Forum from SPMF to Redfish Forum.
```
```
Consistently used the term, hyperlink.
```
```
Added example to clarify usage of$selectquery parameter with
$expand, and clarified expected results when usingAutoExpand.
```
DSP0266 Redfish Specification

Version 1.8.1 Published 173


```
Version Date Description
```
```
Corrected order of precedence for$filterparameter options.
```
```
Corrected terminology for OEM-defined actions removing "custom" in
favor of OEM, and clarified that the actiontargetproperty is always
required for an action, along with its usage.
```
```
Corrected location header values for responses to data modification
requests that create a task (Taskresource vs. task monitor). Clarified
error handling of DELETE operations onTaskresources.
```
```
Removed references to obsolete and unusedPrivilegeannotation
namespace.
```
```
Clarified usage of theBase.1.0.GeneralErrormessage in the
Base Message Registry.
```
```
Added durable URIs for registries and profiles, and clarified intended
usage for each folder in the repository. Added file naming conventions
for registries and profiles, and clarified file naming for schemas.
```
```
Added statement to clarify that additional headers may be added to M-
SEARCH responses for SSDP to enable UPnP compatibility.
```
```
Clarified assignment requirements for predefined or custom roles when
new manager account instances are created, using theRoleId
property.
```
##### 1.4.0 2017-11-17

```
Added support for optional query parameters ($expand,$filter, and
$select) on requests to enable more efficient retrieval of resources or
properties from a Redfish Service.
```
```
Clarified HTTP status and payload responses after successful
processing of data modification requests. This includes POST
operations for performing actions, as well as other POST, PATCH, or
PUT requests.
```
```
Added entries for the HTTP428 Precondition Requiredand 507
Insufficient Storagestatus codes to clarify the proper response
to certain error conditions. Added reference links to the HTTP status
code table throughout.
```
```
Updated the Abstract to reflect the current state of the Specification.
```
```
Added reference to RFC6585 and clarified expected behavior when
```
Redfish Specification DSP0266

174 Published Version 1.8.1


```
Version Date Description
```
```
ETag support is used in conjunction with PUT or PATCH operations.
```
```
Added definition for "Property" term and updated text to use term
consistently.
```
```
Added "Client requirement" column and information for HTTP headers
on requests.
```
```
Clarified the usage and expected format of the@odata.context
property value.
```
```
Added clause to describe how to revise structured properties and
resolve their definitions in schema.
```
```
Added more descriptive definition for the settings resource. Added an
example for theSettingsObject. Added description and example for
using the@Redfish.SettingsApplyTimeannotation.
```
```
Added Action example using theActionInforesource in addition to
the simple@Redfish.AllowableValuesexample. Updated example
to show a proper subset of the available enumerations to reflect a real-
world example.
```
```
Added statement explaining the updates required toTaskStateupon
task completion.
```
##### 1.3.0 2017-08-1 1

```
Added support for a service to optionally reject a PATCH or PUT
operation if theIf-MatchorIf-Match-NoneHTTP header is
required by returning the HTTP428 Precondition Required
status code.
```
```
Added support for a service to describe when the values in the settings
object for a resource are applied via the
@Redfish.SettingsApplyTimeannotation.
```
```
1.2.1 2017-08-10 Clarified wording of theOemobject definition.
```
```
Clarified wording of the Partial resource results clause.
```
```
Clarified behavior of a service when receiving a PATCH with an empty
JSON object.
```
```
Added statement about other uses of the HTTP503 Service
Unavailablestatus code.
```
DSP0266 Redfish Specification

Version 1.8.1 Published 175


```
Version Date Description
```
```
Clarified format of URI fragments to conform to RFC6901.
```
```
Clarified use of absolute and relative URIs.
```
```
Clarified definition of thetargetproperty as originating from OData.
```
```
Clarified distinction between hyperlinks and the links property.
```
```
Corrected the JSON example of the privilege map.
```
```
Clarified format of the@odata.contextproperty.
```
```
Added clauses about the schema file naming conventions.
```
```
Clarified behavior of a service when receiving a PUT with missing
properties.
```
```
Clarified valid values in theAcceptheader to include wildcards per
RFC7231.
```
```
CorrectedConfigureUserprivilege to be spelledConfigureUsers.
```
```
Corrected the Session login clause to include normative language.
```
```
1.2.0 2017-04-14 Added support for the Redfish Composability Service.
```
```
Clarified service handling of theAccept-Encodingheader in a
request.
```
```
Improved consistency and formatting of example requests and
responses throughout.
```
```
Corrected usage of the@odata.typeproperty in response examples.
```
```
Clarified usage of the required annotation.
```
```
Clarified usage ofSubordinateOverridesin the Privilege Registry.
```
##### 1.1.0 2016-12-09

```
Added Redfish Service operation-to-privilege mapping clause. This
functionality enables a service to present a resource or even property-
level mapping of HTTP operations to roles and privileges.
```
```
Added references to the Redfish Host Interface Specification
(DSP0270).
```
```
1.0.5 2016-12-09 Errata release. Various typographical errors.
```
Redfish Specification DSP0266

176 Published Version 1.8.1


```
Version Date Description
```
```
Corrected the use of collection , resource collection , and members
throughout.
```
```
Added glossary entries for resource collection and members.
```
```
Corrected certificate requirements to reference definitions and
requirements in RFC5280 and added a normative reference to
RFC5280.
```
```
Clarified usage of the HTTP POST and PATCH operations.
```
```
Clarified usage of the HTTP status codes and error responses.
```
```
1.0.4 2016-08-28 Errata release. Various typographical errors.
```
```
Added example of an HTTPLinkHeader and clarified usage and
content.
```
```
Added the Schema modification clause, which describes the allowed
usage of the schema files.
```
```
Added recommendation to use TLS 1.2 or later, and to follow the SNIA
TLS Specification. Added reference to the SNIA TLS Specification.
Added additional recommendedTLS_RSA_WITH_AES_128_CBC_SHA
cipher suite.
```
```
Clarified that theIdproperty of aRoleresource matches the role
name.
```
##### 1.0.3 2016-06-17

```
Errata release. Fixed the missing numbering in the table of contents and
clauses. Corrected URL references to external specifications. Added
missing normative references. Corrected typographical error in ETag
example.
```
```
Clarified examples for@Message.ExtendedInfoto show arrays of
messages.
```
```
Clarified that a POST to Session Service to create a new session does
not require authorization headers.
```
```
1.0.2 2016-03-31 Errata release. Various typographical errors.
```
```
Corrected normative language for M-SEARCH queries and responses.
```
```
CorrectedCache-ControlandUSNformat in M-SEARCH responses.
```
DSP0266 Redfish Specification

Version 1.8.1 Published 177


```
Version Date Description
```
```
Corrected schema namespace rules to conform to OData namespace
requirements and updated examples throughout the document to
conform to this format. Specifically, namespace. n. n. n becomes
namespace .v n _ n _ n. File naming rules for JSON Schema and CSDL
(XML) schemas were also corrected to match this format and to enable
future major (v2) versions to coexist.
```
```
Added clause that details the location of the schema repository and lists
the durable URLs for the repository.
```
```
Added definition for the value of the Units annotation, using the
definitions from the UCUM Specification. Updated examples throughout
to use this standardized form.
```
```
Modified the naming requirements forOemproperty naming to avoid
future use of colon:and period.in property names, which can
produce invalid or problematic variable names when used in some
programming languages or environments. Both separators have been
replaced with underscore (_), with colon (:) and period (.) usage now
deprecated (but valid).
```
```
Removed duplicative or out-of-scope sub-clauses from the Security
clause, which made unintended requirements on Redfish Service
implementations.
```
```
Added the requirement that property names in resource responses
match the casing (capitalization) as specified in schema.
```
```
Updated normative references to current HTTP RFCs and added clause
references throughout the document where applicable.
```
```
Clarified ETag header requirements.
```
```
Clarified that no authentication is required for accessing the Service
Root.
```
```
Clarified description of retrieving resource collections.
```
```
Clarified usage ofcharset=utf-8in the HTTPAcceptand
Content-Typeheaders.
```
```
Clarified usage of theAllowHTTP response header and added a table
entry for theRetry-Afterheader usage.
```
Redfish Specification DSP0266

178 Published Version 1.8.1


```
Version Date Description
```
```
Clarified normative usage of the type property and context property,
explaining the ability to use two URL forms, and corrected the
@odata.contextURL examples throughout.
```
```
Corrected inconsistent terminology throughout the resource collection
response clause.
```
```
Corrected name of normative resourceMembersproperty (Members,
notvalue).
```
```
Clarified that error responses may include information about multiple
error conditions.
```
```
Corrected name ofMeasures.Unitannotation term as used in
examples.
```
```
Corrected outdated reference to Core OData Specification in annotation
term examples.
```
```
Added theMembersproperty to the Common Redfish resource
properties clause.
```
```
Clarified terminology and usage of the task monitor and related
operations in the Asynchronous operations clause.
```
```
Clarified that implementation of the SSDP protocol is optional.
```
```
Corrected typographical error in the SSDPUSNfield's string definition
(now::dmtf-org).
```
```
Added the OPTIONS method to the allowed HTTP methods list.
```
```
Fixed nullablity in example.
```
```
1.0.1 2015-09-17 Errata release. Various grammatical corrections.
```
```
Clarified normative use of long description in schema files.
```
```
Clarified usage of therel-describedbyLinkheader.
```
```
Corrected text in example of "Select List" in OData context property.
```
```
ClarifiedAccept-Encodingrequest header handling.
```
```
Deleted duplicative and conflicting statement on returning extended
```
DSP0266 Redfish Specification

Version 1.8.1 Published 179


```
Version Date Description
```
```
error resources.
```
```
Clarified relative URI resolution rules.
```
```
Clarified USN format.
```
```
1.0.0 2015-08-04 Initial release.
```
Redfish Specification DSP0266

180 Published Version 1.8.1



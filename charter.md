# Web Bluetooth Community Group Charter

* This Charter: TBD
* Previous Charter: None
* Start Date: 2015-??-??

## Goals

Allow websites to communicate with devices in a secure and privacy-preserving way.
In particular the Web Bluetooth API will focus on
minimizing the device attack surface exposed to malicious websites,
possibly by removing access to
some existing Bluetooth features that are hard to implement securely.
Further, the API will anticipate a user interface to
select and approve access to devices as opposed to assuming certification and installation.

## Scope of Work

The [Web Bluetooth Use Cases](http://webbluetoothcg.github.io/web-bluetooth/use-cases.html)
document describes the use cases the group aims to address with the Web Bluetooth API.
The specification focuses on the Bluetooth 4 GATT protocol in the Central and Client roles,
over either a BR/EDR or LE connection, and intends to support communication with devices
that implement Bluetooth 4.0, 4.1, or 4.2.

### Out of Scope

{TBD: Identify topics known in advance to be out of scope}

## Deliverables

### Community Group Reports that are Specifications

* Web Bluetooth API to discover and communicate with devices over the Bluetooth 4 wireless
standard using the Generic Attribute Profile (GATT). See the
[Web Bluetooth API](http://webbluetoothcg.github.io/web-bluetooth/) that serves as the
initial input.

## Dependencies or Liaisons

* Web Application Security Working Group.
[Privileged Contexts](https://w3c.github.io/webappsec/specs/powerfulfeatures/) outlines normative
requirements which should be incorporated into documents specifying new features. Since the
Web Bluetooth API requires that only sufficiently secure contexts can access Bluetooth devices,
the group should coordinate with the Web Application Security Working Group to ensure the API
adheres to the requirements.

* Web NFC Community Group. The Web Bluetooth Community Group will closely follow the work of the
Web NFC Community Group, specifically, the [Web NFC API](http://w3c.github.io/web-nfc/),
exploring the similarities of the approach on using these technologies by Web pages where applicable.
Specifically, the group will coordinate with the Web NFC Community Group with regard to the NFC handover.

* Bluetooth SIG. The Web Bluetooth Community Group defines an API that builds atop Bluetooth
APIs provided by the underlying platform, defined by Bluetooth SIG.

## Community and Business Group Process

Terms of in this charter that conflict with those of the Community and Business Group Process are void.

### Work Limited to Charter Scope

The group will not publish Community Group Reports that are
Specifications on topics other than those listed under "Community Group Reports that are Specifications" above.
See below for how to modify the charter.
The CLA applies to these Community Group Reports.

### Contribution Mechanics

For these Reports, Community Group participants agree to send contributions to
either the group "contrib" list or to the general group list, with subject line starting "[short-name-for spec]".
When meeting discussion includes contributions,
contributors are expected to record those contributions explicitly on the mailing list as described.

### Chair Selection

Participants in this group choose their Chair(s) and
can replace their Chair(s) at any time using whatever means they prefer.
However, if 5 participants—no two from the same organization—call for an election,
the group must use the following process to replace any current Chair(s) with a new Chair,
consulting the Community Development Lead on election operations (e.g., voting infrastructure and using RFC 2777).

1. Participants announce their candidacies.
   Participants have 14 days to announce their candidacies,
   but this period ends as soon as all participants have announced their intentions.
   If there is only one candidate, that person becomes the Chair.
   If there are two or more candidates, there is a vote.
   Otherwise, nothing changes.
1. Participants vote.
   Participants have 21 days to vote for a single candidate,
   but this period ends as soon as all participants have voted.
   The individual who receives the most votes—no two from the same organization—is elected chair.
   In case of a tie, RFC2777 is used to break the tie.
   An elected Chair may appoint co-Chairs.

Participants dissatisfied with the outcome of an election may ask the Community Development Lead to intervene.
The Community Development Lead, after evaluating the election, may take any action including no action.

### Decision Process

This group will seek to make decisions when there is consensus.
When the group discusses an issue on the mailing list and there is a call from the group for assessing consensus,
after due consideration of different opinions, the Chair should record a decision and any objections.
Participants may call for an online vote if
they feel the Chair has not accurately determined the consensus of the group or if the Chair refuses to assess consensus.
The call for a vote must specify the duration of the vote
which must be at least 7 days and should be no more than 14 days.
The Chair must start the vote within 7 days of the request.
The decision will be based on the majority of the ballots cast.
It is the Chair's responsibility to ensure that the decision process is fair,
respects the consensus of the CG,
and does not unreasonably favor or discriminate against any group participant or their employer.

### Transparency

The group will conduct all of its technical work on its public mailing list.
Any decisions reached at any meeting are tentative.
Any group participant may object to a decision reached at an online meeting
within 7 days of publication of the decision on the mail list.
That decision must then be confirmed on the mail list by the Decision Process above.

## Amendments to this Charter

The group can decide to work on a proposed amended charter,
editing the text using the Decision Process described above.
The decision on whether to adopt the amended charter is made by
conducting a 30-day vote on the proposed new charter.
The new charter, if approved, takes effect on either the proposed date in the charter itself,
or 7 days after the result of the election is announced, whichever is later.
A new charter must receive 2/3 of the votes cast in the approval vote to pass.
The group may make simple corrections to the charter such as deliverable dates
by the simpler group decision process rather than this charter amendment process.
The group will use the amendment process for any substantive changes to the
goals, scope, deliverables, decision process or rules for amending the charter.

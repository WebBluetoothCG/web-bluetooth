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

* Communication over arbitrary L2CAP channels, RFCOMM channels,
  or other stream and socket-based channels.

## Deliverables

If documents (including Specifications) from this Community Group are adopted by W3C Working Groups,
it is requested that the W3C apply dual licensing to the Working Group version
to license the work under a permissive copyright license,
preferably a license compatible with the W3C Community Group CLA.
An example of dual licensing in Working Groups can be found in the
[HTML WG Charter](http://www.w3.org/2013/09/html-charter.html#documentlicense).

### Community Group Reports that are Specifications

* Web Bluetooth API to discover and communicate with devices over the Bluetooth 4 wireless
standard using the Generic Attribute Profile (GATT). See the
[Web Bluetooth API](http://webbluetoothcg.github.io/web-bluetooth/) that serves as the
initial input.

This could be published as either one or a set of related specifications.

### Community Group Reports that are not Specifications

The group MAY produce other Community Group Reports within the scope of this charter
but that are not Specifications covered by the CLA.
Such reports may include:

* A description of the Web Bluetooth API's security model,
  including one or more potential ceremonies through which a user grants limited access to a device.

### Test Suites and Other Software

The group MAY produce test suites and other software to support the Specifications.
This software will be hosted in the [WebBluetoothCG GitHub organization](https://github.com/WebBluetoothCG/)
under the [Apache 2](http://www.apache.org/licenses/LICENSE-2.0.html) license.
This software may include:

* A test suite for the Web Bluetooth API.
* Polyfills for the Web Bluetooth on top of existing native APIs
  like [Chrome Apps](https://github.com/WebBluetoothCG/chrome-app-polyfill) and Cordova.
* Demo applications and debugging tools for developers using the Web Bluetooth API.

## Dependencies or Liaisons

* Web Application Security Working Group.
  Because the Web Bluetooth specification grants new capabilities to websites,
  the group should coordinate with the Web Application Security Working Group to ensure
  the API receives sufficient review from a security perspective.

* Web NFC Community Group. The Web Bluetooth Community Group will closely follow the work of the
Web NFC Community Group, specifically, the [Web NFC API](http://w3c.github.io/web-nfc/),
exploring the similarities of the approach on using these technologies by Web pages where applicable.
Specifically, the group will coordinate with the Web NFC Community Group with regard to the NFC handover.

* Bluetooth SIG. The Web Bluetooth Community Group defines an API that builds atop Bluetooth
APIs provided by the underlying platform, defined by Bluetooth SIG.
  The group may request changes to the underlying platform through the Bluetooth SIG,
  if such changes are needed in order to better serve the web platform.

## Community and Business Group Process

Terms of in this charter that conflict with those of the Community and Business Group Process are void.

### Work Limited to Charter Scope

The group will not publish Community Group Reports that are
Specifications on topics other than those listed under "Community Group Reports that are Specifications" above.
See below for how to modify the charter.
The CLA applies to these Community Group Reports.

### Contribution Mechanics

Community Group Participants agree to make all contributions
through pull requests for a particular report in GitHub.
A participant may ask someone else to make the pull request for them by sending a post to the
["contrib" list](http://lists.w3.org/Archives/Public/public-web-bluetooth-contrib/)
or [group list](http://lists.w3.org/Archives/Public/public-web-bluetooth/),
with subject line starting "[short-name-for-spec]PR"
or by making the request in a GitHub issue.
The pull request that results from this must indicate who the request was made for
and provide the URL for the archived request.
For software, the GitHub CONTRIBUTING and LICENSE files describe how to contribute
and under what license Contributions are made.

GitHub issues and pull requests will be archived to the
[public-web-bluetooth-log](http://lists.w3.org/Archives/Public/public-web-bluetooth-log/) list.

When meeting discussion includes contributions,
contributors are expected to record those contributions explicitly
on GitHub or the mailing list as described.

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

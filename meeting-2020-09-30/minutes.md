---
author: "Simon Seruyinda"
date: 30-09-2020
---

# Minutes of the AFRINIC DBWG Meeting

***30th September 2020***

## 1. Introductory remarks

Presented by *Mr. Eddy Kayihura - AFRINIC CEO*

-   Highlighted the important work accomplished together such as the IRR
    interface in MyAFRINIC
-   AFRINIC is working on strengthening RPKI infrastructure
-   Member participation is crucial to AFRINIC achieving its goals
-   Work of sanitization  and strengthening of the database is still on going
-   Encouraged members to participate in the RPD policy discussions as they
    will impact what happens in the database.
-   Encouraged members to step forward and volunteer to serve as second
    co-chair and highlighted the goal for the WG  to be community driven
-   Stated that there is discussions about Inter-RIR collaboration to develop
    common API standards for RPKI & WHOIS at the NRO ECG and mentioned that
    RDAP may be the future of WHOIS

## 2. Agenda discussion and confirmation

Amreesh requested to present first as he had another meeting to attend later
on.

## 3. Discussion of Working Group procedures

There had been questions on the mailing list on how to submit proposals and how
chairs should be elected.

When something is concluded, how does staff know if its concluded so they can
go into implementation?

It was agreed that we need common understanding on what our job is as a WG. If
this is just a forum for discussion of database related matters then we may not
need a formal structure.  But if we are to guide implementation decisions and
have policies on how the database should operate and the UIs, then we need the
ability to work on and publish documents that have reached consensus.

It's better for the group to decide about scope of the working group.

There was also a question regarding the relationship of this working group to
the policy working group. Are we an advisory to the policy working group?  If
we decide that this working group is for development of policies that impact
the DB, then the chairs of both working groups have to work together and get
feedback from each other on discussions going on.

We should not limit ourselves to discussing policy, although the bug reporting
channel is a valuable one.

The Chair called for volunteers to work with him to discuss and document
procedures and define scope for the working group. Ben Maddison volunteered,
and requested that at least 1 staff member familiar with the development
process also take part. Yogesh and Simon also volunteered.

- Documents produced will be shared to the working group.
- WG Charter produced will be blessed by the AFRINIC Board.

## 4. 2nd co-chair election or nomination

The Chair called for volunteers for position of DBWG co-chair.

Ben Maddison's name was suggested by members and was seconded overwhelmingly in
the chat room.

Ben agreed to volunteer on a temporary basis, pending the work of drafting the
charter which might change what it means to be a co-chair of the working group.

## 5. Review of previous Database Working Group session minutes

Frank shared link of previous minutes on the working group prior to the
meeting.

Some of the items reviewed from the minutes were the auto-renewal of ROAs, and
the cheat-sheet to help members to switch to BCRYPT.

AFRINIC staff confirmed that these were to be covered in the presentation from
the Applications Team and about database security.

## 6. RPKI `AS0` implementation plan

Presented by *Amreesh Phokeer - Research & Innovation team*

Amreesh presented the technical options for implementation of `AS0` policy.

**Option A:**

Special purpose `org` which will receive from the production certificate all
the unallocated space.

Then from this unallocated space, we can create the `AS0` ROAs. This will be
published under the same TAL.

MyAFRINIC has to ensure that this special `org` can only create ROAs with `AS0`
for unallocated space.

Impact is medium on MyAFRINIC.

Con is that relying parties cant opt out.

**Option B:**

Almost same as option 1 but instead of using the resources from the list of the
five CA available we shall created unallocated CA. On the member-side, we can
have a special purpose organization, which will be provisioned with unallocated
space, and then it will create the ROAs.

Difference is that we shall have a new production CA claiming `0/0`. If we go
for this, the impact is small. The repository will be published in the same
repository, so relying parties cannot opt out.

Question was asked on why we need a subordinate member CA here when we can
create them from the unallocated CA directly.

It was explained that The member CA would have the unallocated space and is
refreshed automatically whereas the production CA is refreshed manually.

A WG Member was also concerned about another CA claiming `0/0` in the RPKI
system. Can't the automation be retooled so its not refreshed manually?

It was explained that the certificates are offline and are only refreshed when
we get resources from IANA.

A WG member also pointed out that With the upcoming Inter-RIR Transfer policy,
we may have to refresh these certificates more regularly. It was suggested that
it would be better to automate that process now since we will have to do it
anyway.

**Option C:**

Create a new trust anchor, which would be a subset or a `0/0`. We could then
have a subordinate member CA, or not.

Advantage is that member CA can be refreshed automatically. This is completely
independent TA. It would talk to the AFRINIC inventory system.

Impact on MyAFRINIC is low, impact on existing system is low and is easier to
maintain.

Disadvantage: could have conflicting ROAs if not careful.  Have to ensure we do
not have ROAs on already allocated space.

Advantage is relying parties can opt-in if they want. Having a new tree is
neat. If members do not want the `AS0` policy we can wipe it out. WG Members
were informed that APNIC has adopted option C.

One WG member suggested that there was another option D, which would be a
combination of option A or B together with an update to SLURM which provides
option to prune the CA tree.

## 7. Update from the AFRINIC Applications unit

Presented by *Yogesh Chadee*

Yogesh presented the activities for this year namely:

-   Went live with new stats portal [https://stats.afrinic.net].  Provide us
    your feedback
-   We have delta protocol live in March 2020
-   We will work on auto-renewal of ROAs in Q4 2020.
-   Policy implementations:
    -   IPv6 PI/PA clarifications near completion We started publication of the
        unredacted dump
    -   Re-ordering of attributes
    -   WHOIS Terms of use
    -   IRR GUI. More work needed to link IRR to RPKI
-   Other works completed:
    - IPv4 Soft-landing changes
    - Finance system integration
    - Automation of billing related activities e.g reminders, etc.
    - Sync of member contacts Integration of MyAFRINIC with new payment system
    - AIS20 support e.g e-voting changes, Meetecho and registration
-   Pending:
    - Member contact verification still under test, to be completed in Q4
    - Auto-renewal of ROAs Q4
    - RDAP alignment with other RIRs
    - Manual update of the WHOIS manual.
-   Future:
    - We anticipate work along policy implementations under discussion
    - New strategic plan will impact the work we do and the way we work.

A WG member pointed out that the stats portal is not linked from the main stats
page and the old one is linked there. AFRINIC team is to look into this and
rectify.

Question was asked why the sparse algorithm was a source of delay for the IPv6
policy implementation.

Staff responded that the different design that they tried did not work due to
the wrong assumptions during the development.

Another question asked was how is `stats.ripe.net` different from
`airrs.afrinic.net`?

Staff response was that its true AIIRS is a re-skin of stats.ripe.net. We came
up with AIIRS because RIPE has an initiative to regionalise their stats
portal. The idea is to offload the requests they are getting from all-over the
world to the RIR from which the user is doing the request. The first step has
been to host the front-end of the ripe stats portal which is the AFRINIC
flavoured version. Second step is to create widgets that people from our region
may find interesting. The latency to fetch info from these should be less than
when fetching from RIPE stats.

## 8. Update from AFRINIC Member Services department on database accuracy

Presented by *James Chirwa*

James presented activities in regards to DB inconsistencies as follows:

Staff noticed some of the resources were not maintained by `AFRINIC-HM-MNT.`
This has been completed in Q1 this year. All resources are now protected by
`AFRINIC-HM-MNT`.

We had members with resources having `org-type: MEMBER-ONLY`. We have worked on
cleaning this and ensuring they have the correct `org-type`.

Previously had some stale test accounts. We no longer do tests on prod. These
have been cleaned out from the DB

Ongoing activities presented were:

-   Orphan objects have been cleaned out.
-   Still have few `domain` objects with trailing dot. Planning activity to
    clean these out.
-   Staff are also working on fixes to prevent child objects from appearing.
    Still under test. We should be in prod soon.
-   Inconsistency between inventory resource files and WHOIS. This is
    historical.  They don't break the integrity of the database, but internally
    MS staff are working on correcting these.
-   `person` objects without email addresses. Historical issue from original
    import in 2005.  Most are legacy and are being worked on. The others will
    be updated after verification with resource holders or updated with an
    AFRINIC placeholder.

WG member asked which record between resource files and WHOIS is authoritative?
Response was that it Depends. AFRINIC have to establish root cause of
inconsistency first to determine the authoritative source.

It was asked whether the internal records, are those about the legacy transfers
or if there is an internal database that is kept in parallel Response was that
yes there is a different record that has to be consistent with the WHOIS.

Another question was about the member only that had resources and whether this
had implications on these members not getting invoiced.

A WG member suggested that it would be good if the WG defines what these
`org-type` values mean so that the public can know what these mean. The
response was that there are more `org-type` values in the DB and there is a
need to have a re-look at this and evaluate which ones are viable and which
ones can be blocked from use.

Member requested AFRINIC to share the definitions on the DBWG mailing list so
they can be discussed.

A clarification was made that members getting billed does not depend on WHOIS
data. MyAFRINIC is linked to our accounting software and AFRINIC does a
reconciliation of all the members. Billing categories are toggled as resources
are added to ensure accurate billing at the end of the year. AFRINIC may also
update the definitions on the WHOIS so that whoever queries the WHOIS can also
get the definitions as well.

***Break: 9 minutes***

## 8. Database security enhancement proposal

Presented by *Simon Seruyinda*

**Background/problem:**

Current update methods present challenges e.g:

- Plain text passwords
- Risk of interception of requests by adversary
- Member sharing of passwords introduces another risk
- The need for traceability on who has done what.

Right now we cannot know exactly especially for auto-dbm/web-update where no
login is involved.

The `changed:` attribute is not reliable as seen on the list. The auto-dbm
email can be from anyone.

We still have some weak algorithms being used in `mntner` objects.

**Stats:**

-   19,325 BCRYPT `mntner` objects:
    - 18,003 auto-generated
    - 1,322 created by object owners
-   151 PGP
-   63 CRYPT
-   2619 MD5
-   7 X-509

BCRYPT largest number is auto-generated by AFRINIC. PGP numbers are still very
low.

**Proposal:**

Slowly deprecate password based authentication and replace it with PGP.  Have
an email whitelist for auto-dbm requests. This can be auto-populated with some
emails we already have in the system such as admin and tech. And going forward,
member has to request to be whitelisted.

**Proposed action plan:**

-   Develop tools to ease creation of PGP keys
-   Develop training material
-   Organize webinars to help members
-   Communicate intention to deprecate password authentication
-   Start with  MD5 & CRYPT members, help them to transition
-   Drop  MD5 & CRYPT support from the database
-   Go to BCRYPT users, support them and help them transition to PGP.
-   The exception is for person objects where where we auto-generate the
    maintainer.  These should have a lifespan of 6 months after which members
    should be able to create their own `mntner` objects
-   We need to enforce the expiry of key-cert objects.
-   Deprecation of the changed attribute. Still be discussed under work items
    here.
-   Explore the use of tokens as an alternative to PGP in the future. These will
    also help us implement WHOIS APIs.
-   We shall maintain a small window of backward compatibility because of the
    auto-generated maintainers in person/role objects

**Questions:**

Why do we have a mandatory `admin-c:` and an optional `mnt-by:` in
`person`/`role`?

The reason why we have the cyclical dependency is because the user has to
create the maintainer first, but they need a `person`/`role` for `admin-c:` and
to create the `person`/`role`, they need a maintainer.

A WG member requested for more information regarding the authentication schemes
such as how many we have per country etc.

It was argued that if we make `admin-c:` optional, it would mean you have no
need to auto-generate the `mntner` object for `person`/`role` and would break
the cyclical dependency.

It was also articulated that PGP is unfriendly to use for the following reasons

1.  The key discovery problem. In order to create the `key-cert` one needs the
`mnt-by:`. This calls for hostmaster intervention or you need BCRYPT first to
create the `key-cert`.
2.  The only thing stored in the database is the key fingerprint so enforcing
expiry may be a problem.
3.  Its hard to automate with PGP. Much more future proof way would be to use
X-509. Current implementation of X-509 in the DB is not good. Should be moved
to a CMS layer or Transport layer. Have an authorizing CA creating single use
short Validity certificates to create and manage objects without worrying about
expiration. X-509 to communicate the public key is a better choice than PGP. We
could use CMS or TLS, but current S/MIME implementation is terrible.

AFRINIC staff clarified that there is no need to modify the `key-cert` if its
made immutable. There was a concern that members would still need to have the
ability to delete them.

Staff suggested the use of the expiry date to automate the clean up process.

Clarification was made that What we store in the `key-cert` is the full public
PGP key in the database. If the key is expired, we still allow the update
currently. We can have a job that disables/delete all the `key-cert`s that are
expired for example and also forbid keys without expiry dates or those with
long expiry dates say 10 years.

The member clarified that they were not suggesting we get rid of PGP, but that
if we are doing a wide outreach effort to move members to use it think PGP is
not widely enough used, not widely understood and almost impossible to build
automation around.

A WG member pointed out that X-509 could be useful for building a web API.
AFRINIC could offer an API to members to update their object, then they could
use X-509 as authentication. Others suggested keeping both PGP and X-509 could
be a good idea.

**Conclusion:**

1. Both X-509 and PGP should stay.
2. We find a solution to creating `key-cert` before doing away with BCRYPT

Next discussion focused on way forward for people updating their auto-generated
maintainers. WG Members were concerned about the growing number of
auto-generated  maintainers.

In order to achieve this, there was need to break the cyclical dependency
between maintainers and `person`/`role`.

A question was asked what the impact would be if `admin-c:` was made optional.

`admin-c` is important if we want to contact the owner of the maintainer. It
was suggested to create `person`/`role` and maintainer in the same transaction.
However, currently the WHOIS will process these in different transactions,
hence not solving the issue.

Regarding the email whitelist proposed in the presentation, after discussion it
was found not to be a viable option to solving the issue as cases of
impersonation would be hard to detect and it would also create long term
operational expenditure.

It was made clear that Instead of creating whitelists, the plan to use crypto
works. If some one finds issue with PGP implementation, we work on those, if
they find issues with X-509 we work on those but we would go with something
that has been proven to work in other areas.

A middle ground then would be to make `admin-c:` optional as a way to remove
the requirement that AFRINIC auto-generates maintainer objects and break remove
the circular dependency so that its possible to create `mntner` object without
a pre-existing `person`/`role` object.

This would help to stop the auto-generation of maintainers that the end user
has no control over.

Then focus on fixing the issues with X-509 and start process of encouraging
people to move to X-509 and PGP. Documentation can be very useful in doing
this.

Members still using existing weak authentication schemes will have to update
their objects themselves. For members using both strong and weak scheme,
communication should be sent to them to advise them against this.

It was suggested that a rule be introduced where the only thing that a
maintainer with weak authentication scheme can do is to update itself or update
other maintainers. In cases where member has both weak and strong
authentication schemes in their maintainer the request should be blocked even
if authentication is based on a strong scheme.

WG requested AFRINIC to start communicating to members with weak schemes.

It was also requested to make key-cert objects immutable so they don't require
a maintainer. This would enable users to create the maintainers using PGP.

AFRINIC team was tasked to discuss this and revert back to the WG.

## 9. Database Working Group work items

1.  Web page for release cycles and forthcoming features and another one for
issues under discussion.

    This was requested on the mailing list.

    Staff suggested to build a page listing features and tentative dates for
    implementation. A sample page was displayed via screen share for feedback
    from WG.

    Members said it's a good start. Should be created and page link shared on
    the WG. WG also requested that over time, they want the database
    development cycle opened up. A table of open work items is a good start
    They also hinted that open-sourcing the code would not be bad. It would
    help us rather than hinder us.

2.  Auto re-ordering of attributes was already done. Not on list of open items.

3.  Maintainer names should end with `-MNT`.

    Staff had not yet implemented this feature because they were not sure
    consensus has been reached.

    It was agreed that this will go back to the list for last call to give
    chance to those not present in the meeting. WG has to think about what
    should be done for maintainers that do not comply with this syntax.

    A request was made to staff to Share the stats again of those `mntner`
    objects that exist without the `-MNT`.

    A WG member suggested that we could also set the rule, that the maintainers
    that are not complying with this syntax not be able to make updates until
    they are rectified. A maintainer with a bad name would only have the
    ability to update the `mnt-by:` of itself.

    The Long term goal is to have all maintainers ending with `-MNT`. Therefore
    step 1 would be to make sure future maintainer creation only ends with
    `-MNT`, then step two would be to deal with existing ones.

    Dealing with existing members however is complex It was concluded to
    discuss it further on the mailing list.

4.  `changed:` attribute unreliable.

    It was raised on the mailing list that the `changed:` attribute is
    unreliable.

    Other RIRs are using last update/created attribute. Shutting down all other
    update options except MyAFRINIC as a way to be able to auto-generate the
    changed attribute was rejected by the WG.

    The WG members realized that the changed attribute can be spoofed. The
    original intention of the changed attribute was for user to record that
    they have made the change together with the date when they have made it.

    The suggestion to use the `mnt-by:` in the changed attribute was ruled out
    as the changed has standard syntax and would be expecting an email address,
    plus in cases where members are sharing a maintainer, the traceability is
    lost. This practice of sharing maintainers is highly discouraged.

    Conclusion was that this needs further discussion on the mailing list.

    Question was raised to find out if current changed attributes will be
    replaced post implementation. Members advised caution when doing this in
    order not to break the tooling that may be built around this.

    It was advised to make sure we are adding the new auto-generated attributes
    and dropping them if they come in the update. Secondly we may also have to
    keep a dummy changed attribute so as not to break peoples tools if we
    remove it completely. We could keep the changed attribute but make it
    optional

    We may therefore proceed as follows:

    -   If an update comes with changed attributes do not fail it, ignore the
        attributes.
    -   Auto-generate created/last modified
    -   At query time, auto-generate a dummy changed attribute (for
        preservation of tooling)
    -   Then completely drop it at next release cycle.

5.  `domain` objects should be limited to minimum allocation size.

    Should we limit it to minimum /48 or should it be tied to minimum in the
    super-block where its from?

    Discussions around this found that the main downside to that would be if we
    end up with a IPv6 transfer policy.  Transfers could be smaller than the
    original allocation.

    As a holder of a /24, one could possibly run the database out of memory by
    creating a domain object for every /48. This means a single actor with a
    large allocation can DDoS the database.  It may not be likely, but it's a
    reason why tying allocation size to specific block would not make more
    sense.

    WG members requested AFRINIC staff for a risk assessment in terms of
    creating many objects.

    In the meantime, the discussions will be continued on the mailing list.

6.  Resource holders without email addresses

    This work item was prioritized by the Member Services department and a full
    list is being processed.

    Majority of these are linked to legacy holders.

    WG requested to be updated once this is done.

7.  `domain` objects ending with a dot.

    It was noted that these relate to the original import at the beginning when
    AFRINIC WHOIS did not have strong business rules.

    These were going to be cleaned out by the end of the month.

    The WG gave the blessing to proceed and remove them.

8.  Complete overhaul of the database manual

    It was agreed that the current documentation is not very good.

    However, its going take time for a new documentation to be made.

    WG also requested to have access to the database schema so that when they
    point out an issue they know what the underlying cause is as well.

    It was suggested to use GitHub to do issue tracking and to have
    conversation on specific issues so that the WG takes more of a
    development-centric approach as opposed to re-inventing the wheel and
    asking AFRINIC staff to create a whole new section of the website.

    There were no objections to this. It was agreed that the co-chairs will
    create a WG project on GitHub and add the list of issues

## 10. Any Other Business

It was agreed that the co-chairs will kick-start the the work on WG procedures
and that google docs will be used for collaboration.

## Appendix A: Action points

-   Upload/share the presentations - *AFRINIC staff*
-   Creation of GitHub page - *Co-chairs*
-   Add the issues to be tracked - *Co-chairs*
-   Impact assessment on impact of creating multiple `domain` objects in one go
    in the DB - *AFRINIC Staff*
-   Discuss internally about providing DB schema in location where its
    accessible to the DBWG - *AFRINIC Staff*
-   Clean-up of `domain` objects with trailing dot - *AFRINIC Staff*
-   Handling of resource holders without email addresses - *AFRINIC Staff*
-   Share the stats again of those `mntner` objects that exist without the
    `-MNT` on the DBWG list - *AFRINIC Staff*
-   Assess if there will be issues for members creating their own `mntner` as
    opposed to auto-generating it and revert back to DBWG - *AFRINIC Staff*

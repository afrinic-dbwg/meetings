# DBWG Meeting Minutes
##### Thursday, 26.05.2022
​
​
### **Attendees**
​
* Ben Maddison, **_Co-chair_**
* Frank Habicht, **_Co-chair_**
* Yogesh Chadee, **_Presenter_**
* Keessun Fokeerah, **Presenter**
* Edwards Mukasa, **Presenter**
* Aaron MAJAMBO, **Presenter**
​
## **Agenda**
#### Last Meeting Follow-up
1. WHOIS _**"mntner"**_ names to end with **_"- MNT"_**.
2. Remove _**"domain"**_ objects which end with a dot.
3. Delete all unreferenced child objects.
4. Resource holders without email addresses.
5. Make **_"changed"_** attribute data reliable.
6. Limit **_"domain"_** objects to minimum allocation size.
7. Complete overhaul of the WHOIS manual.
​
#### Presentation Items
1. RPKI Upgrade
2. MyAFRINIC v2 Project
3. RDAP New Features Enhancements
4. WHOIS API

#### **RPKI**
The following are the main focus areas in the ongoing RPKI upgrade work:
* Enhancements, i.e. auto renewal of ROAs.
* Restful API for performing RPKI operations like Engine activation and Refreshing, ROA creations etc.
* Graphical User Interface

#### **MyAFRINIC v2 Project**
The following are the main focus areas for MyAFRINIC v2 project:
* Improving workflows: For better tracking of resource requests and tickets, easing bulk updates of child objects.
* Security:   Use of maintainer password to manage child objects and 2FA to ensure secure access to user account.
* Ease of compliance checks:  For policies and objects i.e. route 6 objects

#### **RDAP NRO conformance will be achieved by July 2022**

#### **RDAP features enhancements**
   * JSContact
   * RDAP redaction
   * Federated authentication with OpenID Connect
   * Reverse search
   * Partial responses
   * Paging and sorting of search results
   
#### **WHOIS APIs** 
* Querying WHOIS data in JSON format
* Expose WHOIS and RDAP APIs behind a gateway
* Apply the Rate Limiter on gateway level to WHOIS APIs and RDAP interfaces
* WHOIS plain text on port 43 keeps its own rate limiter
​
​
### **Discussion notes**
###### RPKI 
Adding support for delegated mode in our RPKI service was highly welcomed, it was also suggested by BM that we should ensure that we support the publish in parent (hybrid) mode.
This will deliver more value to most members, it takes away the burden of managing a publication server from a member who wish to run his own CA and be in full control of his key material and object issuance.<br>
<br>
BM also suggested that the feature for Auto-renewal of ROAs should be reviewed because it could lead to substantial garbage in the near future if it is totally done without manual intervention.<br>

It was also pointed out that support for Ghostbuster Records (GBR) RFC-6493 in our RPKI service is overdue.
The coding team members working on RPKI system were also advised to actively participate in  SIDR Operations (sidrops).<br>

In conclusion FH suggested that we should  prioritise publish in parent mode even if it is at the expense of dragging the project delivery time.

###### NRTM
BM raised the issue of _**NRTM**_ version 4 draft that’s being adopted in the working group at the IETF. <br>
YC stated that WHOIS core has not been updated for a very long time, so no new NRTM specifications has been adopted. <br>
It was suggested that to start investigating and tracking it as the current mirroring endpoint use NRTM version 3. <br>
<br>
BM said that it was separately implemented at RIPE NCC, APNIC about 20 years ago and nobody bothered to write it down and it’s not fit for purpose.<br>
He also said that it would be nice to see again it on the topic of AFRINIC participation of IETF, as Afrinic is one of the half dozen organizations in the world that really needs to implement support for it when it becomes a thing.<br><br>
​


###### myAfrinic v2 
​
On myAfrinic v2, BM asked was how we are going to deal with maintainers that have only got pgp and or X.509 authentication mechanisms and don’t have passwords. <br>
​
Keesun suggested  to implement it into two phases, the initial phase where access will be given to all password authentications for decrypt and the usual password way, and deal with pgp and the X.509 through the email or through the WHOIS interface because it’s a small portion of our members(less than 10 ) who are impacted by that, and in the next integration include pgp port and having them on myAfrinic.<br>

It was also stated that members with specific requirements or specific ways that they have set up their maintainers or their objects in the past, will be dealt with on a one-on-one basis to see how to accommodate them and make it as seamless as possible.
​
BM stated that moving away from password authentication without breaking the RPSLs authentication model in the process.<br>
He also said that in the way that permissions work on myAfrinic today version 1, is kind of tightened in a certain way that admin-c and tech-c attributes in the autnum object.<br>
So if you go and add contact in myAfrinic as a tech contact, that winds up being published in the autnum.<br>
In the tech-c and in the same advent and it kind of overwrites whatever data was in the object previously. <br>
BM said thant that is very unexpected and broken behavior and he find himself on a semi-regular basis to go in regularly and manually update the autnum to remove that noise. <br>
It would be really nice if that wasn’t the case and more generally.
​
###### WHOIS

FH brought forward the idea of making the phone attribute of person object optional as it is being discussed in RIPE and asked if we should not bring that discussion in the mailing list.<br>
BM stated that though it’s a good idea in theory, it’s not a good idea in practice, because unlike the allocations objects, person object is defined in an RFC and there is nowhere in IETF at the moment to update that in that RFC and that there are several examples where the RIPE implementation deviates from the RPSL RFCs and speaking as someone who has implemented RPSL RFCs, that looks like hell and we shouldn’t do more of that unless we do it through the standard processes<br>
<br>

BM mentionned that everything apart the organization object should be writable by the maintainer of the ordonnance. <br>
He said that it’s not currently the case and causes operational problems. That was his feature request for the WHOIS side.
<br>

​
On the confirmation to be done on mnt-route and mnt-lower BM said that he didn’t realize that  mnt-lower had been deprecated and that it sounds broken to him.<br>
<br>
​
The are some issues made by mnt-lower and mnt-route of a fundamentally different thing that give you access to different things.<br>
​
BM sated that the deprecation of mnt-lower is going to cause issues and suggested that the solution could be that the org field of the autnum can only be changed by the mnt-lower of the as-block that the autnum comes from and the actual resource holder should be (made/mnt-by) the autnum itself
​
It was suggested to move the discussion to the mailing list, this being a long discussion.
​

### **Action Items**
1. Document the 2 pending work items on GitHub:
    * Make the WHOIS `changed` attribute more reliable.
    * Limit the WHOIS `domain` to minimum allocation size.
2. AFRINIC staff to analyse the following suggestions by the DBWG and report to the group in the next few weeks:

    * Add support for delegated hybrid mode (Publish in Parent model) i.e. provide a publication server where members running delegated mode can publish their signed objects.
    * For ROA renewal, pre-notification and active intervention by users (instead of making the entire process automatic) will help to prevent garbage in the near future. Even if support for auto-renewal is desired by some end users, do not make it the default behaviour.
    * RPKI Ghostbuster Records (GBR) was published as an RFC-6493 in February 2012; support for this is really overdue.
    * An NRTM version 4 draft is being adopted in the working group at the IETF. Update AFRINIC WHOIS core with the new specifications.
    * Have an internal discussion about supporting Key Cert for BGPsec 
    * From the perspective of prioritization, the most important action item is to ensure that the delegated hybrid mode works.
3. AFRINIC staff on the team working on RPKI are highly recommended to actively participate in  SIDR Operations (sidrops).
4. Document the mapping for the JSON representation of the WHOIS APIs. Publish the mapping document on the mailing list and online so that people can provide feedback if anything needs to be changed or added.
5. Add maintainer password on MyAfrinic v2 to make authorization consistent across all WHOIS update endpoints. Also remember to address the use case where maintainers that have only got pgp and or X.509 authentication mechanisms and don’t have passwords.
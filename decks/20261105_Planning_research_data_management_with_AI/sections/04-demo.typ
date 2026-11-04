// ── 4 · Live demo 1: the conversation — 10 min ─────────────────────────────
// Persona: postdoc, Research Council of Finland application, survey + interview
// data, a Master's student involved. Show: intake where the assistant asks YOU
// questions; a missing-info follow-up + the confirmation step; the sensitive-
// topic moment routed to an Aalto service. Backup recording: webinar project.
#import "../../../theme/aalto.typ": *
#import "../figs.typ": *

= Demo: using *Aalto.fi ChatBot*

== Scenario: A Postdoc writing a RCF application

#v(-1em)
#promptline(raw("# SYSTEM PROMPT — Aalto Data Management Assistant (APL-aligned)
..."))
#answerline([You’ve provided a detailed system prompt for an Aalto Data Management Assistant. How would you like me to help you now — for example, do you want help with a specific data management plan, feedback on this prompt, or guidance on Aalto research data services? I am an AI assistant for the Aalto University website (aalto.fi) and can help you find and interpret Aalto-specific information in Finnish, Swedish, or English.])
#promptline(
    text(size: 1em)[I'm a postdoc at Aalto and I'm writing the data management part of a Research Council of Finland application, and the deadline is in three weeks. The project is a study-advice app for university students: we'll pilot it with about 200 students at a partner university here in Helsinki next spring, and do two short interviews with a subset. The app logs their answers, their grades and how often they use it, and the interviews will be recorded with names and email addresses collected so we can send a 20€ gift card. Some interview questions touch on wellbeing and whether participants use ADHD medication, because that affects study habits. A small Finnish edtech company built the app and will co-develop it; they want access to the data for their product roadmap and said an anonymized version is fine, we have not signed anything yet. My master's student will do most of the coding and the analysis. I also have pilot data from last year that I already put in a OneDrive folder for a collaborator at a university in Brazil. Do I need a DMP, and where should this data actually live?])

#answerline(text(size: 0.9em)[Aalto does require a Data Management Plan (DMP) for a Research Council of Finland–funded project, and you are expected to plan data handling for the whole lifecycle of the project, including sensitive personal data such as health‑related information and interview recordings. Aalto recommends using the Aalto Project List Data Management Plan tool to create the DMP, and the plan should be treated as a living document that is created at the start of the project and updated as the work progresses. (Source: #link("https://www.aalto.fi/en/services/data-management-plan-dmp")[*services/data-management-plan-dmp*])

For storing and processing personal/sensitive/confidential data (e.g. names, emails, wellbeing information, ADHD medication, app logs linked to individuals), Aalto in general recommends Aalto network drives and Aalto’s own storage solutions, and for shared work with your supervisor or project team, OneDrive for Business or Microsoft Teams can be used, following Aalto IT instructions. Secret data can be stored with strong encryption on OneDrive, and personal/confidential data are allowed on OneDrive, Teams and (with strict access control) some other cloud services, provided that access rights are carefully restricted to authorised persons and public/open links are not used. (Source: #link("https://www.aalto.fi/en/services/frequently-asked-questions-faq")[*services/frequently-asked-questions-faq*]; #link("https://www.aalto.fi/en/teaching-and-learning/data-protection-at-different-stages-of-thesis-work")[*teaching-and-learning/data-protection-at-different-stages-of-thesis-work*]; #link("https://www.aalto.fi/en/services/managing-your-data-in-doctoral-research")[*services/managing-your-data-in-doctoral-research*])

Because your dataset includes special categories of personal data (health‑related wellbeing and ADHD medication information) and other sensitive personal data, you should consider Aalto’s secure solutions for data with high security requirements. Aalto provides SECWORK for in‑house secure, strongly encrypted data storage and SECDATA as a secure operating environment for processing data that needs a highly secure, controlled and restricted environment (originally designed for health and social data and other sensitive research data). These services are set up with Aalto Cyber Security / SECDATA support and are suitable when ordinary cloud storage is not sufficient for the sensitivity level. (Source: #link("https://www.aalto.fi/en/services/managing-your-data-in-doctoral-research")[*services/managing-your-data-in-doctoral-research*]; #link("https://www.aalto.fi/en/services/secure-operating-environment-for-sensitive-data")[*services/secure-operating-environment-for-sensitive-data*])

For anonymisation and GDPR compliance, Aalto emphasises minimising the use of personal data, planning personal‑data handling before starting the research, and anonymising personal data before publishing or sharing to enable more flexible reuse. Even anonymisation itself is considered processing of personal data, so consent and a data protection notice are required. Once material is truly anonymised, it no longer contains personal data and can be handled more freely, but producing fully anonymous material can be difficult, so you should follow recognised anonymisation and minimisation guidelines. (Source: #link("https://www.aalto.fi/en/services/frequently-asked-questions-faq")[*services/frequently-asked-questions-faq*]; #link("https://www.aalto.fi/en/teaching-and-learning/data-protection-at-different-stages-of-thesis-work")[*teaching-and-learning/data-protection-at-different-stages-of-thesis-work*])

When sharing sensitive or confidential data with collaborators (e.g. the Finnish edtech company and the Brazilian partner), Aalto recommends using Microsoft Teams or Eduuni for collaboration with confidential data, and otherwise only IT systems that are on the Cyber Security team’s list of permitted systems for classified information. Access must be restricted only to people involved in the project, email addresses must be carefully verified, and you should avoid public or “anyone with the link” sharing. Instead of sending open links, collaborators should log in to the shared folder or workspace. If you need alternative solutions or if a system is not on the permitted list, you are instructed to contact servicedesk\@aalto.fi for safety advice and security procedures. (Source: #link("https://www.aalto.fi/en/services/frequently-asked-questions-faq")[*services/frequently-asked-questions-faq*])

For existing pilot data already stored in OneDrive, OneDrive for Business is an Aalto‑approved service for personal/confidential data, and secret data can be stored there with strong encryption. You should ensure that access rights are limited strictly to authorised project members, that no public/open links are used, and that handling of this existing data is brought under the same DMP and security procedures as the new project data. If the sensitivity of the pilot data (e.g. detailed health information) warrants a more secure environment, you can migrate it to SECWORK or SECDATA in consultation with Aalto Cyber Security. (Source: #link("https://www.aalto.fi/en/services/frequently-asked-questions-faq")[*
services/frequently-asked-questions-faq*]; #link("https://www.aalto.fi/en/services/managing-your-data-in-doctoral-research")[*services/managing-your-data-in-doctoral-research*]; #link("https://www.aalto.fi/en/services/secure-operating-environment-for-sensitive-data")[*services/secure-operating-environment-for-sensitive-data*])])

= Demo: using *GPT 6.1 Terra*

== Scenario: A Postdoc writing a RCF application
#v(-1em)
#promptline(raw("# SYSTEM PROMPT — Aalto Data Management Assistant (APL-aligned)
..."))
#answerline([Hi — I can help you plan practical data management choices and connect you with Aalto services. The official DMP is completed in APL; I’ll ask a few quick questions and then provide next steps and draft notes you can paste into APL.

1. Are you *Aalto staff* or a *student*? If a student, are you employed by Aalto?
2. Is this a *thesis, research project, consortium, or industry collaboration*? What is the rough timeline?
3. What kinds of data will you use or produce—for example, measurements, interviews or surveys, images, audio or video, code, simulations, or third-party datasets?])
#promptline(
    text(size: 0.9em)[I'm a postdoc at Aalto and I'm writing the data management part of a Research Council of Finland application, and the deadline is in three weeks. The project is a study-advice app for university students: we'll pilot it with about 200 students at a partner university here in Helsinki next spring, and do two short interviews with a subset. The app logs their answers, their grades and how often they use it, and the interviews will be recorded with names and email addresses collected so we can send a 20€ gift card. Some interview questions touch on wellbeing and whether participants use ADHD medication, because that affects study habits. A small Finnish edtech company built the app and will co-develop it; they want access to the data for their product roadmap and said an anonymized version is fine, we have not signed anything yet. My master's student will do most of the coding and the analysis. I also have pilot data from last year that I already put in a OneDrive folder for a collaborator at a university in Brazil. Do I need a DMP, and where should this data actually live?])

#answerline([Yes. *Plan for both the funder’s application requirements and the official project DMP in Aalto Project List (APL).* Check the current Research Council of Finland call instructions for exactly what must be submitted and when. The PI is responsible for the APL DMP and can delegate work through APL’s team-member function.

Your data needs *high-security handling*: grades and app usage may identify students, and information about ADHD medication is health data. Names, contact details and interview recordings add further risk. Please don’t share participant details or records here.

Where should the data live?

Do not assume that ordinary OneDrive or a general collaboration folder is suitable. Ask *Aalto Data Support* (#link("researchdata@aalto.fi")) and *IT* (#link("servicedesk@aalto.fi")) urgently to assess the data and select approved storage *and computing* for each dataset. Depending on their assessment, options may include Aalto Secwork, SecData or CSC Sensitive Data Services. Confirm that the chosen environment also supports access for your master’s student and the partner university.

Act now, given the three-week deadline

- *Contact Aalto’s DPO* (#link("dpo@aalto.fi")) and Data Support about the existing pilot data in OneDrive and the collaborator in Brazil. Describe what was shared, where it is stored and who can access it; ask them to assess the international transfer and any corrective action. *Don’t delete or move it before getting advice*, as they may need information about what happened.
- *Contact Data Support and the Research Ethics Committee* about privacy documentation, whether a data protection impact assessment is needed, and whether ethical pre-review is required *before next spring’s collection*. Verify current submission lead times with the committee.
- *Do not provide the company with participant data yet.* Ask your school’s [legal counsel](#link("https://www.aalto.fi/en/services/legal-services")) to review the collaboration, access purposes and data terms. “Anonymized” should not be assumed safe without assessment; the company’s product-roadmap use needs particular attention.
- Start an inventory separating *app logs and grades, interview recordings/transcripts, and gift-card contact details*. Note who needs access and whether medication information is essential to collect.

Three quick questions

1. Does last year’s pilot data in OneDrive contain identifiable information or health-related answers, and can the Brazil collaborator currently access it?
2. Is your master’s student employed by Aalto, and will researchers at the partner university need access to identifiable data?
3. Will the company host or operate the app during the pilot, or only develop it?

These are *draft planning notes, not an official DMP*. Links, contacts and requirements should be verified with the relevant Aalto service and current funder call; I can’t check them live.])
#takeaway[
  The ChatBot answered at once. Terra asks first: the follow-up questions are the
  intake, and it confirms what it heard before it writes anything down.
]
#v(0.5em)
#promptline(
    text(size: 1em)[1. No, it does not contain and the Brazil collaborator has access it; 2. Yes and yes; 3) The company is only responsible for developing it])

#answerline([Thanks. *Just to confirm:*

- Last year’s pilot dataset contains no identifiable or health-related data, as far as you know, and the Brazil collaborator still has access.
- Your master’s student is employed by Aalto; researchers at the partner university will need access to identifiable pilot data.
- The company develops the app but does not host or operate it. Its requested access to data remains to be agreed.

Does that sound right? In particular, whether the earlier data is truly anonymous should be checked before deciding whether its current sharing arrangement is appropriate.])

#promptline(
    text(size: 1em)[Yes])

#answerline([A) What I understood

- You are an Aalto postdoc preparing a Research Council of Finland application due in three weeks. The pilot is planned for next spring.
- The app will collect identifiable student data, including grades, usage and answers about ADHD medication; interviews will be recorded.
- Your Aalto-employed master’s student and partner-university researchers need access. The company develops the app and wants data for its product roadmap, but no agreement is signed.
- Last year’s pilot data is in OneDrive and accessible to a collaborator in Brazil. You believe it contains neither identifiable nor health data; whether it is truly anonymous needs checking.

B) Top recommendations

- *Check the current funder call now* for what data-management information is required in the application and when a DMP must be submitted. The project’s official DMP is completed and maintained in [APL](https://aalto.lightning.force.com/lightning/page/home).
- *Treat the new pilot as potentially high-risk personal-data processing.* Medication information is health data. Minimize collection and document who needs access.
- *Do not select OneDrive as the new pilot’s storage by default.* Ask Aalto Data Support and IT to assess approved storage and computing, including partner-university access. Secwork, SecData or CSC Sensitive Data Services may be options, subject to their approval for this use.
- *Keep the company’s requested access on hold* until legal and data-protection advice addresses its product-roadmap purpose, agreements and whether any proposed dataset is genuinely anonymous.
- *Check ethics and privacy requirements before collection*, including whether ethical pre-review and a data protection impact assessment are needed.
- Ask Data Support to review the earlier OneDrive dataset and Brazil access. If the data is genuinely anonymous, personal-data transfer rules may not apply; don’t assume that without an assessment.

C) Next actions

- [ ] *Check the application instructions* | Meet the three-week deadline | Funder call and Aalto Research Services | Prepare the call identifier and requested data-management sections.
- [ ] *Complete and maintain the DMP in APL* | Record the project’s data-management decisions | PI and project team | Prepare the data-type inventory below. The PI can delegate APL work using the team-member function.
- [ ] *Request a storage and computing assessment* | Ensure suitable security and access for both universities | `researchdata@aalto.fi`, `servicedesk@aalto.fi` | Prepare data types, estimated size, access needs and the app’s hosting arrangements.
- [ ] *Request privacy and ethics advice* | Address health data, participant information and any review needed before collection | `dpo@aalto.fi`, `researchdata@aalto.fi`, Research Ethics Committee | Prepare the study design, interview topics, recruitment and intended data uses.
- [ ] *Discuss company access and agreements* | Clarify permitted uses, responsibilities and sharing | [Aalto Legal Services](https://www.aalto.fi/en/services/legal-services) | Prepare the company’s role, proposed product-roadmap use and any draft terms.
- [ ] *Review the previous pilot and Brazil access* | Assess anonymity and whether current sharing is appropriate | Data Support; DPO or legal counsel if personal data may be involved | Prepare a description of the fields, access and original sharing arrangements.
- [ ] *Assign responsibilities* | Keep access, documentation and APL entries current | PI and project team | Decide who manages access, onboarding, documentation and updates; estimate storage, compute and staff costs.

D) Service contacts

- *Aalto Data Support:* #link("researchdata@aalto.fi")
- *Privacy / DPO:* #link("dpo@aalto.fi")
- *IT storage and computing support:* #link("servicedesk@aalto.fi")
- *Research Ethics Committee:* #link("annukka.jyrama@aalto.fi")
- *Research agreements:* [Aalto Legal Services](https://www.aalto.fi/en/services/legal-services)

E) APL-ready notes — draft planning text

> These are draft planning notes to help you fill APL. They are *not an official DMP*.

*1. App pilot data*  
- *Description:* Student answers, grades and usage logs from approximately 200 participants. Some answers may concern wellbeing and ADHD medication.
- *Ethical/legal:* Identifiable personal data, potentially including health data. Privacy requirements, participant information, ethics review and partner access require assessment.
- *High-security-only storage:* To be confirmed with Data Support and IT; plan for high-security handling.
- *Project storage:* Approved storage and computing service *to be selected*.
- *Sharing:* Repository and access model undecided. Assess whether processed data can be shared safely and lawfully; review disclosure risk, agreements and funder requirements first.

*2. Interview recordings and processed transcripts*  
- *Description:* Two recorded interviews with a subset of participants, potentially discussing wellbeing and medication.
- *Ethical/legal:* Identifiable and potentially health-related data; review privacy and ethics requirements before collection.
- *High-security-only storage:* To be confirmed; plan for high-security handling.
- *Project storage:* Approved service *to be selected*.
- *Sharing:* Do not assume recordings or transcripts can be openly shared. Consult Data Support about safe processing and, if appropriate, restricted-access repositories.

*3. Gift-card contact details*  
- *Description:* Names and email addresses collected to provide €20 gift cards.
- *Ethical/legal:* Personal data; document its purpose, access and appropriate retention with privacy support.
- *High-security-only storage:* To be assessed in the context of links to the other data.
- *Project storage:* Approved service *to be selected*.
- *Sharing:* Not intended for publication; confirm appropriate disposal arrangements.

*4. Earlier pilot data*  
- *Description:* Previous pilot dataset currently shared through OneDrive with a collaborator in Brazil. Reported not to contain identifiable or health data.
- *Ethical/legal:* Anonymity and applicable sharing arrangements require review.
- *High-security-only storage:* *Undetermined* pending classification.
- *Project storage:* Current OneDrive arrangement to be reviewed.
- *Sharing:* Assess anonymity, permissions and repository suitability before further sharing.

*5. App code and analysis code*  
- *Description:* Application development and analysis code produced by the project and company.
- *Ethical/legal:* Ownership, confidentiality, licensing and any embedded credentials or data require review.
- *High-security-only storage:* Depends on contents; assess with IT and legal counsel.
- *Project storage:* Version-control service *to be selected*.
- *Sharing:* Consider publication only after checking agreements, ownership and contents.

I can’t verify current policies or contacts live; please confirm them with the listed services and the current funder call.])

#credit[Live in ai.aalto.fi · RDMASSISTANT.md v1.2]

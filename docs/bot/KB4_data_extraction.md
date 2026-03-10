---
title: "KB4: DATA EXTRACTION"
author: "Luca Neri, MD, PhD"
date: "2026-03-10"
---

## INPUT:
Use Deliverable D4 from Step 3 as the set of provisionally selected studies for data extraction. Retrieve available article metadata, abstracts, and full texts when available.
## PROCESS: 
Parse each selected study into a discrete record and extract key study elements and bibliographic metadata. Extract only information explicitly reported in the retrieved source material. If a required data element is not available, mark it as Not Available rather than inferring it. When relevant, indicate the source basis (for example: abstract, full text, supplementary appendix, or registry record).
1) Identification and citation
* Citation (Vancouver style), PMID, DOI
2) General study information
* Study title, Authors, Year, Journal, Country, setting
3) Methods
* Study design, Sample size, Key eligibility criteria, Intervention / exposure, Comparator, Follow-up duration, Outcomes measured, Statistical analysis
4) Results
* Effect estimates for each primary and secondary outcome, with absolute numbers, confidence intervals, p-values, and timepoints when available
* If a study reports multiple outcomes or endpoints, record them in separate rows in the results table
5) Additional study notes
* Funding / sponsor
* Conflicts of interest
* Key limitations
* High-level qualitative risk-of-bias notes, only when sufficient methodological detail is available
* When appropriate, provide a provisional qualitative certainty judgment using GRADE domains, explicitly labeled as adapted for narrative synthesis rather than a formal GRADE assessment
6) Figures and tables
* If full text is available and figures or tables are accessible, summarize only their explicitly reported content in text
DELIVERABLES: 
Generate the tables described below by appending all selected studies sequentially. Make sure to keep consistent UNIQUE_ID in each table to ensure consistent identification of papers across tables. 
1) Table 1. Study Identification: 
UNIQUE_ID | Citation (Vancouver style) | PMID | DOI
2) Table 2. Study General Information
UNIQUE_ID | Title | First_Author | Year | Journal | Country | Setting
3) Table 3. Methods
UNIQUE_ID | Design | Sample_Size | Key_Eligibility_Criteria | Intervention_or_Exposure | Comparator_or_groups | Follow_Up_Duration | Outcomes | Statistical_Strategy | Source_Basis
4) Table 4. Results
UNIQUE_ID | Outcome | Endpoint_or_Timepoint | Comparator_or_groups | Effect_Estimate | Absolute_Numbers | Confidence_Interval | P_Value | Notes | Source_Basis
5) Table 5. Bias and Study Appraisal
UNIQUE_ID | Funding_or_Sponsor | COI | Key_Limitations | Provisional_Overall_Risk_of_Bias | Provisional_Certainty_Judgment| Source Basis



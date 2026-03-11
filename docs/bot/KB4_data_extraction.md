---
title: "KB4: DATA EXTRACTION"
author: "Luca Neri, MD, PhD"
date: "2026-02-27"
---

DATA EXTRACTION
INPUT: Use the list of selected articles from step 3 to retrieve them. 
PROCESS: Parse each article into discrete records and extract key study elements and bibliographic metadata 
1)	Citation (Vancouver style) + PMID + DOI	
2)	Study title, authors, year, journal, Country/setting, 
3)	Methods: design, sample size, key eligibility criteria, Intervention/exposure; comparator; follow-up duration, outcomes measured, statistical analysis
4)	Results: effect estimates for each primary and secondary outcome with absolute numbers and confidence intervals when available; 
5)	If figures/tables are present, summarize their content in text 
6)	Risk-of-bias notes; funding/conflicts; key limitations.
7)	Qualitative risk-of-bias commentary per study type (e.g., RoB 2 for RCTs, ROBINS-I for non-randomized, QUADAS-2 for diagnostic accuracy) where feasible.
8)	Where appropriate, provide a high-level, qualitative certainty of evidence judgment using GRADE domains (risk of bias, inconsistency, indirectness, imprecision, publication bias). Be explicit that this is adapted for a narrative synthesis.
DELIVERABLES: 
Generate the tables described below by appending all selected studies sequentially. Make sure to keep consistent coding in each table to ensure consistent identification of papers across tables. 
1)	Table 1. Study Identification: UNIQUE_ID|Citation(Vancouver Style)|PMID|DOI
2)	Table 2. Study General Information: UNIQUE_ID|Title|First_Author|Year|Journal|Country|Setting
3)	Table 3. Methods: UNIQUE_ID|design|sample size|key eligibility criteria|Intervention/exposure|comparator|follow-up duration|outcomes|Statistical Strategy
4)	Table 4. Results: UNIQUE_ID|Effect Estimate (if a study has multiple endpoints, generate 1 row for each endpoint); 
5)	Table 5. Risk of bias: UNIQUE_ID|COI|Limitations|Overall Risk of Bias|GRADE Score


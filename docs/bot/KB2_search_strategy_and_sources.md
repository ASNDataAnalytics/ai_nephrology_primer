---
title: "KB2: SEARCH STRATEGY AND SOURCES"
author: "Luca Neri, MD, PhD"
date: "2026-03-10"
---

## Purpose:
* Define and execute a transparent, documented, and reproducible search strategy based on the requirements established in KB1.
## INPUT:
* Use the review requirements from Phase 1 to inform the search strategy, including the research question, key concepts, eligible study designs, date limits, and language restrictions.
## PROCESS:
* Perform a systematic literature search as follows:
1) Define the sources.
* Use PubMed as the default primary source for literature searching. Always perform the search by calling the PubMed API as per KB8.
* Use OpenAlex only when explicitly requested by the user (refer to KB9).
2) Build and document the search strategy for each source using these components:
a. Core concepts: controlled vocabulary and text words for the main constructs.
b. Broadeners: synonyms, spelling variants, and related terms.
c. Limiters: study design filters, humans, age bands, date range, language limits, or other justified constraints.
3) Adapt the search syntax to the source.
* Use source-appropriate field tags, controlled vocabulary, and filters.
* Do not reuse a search string across sources without adapting it to the database syntax and indexing structure.
* Always present the final search string to the use and ask for confirmation before executing it.
4) Document the search execution.
* Record the exact search strings used.
* Record the run date for each search.
* Record the number of hits retrieved for each search.
* Briefly document major refinements made to the search strategy and the reason for each refinement.
5) Prepare the candidate study list.
* Compile all retrieved candidate records for screening.
* Deduplicate records across sources when applicable.
* Retain source identifiers such as PMID, DOI, or title + year + first author when no unique identifier is available.

Example search pattern (illustrative only; adapt to the question type and source syntax):
("Condition"[MeSH] OR condition*[tiab]) AND ("Intervention"[MeSH] OR intervention*[tiab]) AND (random* OR cohort OR "systematic review"[tiab]) AND ("2015/01/01"[Date - Publication] : "3000"[Date - Publication])
DELIVERABLES:
1) Source & Search Strategy Document (D1), including selected sources and search logic.
2) Search Execution Log (D2), including exact strings, run dates, hit counts, and major refinements.
3) Candidate Study Register (D3), including retrieved records with identifiers and deduplication status, for use in Phase 3 screening.


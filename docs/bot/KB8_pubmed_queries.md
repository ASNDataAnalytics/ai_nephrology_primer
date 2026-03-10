---
title: "KB8: PUBMED QUERIES"
author: "Luca Neri, MD, PhD"
date: "2026-03-10"
---

## SCOPE:
This document provides guidance for PubMed searches through the PubMed API.
## TRIGGER RULES
* Use the PubMed Action automatically for every literature searches.
* Call the PubMed Action endpoints in a chain: esearchPubMed → esummaryPubMed → optionally efetchPubMed.
## CHAINING PLAN
1. Build query
* Convert the search concepts developed in KB2 into a PubMed query.
* Date range: use datetype=pdat&mindate=YYYY/MM/DD&maxdate=YYYY/MM/DD.
* Title/abstract targeting: append [tiab] as needed.
* Prefer sort=pub+date when the user asks for “latest” or “newest.”
2. Search
* Call esearchPubMed with:
db=pubmed, term=..., retmode=json, retmax=<N>, retstart=<offset>, sort=<as above>, datetype/mindate/maxdate as needed, tool=<toolname>, email=<email>.
3. Summarize
* Take the returned idlist (chunk ≤200) and call esummaryPubMed to obtain titles, journals, years, authors, and DOIs.
4. Abstracts (optional)
* When the workflow requires abstracts, call efetchPubMed with rettype=abstract&retmode=text.
5. Output
* Present a neat table and a transparent search count summary.
* Include PubMed links for retrieved PMIDs when available.
6. Pagination
* If esearchresult.count > retmax, report how many more results are available and pause for user confirmation before fetching the next page (increment retstart).
7. Etiquette
* Always include tool and email; if an api_key is configured, include it.
* Back off if rate-limited and explain.
## GUARDRAILS
* Never fabricate PMIDs or DOIs.
* Do not infer study methods, results, or eligibility details from esummary output alone.

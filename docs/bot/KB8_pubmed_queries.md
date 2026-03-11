---
title: "KB8: PUBMED QUERIES"
author: "Luca Neri, MD, PhD"
date: "2026-02-27"
---

PUBMED
Call the PubMed Action endpoints in a chain for every literature search: `esearchPubMed` → `esummaryPubMed` → optionally `efetchPubMed`.
When to use the Action (trigger rules)
Use the PubMed Action automatically for all literature searches
Chaining plan
1.	Build query
o	Convert user text developed as per step 2 into a PubMed term.
o	Date range: use `datetype=pdat&mindate=YYYY/MM/DD&maxdate=YYYY/MM/DD`
o	Title/abstract targeting: append [tiab] as needed.
o	Prefer sort=pub+date when user asks for “latest/newest.”
2.	Search — call esearchPubMed with:
`db=pubmed, term=..., retmode=json, retmax=<N>, retstart=<offset>, sort=<as above>, datetype/mindate/maxdate as needed, tool=<toolname>, email=<email>.`
3.	Summarize — take the returned idlist (chunk ≤200) and call esummaryPubMed to get titles/journals/years/authors/DOIs.
4.	Abstracts (optional) — When process requires to extract abstracts, call efetchPubMed with rettype=abstract&retmode=text.
5.	Output — present a neat table and a PRISMA-style count summary. Always include PubMed links: https://pubmed.ncbi.nlm.nih.gov/{PMID}/.
6.	Pagination — if esearchresult.count > retmax, tell the user how many more are available and offer to fetch the next page (increment retstart).
7.	Etiquette — always include tool and email; if an api_key is configured, include it. Back off if rate-limited and explain.
Guardrails
Never fabricate PMIDs or DOIs.

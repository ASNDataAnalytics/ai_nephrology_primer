---
title: "KB9: OpenAlex"
author: "Luca Neri, MD, PhD"
date: "2026-02-27"
---

OpenAlex
Use the OpenAlex Action as a complementary source to PubMed. Favor OpenAlex when:
- You need broader, cross-disciplinary coverage beyond strictly biomedical journals.
- You want citation counts, topics, or institution/author-level patterns.
- PubMed returns sparse or no results, or the user explicitly requests OpenAlex.

When to use the Action (trigger rules)
- Use OpenAlex in addition to PubMed when building a comprehensive narrative review on a topic.
- Prefer OpenAlex when the user asks about:
  • “most cited”, “influential” or “high impact” papers
  • works by a specific author or institution
  • topic trends, topics by year, or aggregated views (via group_by)
- Do NOT replace PubMed for core clinical trial discovery; treat OpenAlex as complementary.

Chaining plan
1. Build query
   - Derive a focused query string from the user’s question.
   - Use `search` for free-text concepts (e.g. “potassium monitoring hemodialysis”).
   - Use `filter` for structure:
     • publication_year:YYYY-YYYY for ranges (e.g. last 5–10 years)
     • is_oa:true if open access is important
     • authorships.author.id:AUTHOR_ID or authorships.institutions.id:INSTITUTION_ID
   - For “recent” evidence, restrict `publication_year` to an explicit range and state it in the methods.

2. Call the works endpoint (searchWorks)
   - Use either:
     • search=<query string>, OR
     • filter=<filter expression>
     (Only combine them when clearly needed.)
   - Use modest page size: per-page=10–20 (never more than 50 in this environment).
   - Always set a small field list with:
     select=id,display_name,publication_year,doi,primary_location,cited_by_count
     to keep responses under ChatGPT context limits.
   - For “most cited” results, use sort=cited_by_count:desc and note this in the methods.

3. Sampling large literatures
   - If the topic clearly has thousands of works and the goal is a representative sample, use:
     sample=<N> (e.g. 50–200) and optionally seed=<integer> for reproducibility.
   - Do NOT simulate randomness by jumping to arbitrary page numbers.
   - If more breadth is needed, run a small number of additional sample queries with different seeds and concept refinements, then conceptually “deduplicate” when synthesizing (do NOT list every work).

4. Summarize and integrate
   - From OpenAlex results, typically extract a manageable set (e.g. 10–20 key works).
   - For each key work, capture: title, year, journal/source, DOI (if present), cited_by_count, and a 1–2 sentence summary.
   - Use OpenAlex meta.count to describe scope: e.g. “OpenAlex lists ~1,200 works; I screened the first 50 by relevance and present 15 key studies.”
   - When both PubMed and OpenAlex contain the same study, prefer PubMed for clinical details but OpenAlex for citation and topic context.

5. Pagination and limits
   - Only paginate (page=2,3,…) when the user explicitly wants more of the same type of result.
   - Avoid deep pagination or very large per-page values; prioritize relevance and diversity over sheer volume.
   - If the total result set is very large, narrow with filters (date range, study type if available, topic terms) and explain how you constrained the search.

Guardrails for OpenAlex
- Never fabricate DOIs, OpenAlex IDs, citation counts, or journal names.
- Always indicate that OpenAlex results are a curated subset of a larger corpus, not an exhaustive enumeration.
- If a query would return too many records for this environment, explicitly narrow it (e.g. by year range or outcome) and describe that choice in the methods section.
- Respect rate limits and be conservative in the number of repeated calls within a single answer.


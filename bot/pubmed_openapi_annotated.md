---
title: "PubMed OpenAPI: Annotated"
author: "Luca Neri, MD, PhD"
date: "2026-02-27"
---

PubMed E-utilities API Specification (OpenAPI)
Plain-language explanation and annotated YAML

1) What this file is (in plain language)
This document is a “recipe” that tells software how to talk to PubMed (a large database of medical articles) using NCBI’s official web service called “E-utilities”.
It does not contain medical content itself. Instead, it describes three web requests your software can make to PubMed and what information you can expect back.
Think of it like three buttons:
• Search: find articles that match your keywords and get back a list of PubMed IDs (PMIDs).
• Summary: for a set of PMIDs, get basic article details (title, authors, journal, date, etc.).
• Fetch: for a set of PMIDs, download the abstract (or other formats) as text or XML.
The file is written in a standard format called OpenAPI. OpenAPI helps computers auto-generate documentation, tests, or even ready-to-use code to call these endpoints.

2) Annotated OpenAPI YAML (comments explain each step)

```{yaml}
openapi: 3.1.0  # OpenAPI specification version used by this file.
info:           # Basic metadata (name/version/description) for documentation and tooling.
  title: PubMed E-utilities       # Human-friendly title of this API description.
  version: "1.0"                 # Version of this OpenAPI document (not PubMed itself).
  description: >                 # Longer explanation shown in generated docs.
    Search PubMed and fetch details/abstracts using NCBI E-utilities.

servers:                          # Base URL(s) where the endpoints live.
  - url: https://eutils.ncbi.nlm.nih.gov/entrez/eutils
    # All paths below are appended to this base URL.

paths:                            # List of available endpoints (URLs) and how to call them.

  /esearch.fcgi:                  # ESearch = “search PubMed and return IDs”.
    get:                          # Called with HTTP GET (parameters go in the URL).
      operationId: esearchPubMed  # Unique name used by client generators.
      summary: Search PubMed      # Short label shown in docs.

      parameters:                 # Query parameters accepted by this endpoint.
        - in: query
          name: db
          required: true
          schema: { type: string, enum: [pubmed] }
          # “db” selects the database. This spec is fixed to PubMed only.

        - in: query
          name: term
          required: true
          schema: { type: string }
          # “term” is your search query (keywords and operators).

        - in: query
          name: retmax
          schema: { type: integer, minimum: 1, maximum: 200 }
          # “retmax” is how many results to return (page size).

        - in: query
          name: retstart
          schema: { type: integer, minimum: 0 }
          # “retstart” is the offset for pagination (0 = first page).

        - in: query
          name: sort
          schema: { type: string, enum: [relevance, pub+date, author, journal] }
          # Optional sorting: relevance, publication date, etc.

        - in: query
          name: datetype
          schema: { type: string, enum: [pdat, edat] }
          # Which date field to use when filtering by mindate/maxdate.

        - in: query
          name: mindate
          schema: { type: string }
          # Start date filter (format handled by the PubMed service).

        - in: query
          name: maxdate
          schema: { type: string }
          # End date filter.

        - in: query
          name: retmode
          schema: { type: string, enum: [json, xml] }
          # Output format requested from PubMed (JSON or XML).

        - in: query
          name: field
          schema: { type: string }
          # Optional: restrict search to a specific field.

        - in: query
          name: api_key
          schema: { type: string }
          # Optional NCBI API key (higher rate limits).

        - in: query
          name: tool
          schema: { type: string }
          # Optional: name of your application/tool (NCBI etiquette).

        - in: query
          name: email
          schema: { type: string, format: email }
          # Optional: contact email (recommended for production use).

      responses:
        "200":
          description: ESearch JSON
          content:
            application/json:
              schema:
                type: object
                properties: {}
                # Placeholder schema: it says “JSON object”, but does not list fields.

  /esummary.fcgi:                 # ESummary = “get article metadata for PMIDs”.
    get:
      operationId: esummaryPubMed
      summary: Get PubMed metadata

      parameters:
        - in: query
          name: db
          required: true
          schema: { type: string, enum: [pubmed] }

        - in: query
          name: id
          required: true
          schema:
            type: string
            description: Comma-separated PMIDs
            # Example: id=12345,67890

        - in: query
          name: retmode
          schema: { type: string, enum: [json, xml] }

        - in: query
          name: api_key
          schema: { type: string }

        - in: query
          name: tool
          schema: { type: string }

        - in: query
          name: email
          schema: { type: string, format: email }

      responses:
        "200":
          description: ESummary JSON
          content:
            application/json:
              schema:
                type: object
                properties: {}
                # Placeholder schema: real ESummary fields are not modeled here.

  /efetch.fcgi:                   # EFetch = “download abstracts/full records for PMIDs”.
    get:
      operationId: efetchPubMed
      summary: Fetch PubMed abstracts

      parameters:
        - in: query
          name: db
          required: true
          schema: { type: string, enum: [pubmed] }

        - in: query
          name: id
          required: true
          schema:
            type: string
            description: Comma-separated PMIDs

        - in: query
          name: retmode
          schema: { type: string, enum: [text, xml] }
          # Choose plain text or XML output.

        - in: query
          name: rettype
          schema: { type: string, enum: [abstract, medline, uilist, full] }
          # Choose what to fetch (abstract, MEDLINE, etc.).

        - in: query
          name: api_key
          schema: { type: string }

        - in: query
          name: tool
          schema: { type: string }

        - in: query
          name: email
          schema: { type: string, format: email }

      responses:
        "200":
          description: Abstract text or XML
          content:
            text/plain:
              schema: { type: string }
            application/xml:
              schema:
                type: object
                properties: {}
                # Placeholder schema for XML.

components:                        # Place for reusable schemas/definitions.
  schemas: {}                      # Empty here: no reusable schemas defined.
```

---
name: cairn-review
description: Strict final review of the current changes against the Cairn engineering guardrails and the task's intent — the last guard before code is considered done. Checks for over-engineering, bloat, missed reuse, needless global state, scope creep, comment hygiene, and stale docs. Use this after cairn-build, when the user asks to "review", "check this before I ship", or wants a final pass. The fifth step of the Cairn loop.
argument-hint: optional — defaults to the current uncommitted changes
---

# cairn-review

The final guard. Review the actual changes hard, through the lens of the project's guardrails. Be direct — softening a real problem here defeats the purpose of the step.

## What you review

Read the current diff (uncommitted changes, or the range the user names). Check against:

- **Over-engineering / bloat** — abstractions, layers, config, or generality the requirement didn't need. Look for this first; it's the most common and most costly.
- **Missed reuse** — new code that duplicates something that already exists.
- **Needless global/shared state** — stores or singletons where local state would do.
- **Scope creep** — changes beyond what the task required.
- **Comment hygiene** — comments that restate the code, or that reference PRDs, tickets, or planning docs.
- **Dead code, leftover debugging, unclear names.**
- **Stale docs** — behavior changed but `docs/features/` or `docs/areas/` wasn't updated.

## How to report

List findings ranked by severity. For each: what's wrong and the concrete fix. Don't rewrite the code silently — propose, and offer to apply clear small fixes on the user's go-ahead. End with a plain verdict: **ready**, or **not yet** with the blocking items named.

## Then

If it passes, print:

```
cairn-sync
```

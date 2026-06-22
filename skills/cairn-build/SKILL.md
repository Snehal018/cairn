---
name: cairn-build
description: Implement a Cairn task (or a small inline fix) as actual code under the project's engineering guardrails, then update the living feature doc for anything whose behavior changed. Use when the user says "build it", "implement this", "go ahead and code it", after cairn-plan, or for a small fix that doesn't need the full planning loop. The fourth step of the Cairn loop — and the entry point for small ad-hoc work.
argument-hint: task doc path, or an inline description of a small change
---

# cairn-build

Write the code. Accepts either a task doc path (full loop) or a plain instruction for small ad-hoc work — Cairn steps are composable, so work doesn't always arrive through cairn-plan.

## Engineering guardrails

Follow the full Cairn guardrails in `CLAUDE.md` (the "Cairn engineering guardrails" section). If that section is missing, run cairn-onboard first. The core, restated so this skill stands alone:

- Simplest thing that fully meets the requirement wins — no speculative abstraction or generality.
- Follow the requirements; don't invent scope or decide product/UX questions yourself — ask.
- Reuse existing code before writing new; make new code reusable only where natural.
- Minimal comments, only for non-obvious *why*. Never mention PRDs, tickets, or planning docs in code.
- No global/shared state unless there's a demonstrated need local state can't meet.

## What you do

1. If given a task doc, read it and the cleared plan. If given inline work, do just that — don't expand it.
2. Implement it. Stay inside the task's scope. If you discover the scope is wrong, stop and tell the user rather than silently widening it.
3. Update docs as part of the change. If behavior changed, update the living doc:
   - **New feature** → create `docs/features/<slug>.md` with the durable summary: goal, key decisions, how it works, where it lives. Keep it lean — this is the doc that survives, not a transcript of the build.
   - **Changed existing behavior** → edit the existing `docs/features/<slug>.md` or `docs/areas/<area>.md` in place. Never fork a "v2" doc.
   - Leave the `CLAUDE.md` index entry to cairn-sync.

## Then

Print the next steps:

```
cairn-review     then     cairn-sync
```

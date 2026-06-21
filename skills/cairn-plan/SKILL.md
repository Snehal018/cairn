---
name: cairn-plan
description: Turn one Cairn task doc into a concrete, executable implementation plan and present it in the terminal — no doc is written. This is the last gap-clearing step before code: surface every assumption and clear requirement gaps with the user first. Use this after cairn-tasks, or whenever the user points at a task doc and wants the actual plan, or says "plan this task" or "how would you build this". The third step of the Cairn loop.
argument-hint: path to task doc (docs/_work/<slug>/tasks/NN-name.md)
---

# cairn-plan

Produce the real implementation plan for one task. Output goes to the **terminal only** — this plan is deliberately not saved, because its job is to align with the user right before building and then be replaced by the actual code.

## What you do

1. Read the task doc at the given path (ask for it if not given). Read the relevant `docs/areas/` and `docs/features/` docs and, crucially, the actual code you'll be touching.
2. Write a concrete plan: the exact files to change or add, the functions/components involved, the data flow, the edge cases, and where you'll reuse existing code rather than write new.
3. Surface every assumption explicitly. **This is the entire point of the step.** Anywhere the requirement is ambiguous, or you'd otherwise fill a gap by guessing, list it and ask the user before going further. Do not start building with open gaps.

## Principles for the plan

- Plan the simplest implementation that fully satisfies the task. Call out anywhere you were tempted to over-build and chose not to.
- Identify reusable existing code up front and prefer it over new code.
- Keep the plan proportional — a small task gets a short plan, not a ceremony.

## Output

Terminal only — write no file. End with an explicit assumptions/questions list if any remain. Once the user confirms there are no open gaps, print:

```
cairn-build docs/_work/<slug>/tasks/NN-<name>.md
```

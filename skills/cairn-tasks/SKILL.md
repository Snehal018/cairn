---
name: cairn-tasks
description: Split a Cairn feature spec into scoped, ordered task docs, one markdown file per task with the deeper context that task needs. Use this after cairn-brainstorm, or when the user points at a feature spec and wants it broken into phases/tasks, or says "split this into tasks", "break this down", or "plan the phases". The second step of the Cairn loop.
argument-hint: path to feature spec (docs/_work/<slug>/feature.md)
---

# cairn-tasks

Break one feature spec into scoped tasks. Still a *documentation* step — you produce task docs, not an implementation plan and not code.

## What you do

1. Read the feature spec at the given path. If no path is given, ask for it — explicit handoff, don't guess which feature.
2. Propose the task breakdown to the user *before* writing anything: small, ordered by dependency, each independently buildable and reviewable where possible. Adjust based on their feedback.
3. For each agreed task, write a focused doc carrying the slice of context that task needs — deeper than the feature spec, but scoped to that task only.

## Sizing tasks

- Prefer tasks that can be built and reviewed in one focused pass. If a task feels like it needs sub-phases, it's probably two tasks.
- Don't manufacture tasks for tidiness. A small feature might legitimately be one task — that's fine; don't pad the loop.
- Order strictly by dependency and number them so the sequence is unambiguous.

## Output

For each task write `docs/_work/<slug>/tasks/NN-<short-name>.md` (zero-padded, e.g. `01-schema.md`). Disposable scaffolding like the rest of `_work/`.

```markdown
# Task NN — <name>

## Scope
What this task delivers, in one paragraph.

## Context
The specific context for this task — relevant files/areas, the decisions from the feature
spec that apply here, data shapes, interfaces it touches.

## Acceptance
Concrete, checkable criteria for "done".

## Out of scope
What belongs to other tasks, so this one stays bounded.
```

## Then

List the tasks you created and print the command for the first one:

```
cairn-plan docs/_work/<slug>/tasks/01-<name>.md
```

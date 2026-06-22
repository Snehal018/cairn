---
name: cairn-brainstorm
description: Grill a raw feature idea into a focused, shallow feature spec, then write it as a throwaway doc. Use when the user wants to start a new feature, has a rough idea to think through, says "I want to build", "spec this out", or "let's brainstorm a feature", or hands over a vague request that needs shaping before any planning or code. The first step of the Cairn loop.
argument-hint: [feature idea or rough description]
---

# cairn-brainstorm

Turn a rough idea into a clear, shallow feature spec. This is a *documentation* step, not a design or coding step — the output is one throwaway doc that the later Cairn steps build on.

## What you do

1. Read the user's idea. Pull in relevant context from `docs/areas/`, `docs/features/`, and the codebase so your questions are informed, not generic.
2. Grill the user. Ask the questions that actually change the shape of the feature — the goal, the boundaries, and the decisions only they can make. Surface the forks in the road and let them choose; never decide product or UX questions for them.
3. Keep it shallow. Capture *what* and *why*, not *how*. No implementation, no file lists, no architecture — those come later in cairn-tasks and cairn-plan.
4. Stop when the feature is clear enough to split into tasks. Don't over-refine.

## How to grill

- Ask in small clusters of related questions, not one giant interrogation and not an endless drip.
- Prioritise questions that would change the build if answered differently. Skip questions whose answer you can reasonably infer from existing docs or code — confirm those briefly instead.
- If the user is unsure, offer 2-3 concrete options with their tradeoffs rather than abstract open questions.
- Don't spiral. Three or four good rounds is usually enough to get a clear spec.

## Output

Write `docs/_work/<slug>/feature.md`, where `<slug>` is a short kebab-case name for the feature (create the folder). This doc is disposable scaffolding — the user sweeps `_work/` periodically.

Use this structure:

```markdown
# <Feature name>

## Goal
What this feature is for, in 2-4 sentences — the user-facing or system outcome.

## Decisions
The decisions made during this brainstorm, each with a one-line rationale.
This is the most valuable section: it records the road taken so later steps don't relitigate it.

## Context & constraints
The meta-context a builder needs — relevant existing systems, constraints, dependencies,
anything load-bearing. Keep it tight.

## Non-goals
What this feature explicitly does not do. Prevents scope creep downstream.

## Open questions
Anything still unresolved that doesn't block splitting into tasks.
```

## Then

Tell the user the spec is ready and print the next command:

```
cairn-tasks docs/_work/<slug>/feature.md
```

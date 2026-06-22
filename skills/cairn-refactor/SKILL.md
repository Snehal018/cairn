---
name: cairn-refactor
description: Improve or restructure existing code to the Cairn guardrails — simplifying and removing bloat while preserving behavior. Sizes the work first: small refactors run directly, large ones get a refactor spec that feeds the normal Cairn loop. Use when the user wants to "refactor", "clean up", "simplify", "improve the architecture", or fix messy code. A standalone Cairn skill.
argument-hint: [what to refactor, or a file/area]
---

# cairn-refactor

Improve code without changing what it does (unless the user explicitly asks for a behavior change). Apply the same guardrails as building: simpler is the goal, and a new abstraction has to remove more complexity than it adds.

## First, size it

Assess scope before touching anything:

- **Small and self-contained** (a function, a file, a tight cluster) → do it directly, then hand to review.
- **Large or cross-cutting** (spans modules, touches many call sites, needs sequencing) → don't free-climb it. Write a refactor spec and run it through the loop like a feature.

Tell the user which path you're taking and why before proceeding.

## Guardrails for refactoring

- Preserve behavior. If you spot a bug while refactoring, surface it separately — don't silently "fix" it inside the refactor.
- Reduce, don't redecorate. Delete dead code, collapse needless indirection, remove speculative generality. Don't introduce new layers unless they genuinely simplify.
- Work in reviewable steps, not one giant rewrite.

## The two paths

**Small** → make the change, then print:

```
cairn-review
```

**Large** → write the spec to `docs/_work/<slug>/feature.md` using the cairn-brainstorm feature structure (Goal / Decisions / Context & constraints / Non-goals), framed as a refactor, then print:

```
cairn-tasks docs/_work/<slug>/feature.md
```

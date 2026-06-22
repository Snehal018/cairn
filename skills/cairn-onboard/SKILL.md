---
name: cairn-onboard
description: Bootstrap the Cairn documentation system into a project — run once when introducing Cairn to an existing or brownfield codebase. Seeds CLAUDE.md with the engineering guardrails and doc index, creates the docs/ taxonomy, symlinks AGENTS.md to CLAUDE.md, and writes high-level area docs. Use when the user says "set up Cairn here", "onboard this project", "document this codebase", or starts using Cairn in a repo that hasn't been set up yet.
argument-hint: none — operates on the current repository
---

# cairn-onboard

Set up the structure every other Cairn skill depends on. Run once per project. Respect the anti-bloat guardrails here too — the goal is a useful map, not exhaustive documentation.

## What you do

1. **Seed `CLAUDE.md`.** If it doesn't exist, create it. If it does, append a Cairn section rather than overwriting the user's content. Include:
   - The engineering guardrails — copy them verbatim from `references/guardrails.md` in this skill folder.
   - A **Doc index** section: the map of `docs/` that agents consult to decide which doc to open. Seed it with the area docs you write below.
2. **Symlink `AGENTS.md` → `CLAUDE.md`** so Codex and Claude Code read the same always-on file and it never drifts: `ln -s CLAUDE.md AGENTS.md` at the repo root. If `AGENTS.md` already exists with real content, tell the user and ask before replacing it.
3. **Create the taxonomy:** `docs/areas/`, `docs/features/`, `docs/_work/`.
4. **Map the codebase.** Explore it, then propose to the user the list of cross-cutting areas worth a doc — e.g. architecture overview, data model, auth, API conventions, build/deploy. Confirm the list before writing, so you don't generate a pile of docs nobody needs.
5. **Write `docs/areas/<area>.md`** for each confirmed area: high-level — how it works and where it lives, not a line-by-line tour. Add a one-line entry for each to the `CLAUDE.md` doc index.

## CLAUDE.md doc index format

One line per doc, just enough to know when to open it:

```markdown
## Doc index
Established patterns and conventions live in this file. Detailed docs live under `docs/`:

- `docs/areas/<area>.md` — <one-line summary>
- `docs/features/<slug>.md` — <one-line summary>

Open the relevant doc when working in that area; don't load everything every turn.
```

## Principle

`CLAUDE.md` should hold only what's relevant on ~every turn — the guardrails and the index. Everything feature- or area-specific lives in its own doc under `docs/` and is pulled in on demand. Keep the always-on file small; that's the whole point of the index.

---
name: cairn-sync
description: Reconcile the project's living docs with what actually happened this session and keep the CLAUDE.md index current — the manual doc-maintenance pass. Updates stale docs in place and adds or revises index entries when work lands. Use when the user says "update the docs", "sync the docs", or "the docs are out of date", after cairn-build/cairn-review, or after a stretch of ad-hoc work. The doc-keeping step of the Cairn loop.
argument-hint: none — reviews the current conversation and the docs/ tree
---

# cairn-sync

Make the docs honest and the index current. This is a *documentation* step — it never changes code.

## What you do

1. Review the conversation and the actual current state of `docs/` and the codebase. Find where the living docs no longer match reality. If nothing this session changed documented behavior, say so and stop — a sync that touches nothing is a valid outcome.
2. Update the affected docs in place — `docs/features/<slug>.md` and `docs/areas/<area>.md`. Edit existing docs; never create parallel or versioned copies. Keep them lean and current, not a changelog.
3. Update the index in `CLAUDE.md`: for any new or changed feature/area doc, add or revise its one-line summary entry so the index always reflects what exists. **This is where index entries are born** — earlier steps don't touch the index.
4. Point out which `docs/_work/<slug>/` planning folders are now safe to delete. Don't delete them yourself — cleanup is the user's call.

## Principles

- The index in `CLAUDE.md` is a map, not the territory: one line per doc, just enough for an agent to know when to open it.
- Don't over-document. If a change doesn't affect anything an agent needs to know later, it doesn't need a doc edit.

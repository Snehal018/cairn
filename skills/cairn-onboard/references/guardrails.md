# Cairn engineering guardrails

These apply to every coding turn in this project.

- **Simplest thing that fully meets the requirement wins.** Don't add abstraction, configuration, or generality the requirement doesn't call for. Over-engineering is the failure mode to fear most.
- **Follow the stated requirements.** Don't invent scope or make product/UX decisions unilaterally — when something is ambiguous or a real decision is needed, ask rather than guess.
- **Reuse before writing.** Use what already exists before adding anything new. When you do write new code, shape it so it can be reused — but only where that falls out naturally, never speculatively.
- **Minimal comments.** Comment only where the *why* isn't obvious from the code. Never reference PRDs, tickets, planning docs, or "the spec" in code comments.
- **No global/shared state** (Redux, global stores, singletons, context-as-state) unless there is a real, demonstrated need that local state can't meet.
- **Keep docs honest.** When behavior changes, update the relevant living doc under `docs/` as part of the same change — never leave a doc describing how things used to work.
- **Ask, don't spiral.** If you find yourself guessing at intent or burning effort exploring unknowns, stop and ask one sharp question instead.

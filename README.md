# Cairn

A small, documentation-driven skills framework for **Claude Code** and **Codex** (and any agent that reads the [Agent Skills](https://github.com/anthropics/skills) open standard).

Most skill packs are bloated — they force ceremony you don't need and make decisions for you. Cairn is the opposite: a lean loop for a single developer that keeps documentation honest, asks instead of assuming, and scales the process down to the size of the work.

Every skill is plain markdown. No bundled scripts run when a skill is invoked, so you can audit the whole thing in a couple of minutes.

## Philosophy

Cairn skills enforce one set of guardrails on every coding turn:

- **The simplest thing that fully meets the requirement wins.** Over-engineering is the failure mode to fear most.
- **Follow the requirements; don't invent scope.** When a real decision is needed, ask — don't decide for the developer.
- **Reuse before writing.** New code is shaped for reuse only where that's natural, never speculatively.
- **Minimal comments**, only for non-obvious _why_; never reference planning docs in code.
- **No global state** without a demonstrated need.
- **Docs stay honest** — when behavior changes, the relevant doc changes in the same step.
- **Ask, don't spiral.**

These live in your project's `CLAUDE.md` once you run `cairn-onboard`, so they apply on every turn.

## The loop

```
cairn-brainstorm  →  cairn-tasks  →  cairn-plan  →  cairn-build  →  cairn-review  →  cairn-sync
   (feature spec)     (task docs)    (terminal plan)   (code +        (final guard)   (reconcile docs
                                                        doc update)                    + index)
```

The steps are **composable** — small work skips stages. A quick fix is usually just:

```
cairn-diagnose  →  cairn-build  →  cairn-review  →  cairn-sync
```

## The skills

| Skill              | Does                                                       | Writes                                        |
| ------------------ | ---------------------------------------------------------- | --------------------------------------------- |
| `cairn-brainstorm` | Grills a raw idea into a focused feature spec              | `docs/_work/<slug>/feature.md` (throwaway)    |
| `cairn-tasks`      | Splits a feature spec into scoped, ordered tasks           | `docs/_work/<slug>/tasks/NN-*.md` (throwaway) |
| `cairn-plan`       | Turns one task into an executable plan, clearing gaps      | terminal only — no doc                        |
| `cairn-build`      | Implements a task or small fix, updates the living doc     | code + `docs/features/<slug>.md`              |
| `cairn-review`     | Strict final guard against the guardrails and intent       | —                                             |
| `cairn-sync`       | Reconciles living docs with reality, keeps the index       | `docs/**`, `CLAUDE.md` index                  |
| `cairn-diagnose`   | Scoped debugging — root cause first, propose before coding | —                                             |
| `cairn-refactor`   | Small refactors directly; large ones feed the loop         | code, or a refactor spec                      |
| `cairn-onboard`    | Bootstraps the doc system into a project (run once)        | `CLAUDE.md`, `AGENTS.md`, `docs/` tree        |

## Documentation model

Cairn keeps two kinds of docs apart so the project never fills with stale planning files:

```
CLAUDE.md              # always-on: guardrails + a one-line index of every doc
AGENTS.md              # symlink → CLAUDE.md (so both tools read the same file, no drift)
docs/
  areas/<area>.md      # living: cross-cutting architecture (auth, data model, API conventions…)
  features/<slug>.md   # living: one durable doc per feature, updated in place forever
  _work/<slug>/        # throwaway: brainstorm + task docs — sweep this folder periodically
```

`CLAUDE.md` carries only what's relevant on ~every turn. Everything else is pulled in on demand via the index, so context stays lean.

## Install

### Option A — skills.sh (recommended)

[skills.sh](https://skills.sh) is a cross-tool installer for the Agent Skills standard. From any supported agent:

```bash
npx skills add <your-github-username>/cairn
```

Target specific agents, or keep them updated:

```bash
npx skills add <your-github-username>/cairn -a claude-code -a codex
npx skills update
```

### Option B — manual (git + symlink)

```bash
git clone https://github.com/<your-github-username>/cairn.git
cd cairn
./install.sh          # symlinks each skill into ~/.claude/skills and ~/.agents/skills
```

Updating later is just `git pull` — the symlinks point back at the repo.

> Restart your agent session after installing so it picks up the new skills.

### Then, per project

In each repo where you want Cairn, run once:

```
cairn-onboard
```

It seeds `CLAUDE.md`, creates the `docs/` tree, symlinks `AGENTS.md`, and writes high-level area docs for the codebase.

## Trust

Cairn is markdown-only — no scripts execute when a skill is invoked. The single shell script, `install.sh`, only symlinks folders and runs solely when _you_ run it. Read it first; that's the whole supply chain.

## License

MIT — see [LICENSE](LICENSE).

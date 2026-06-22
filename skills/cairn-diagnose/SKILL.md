---
name: cairn-diagnose
description: Find the root cause of a bug and propose the fix for approval before any code changes, leaning on the user for runtime and UI observations instead of guessing. Use when the user reports a bug, something "isn't working", "is broken", or "throws an error", or asks you to debug or investigate — especially frontend or UI issues. A standalone Cairn skill that hands a confirmed fix to cairn-build.
argument-hint: [the bug, symptom, or error]
---

# cairn-diagnose

Find the *root cause*, then stop and propose. Don't start editing code while you're still guessing — that's how debugging sessions waste time and tokens.

## What you do

1. Scope it. Understand the symptom and where it surfaces. Read only the code paths relevant to it — resist wandering the whole codebase.
2. For anything that depends on runtime behavior, the browser, or what the user actually sees — **ask**. Request the exact error text, console output, repro steps, screenshots, or the relevant state. For UI issues especially, the user's observation is worth more than your inference; get it before theorising.
3. Identify the root cause, not just the surface symptom. Distinguish "the line that throws" from "the reason it's in that state".
4. Present the root cause and a proposed fix as your response, and **stop**. Wait for the user's go-ahead before changing any code.

## Scope discipline

- Fix the cause of *this* bug. Don't refactor surrounding code or fix unrelated things you notice — flag those separately for later.
- If you genuinely can't isolate the cause without more information, say exactly what you'd need rather than spreading changes hoping one sticks.

## Then

Once the user approves the fix, hand it to build as small inline work:

```
cairn-build "<the confirmed fix>"
```

# 2 · Write the pack, then try to misread it

The pack is what a fresh chat needs to do the job without you. It has two
parts and is tested twice before it runs.

## Part A, the prompt

Fill `templates/main-prompt.md`. In order:

- **MODEL** and whether the chat waits for your go.
- **Your words**: where the dump is, and that the later part wins.
- **THE JOB**: one outcome.
- **THE WHY**: your words, quoted.
- **The asks**, numbered.
- **The stages**, in your words, each with what it waits on.
- **The first stage in full**: the outcome and its proof, not the method.
- **WHAT THIS JOB IS NOT**: the rewrites, new systems and extra machinery
  you do not want.
- **GUARDRAILS**, each with its reason.
- **DONE MEANS**: lines a script or a second reader can check.
- **STOP WHEN** and **RETURN**.

Keep it under about 900 words. A long prompt is a sign the job should be
split, not that the prompt needs more detail.

## Part B, the guidance

Read once by the worker and by you:

- **How this could be misread**: the misread table (below).
- **Stuck words**: resolved and open.
- **What the record shows**: each fact with the file it comes from.
- **For you to settle**: conflicts, each with a recommended answer.
- **The kit**: which skill or tool serves which step, and why.
- **Running the job**: which chat, which model per step, one job per fresh
  chat, the state note between chats, the stop lines.
- **Steering lines**: a few lines you can paste into the running chat.

## Test 1, the misread pass

Two classes of misreading exist, and each needs its own test.

- **Misreading you.** List the traps your own record holds: things that went
  wrong before (a pasted transcript read as background; a claim of done with
  no proof; a fix built beside the old thing instead of inside it; a plan
  written instead of a change made). For each, point at the line in the
  prompt that catches it. No line? Add one.
- **Misreading the prompt.** This only a dry run finds.

Use `templates/misread-table.md`.

## Test 2, the dry run

Give the prompt, cold, to a fresh chat on the same machine. Ask: "Do nothing.
Say in five lines what you would do, then list every line you could read two
ways." Nothing runs.

In the source run, one cheap dry run found nine ambiguities before any file
was touched; a second dry run on the real machine found ten more, including
wrong counts the prompt had taken from memory. Typical catches:

- Two lines that contradict ("measure it after it lands" and "show it before
  it lands"). Ruling: build and measure on a scratch copy.
- An undefined term ("parked", "one level up", "the budget").
- A clause that could outrank the guardrails ("the latest part wins").
- A count that is wrong on disk.
- A step that is already done.

## The rulings block

Write each catch as one ruling under the prompt, headed **RULINGS ON READING
THIS PROMPT**, and an **ALREADY DONE, DO NOT REPEAT** list above it. Say that
the rulings win where they differ from the prompt, but never outrank the
guardrails, DONE MEANS or STOP WHEN.

## When the pack is final

You see the work three times: the play-back, the pack before its check, the
pack after. Each change you make goes into the dump file as a later part. The
pack is final when you say it is, and not before.

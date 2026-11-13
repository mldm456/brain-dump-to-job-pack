# 3 · Divide and dispatch

The manager chat holds judgment. Worker chats hold volume. A long chat pays
for its whole context on every turn, so reading, counting and checking go to
small one-job chats or agents that are born, do one thing, and return.

## The one rule

**Necessitate by mechanism, express by prompt.** A rule the model should
follow drifts. A rule the harness cannot proceed without holds. A refusal
works; a suggestion does not. So anything that must happen gets a mechanical
form (a hook, a script check, a closed list, a file that must exist) and the
prompt only explains it.

## The ladder

Work goes down; judgment goes up.

| Rung | Tier (late-2026 example) | Does | Never |
|---|---|---|---|
| scout | cheapest (Haiku) | Reads, extracts, counts, runs the same check on many items, fills a schema | Judges, advises, writes for a human unfiltered |
| hand | mid (Sonnet) | Writes the targeted edit, draft or fix where the shape is decided | Holds judgment, manages others |
| builder | strong (Opus) | Multi-file builds, hard bugs, retries after a failed hand | Bulk reading |
| verifier | cheap, then strong | PASS or FAIL per DONE MEANS line, from its own run | Checks what it built |
| judge | strongest (Opus or Fable) | Plans, weighs, second opinion before an irreversible step | Volume |

Start every task at the cheapest rung that can succeed. **A failed check
climbs one rung, once. The same failure twice stops the line** and comes back
to you with what failed, why, and what it means. Never two strong writers on
one thing. The model that wrote it never verifies it.

How to brief each tier:

- **Cheap tier:** closed lists ("choose, never type"), exact quotes, one file
  class, one check, one output file, a row count in DONE MEANS.
- **Mid tier:** spell out what a stronger model would infer. Say when a rule
  applies to every item. Anchor every instruction to a path.
- **Strong tier:** tight scope ("deliver what was asked, nothing more"). Give
  the goal and how to choose between conflicting goods, not step scripts.
- **Strongest tier:** the complete outcome, the action limits, and the rule
  that every progress claim points at a tool result.

## Dividing the job

1. List the parts first. Each is complete on its own and fits one fresh chat.
2. No two parts share a file. A part that needs another's result says so and
   runs after it.
3. Show the list to yourself (or your reviewer) once before work starts.
4. Do this before the first dispatch. The manager in the source run ran to
   about twice its handover line because the split came late.

## The brief

Every dispatch carries `templates/brief.md`:

```
THE JOB:       one outcome, in plain words
WHY:           the reason, in the asker's words
WHERE:         the paths to read and the one place to write
USE:           the skills or tools for this job
GUARDRAILS:    first line is MAY WRITE: <path>; then each limit with its reason
DONE MEANS:    lines a script or second reader can check (a count, a row, a read-back)
STOP WHEN:     done, a check fails twice, or the turn budget runs out
RUNG:          scout / hand / builder / verifier / judge
RETURN:        8 lines or fewer: path, count, what was not done
TURN BUDGET:   a number
```

Gates that refuse a dispatch missing RUNG, RETURN or DONE MEANS worked in the
source run. Make yours a hook, not a habit.

Check that a reader rung can write its output file. In the source run, two
read-only scouts could not save their tables and had to return them inline.

## What a worker returns

- A **table of edits**: each changed file, its scratch copy, its proof, its
  undo (`templates/return.md`).
- **PASS or FAIL per DONE MEANS line**, with the evidence from its own run.
- What was **not done**.
- Eight lines or fewer in the chat; the rest in the file.

## How the manager checks a return

- Open the path. Re-derive the count yourself. Never take a figure from the
  report of it.
- A script confirms quotes appear in the source.
- One fix round, then one re-test. A fix not re-tested proves only the old
  text.
- Check the live file is unchanged (size and checksum) unless a landing was
  approved.

## Naming

Name a job by its outcome (`fix-the-brief-gate`, not `job-47`). Name a worker
by its rung, never a personality: a name that says what it does can be
checked. One `PACKET-<job>-<date>.md` and one `RETURN-<job>-<date>.md` per job.

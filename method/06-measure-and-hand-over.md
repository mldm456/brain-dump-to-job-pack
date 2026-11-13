# 6 · Measure and hand over

## Measure first, then plan

The largest saving in the source run came from a lever that was not in the
plan. Three chat folders started at several hundred thousand tokens because
their opening instructions sent the agent reading before its first reply. One
line in each card fixed it and halved the start load. The plan had targeted
a skills-listing setting instead, which on measurement added tokens.

So measure each place a chat is born before you tune anything:

- **Start load.** Run one throwaway prompt in a fresh chat from that folder
  (for example `claude -p "ok" --output-format json`) and add the input,
  cache-creation and cache-read token fields. Write the figure down with the
  date, the folder and the surface. Command-line and app figures differ; say
  which.
- **What is installed**, counted on disk: skills, hooks, agents, plugins,
  connectors. Keep the command beside each count.
- **What loads**, checked in a fresh chat, not read from settings.

Judge each folder against its own kit. No one size target fits every chat.

## The four numbers

The only dashboard that matters, one row per job, judged after three jobs and
again after a week:

1. **Turns to first value**: how many of your turns pass before something
   useful comes back. The source run took more than ten. Aim for one or two.
2. **Your corrections per job.**
3. **Times you had to say "just do it".**
4. **Retries per dispatch.** A well-briefed cheap-tier loop needs none.

If the method is not beating your old way on these after three real jobs, it
goes back to design.

## Spend

- Read your plan's meter before each dispatch. Set stop lines in advance
  (for example a share of the week, a share of the five-hour window) and stop
  at them.
- A fresh chat with a good handover beats a long chat. A chat pays for its
  whole context every turn.
- Plugins and connectors with no job are a standing cost. Switch them on for
  the job and off after.
- No overnight or unattended loops. A loop with no stop condition does not
  run. A long loop resets its worker each cycle.

## The handover standard

Hand over at a fixed context line (for example 250,000 tokens) or after an
idle hour, whichever comes first. Write two files:

- **`HANDOFF.md`**, the state (`templates/handover.md`, part 1): goal,
  current state, files touched (every artefact by path), what failed and why,
  the working theory, next steps, constraints, pointers into memory, the
  skills the next chat should load, and the commands that prove the state on
  arrival. No secrets.
- **`HANDOVER.md`**, the complete prompt the next chat runs (part 2): what to
  read in what order, the exact first steps, and what not to redo.

Then start the successor from `HANDOVER.md`. Never leave a note in place of
the files. Better still: split the job before it needs a handover.

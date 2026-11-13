# Brain dump to job pack

A method for turning a rough brain dump into a tested job pack, then running a
large refactor of your own Claude Code setup through one-job worker chats,
with every live change backed up and reversible.

It came out of one recorded run on a single Claude Code setup: a long, messy
dump of wants; a plan; a pack of instructions; small worker chats that built on
copies; and a manager chat that checked each return and landed it. This repo
keeps the method and drops the history. [ANALYSIS.md](ANALYSIS.md) says what
worked and what did not.

## Who it is for

- You run Claude Code daily and your setup has grown: many skills, hooks,
  agents, rules files and plugins.
- You want to change a lot of it at once without breaking it.
- You can read a shell script and a settings file.

## What is in it

| Path | What it holds |
|---|---|
| `method/01-capture-the-dump.md` | Turning raw thoughts into numbered asks and a board |
| `method/02-write-the-pack.md` | The job pack and its main prompt; misread pass; dry run |
| `method/03-divide-and-dispatch.md` | The model ladder, worker chats, the brief, the return |
| `method/04-land-and-restore.md` | Scratch first, side-by-side, backups, land and undo |
| `method/05-off-course.md` | The drifts that happened, their early signals, the fixes |
| `method/06-measure-and-hand-over.md` | The four numbers, start-load measuring, the handover standard |
| `templates/` | Copy-and-fill files: board, job card, brief, main prompt, misread table, return, handover, land script |
| `ANALYSIS.md` | The verdict: what works, what failed and why, what to change |

## How to use it in 5 steps

1. **Dump and number.** Write everything you want in one file, unedited. Then
   number every ask in it (`templates/brain-dump-asks.md`). Nothing gets lost
   if it has a number.
2. **Measure before you plan.** Measure what your setup costs now: the start
   load of a fresh chat (see method 06), and count on disk what you have
   (skills, hooks, agents). Write the figures down. Plans built on remembered
   counts were wrong every time.
3. **Write the pack, then try to misread it.** Fill `templates/main-prompt.md`
   and `templates/job-card.md`. Run the misread pass and one dry run with a
   fresh chat that only says what it *would* do (method 02). Write each catch
   into the prompt as a ruling.
4. **Divide and dispatch.** Split the job into parts that each fit one fresh
   chat and share no files. Give each part a brief (`templates/brief.md`).
   Workers build on copies and return a table of edits, the proof and the undo.
5. **Land one change at a time.** Look at the side-by-side, then land it with
   `templates/land.sh`. It backs up, checks the live file has not changed
   since you approved, and writes the undo script. Re-measure after each one.

The light path, for most jobs: step 1, step 2, one brief, step 5. Use the
full pack only when the job touches many files or rules at once.

## What it cannot do

- It does not change your setup by itself. You land every live change.
- It does not make a weak plan good. The dry run catches unclear wording, not
  wrong goals.
- It costs time and tokens. The full method took more than ten turns before
  the first useful output in the run it came from. Use the light path unless
  the job is large.
- Model names and token figures here are from late 2026 and will age. The
  shape (cheap tier reads, mid tier writes, strong tier judges) should not.
- Nothing here has been tested on any setup but the one it came from.

## Sources it draws on

Anthropic's published guidance on prompting the Claude 5 models, prompting
best practices, and context engineering; a public video interview on five
questions to ask Claude before a build; and an open-source skills collection
(MIT). No text from them is reproduced here.

## Licence

MIT. See [LICENSE](LICENSE).

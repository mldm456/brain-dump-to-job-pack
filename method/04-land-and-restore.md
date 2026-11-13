# 4 · Land and restore

**Scratch work never waits. Only live changes wait.**

Every change is built and measured on a scratch copy. The diff you see is the
scratch diff. It lands on the live file only at your yes, one change at a
time, with a backup beside it and one command to undo it.

## The sequence for one change

1. **Copy.** The worker copies the live file into the job's scratch folder
   and records its checksum. This is the fingerprint you will approve against.
2. **Build and measure on the copy.** Figures before and after, from the copy.
3. **Show the side-by-side.** Old and new, next to each other, with the
   figures. The approval happens in the chat that will make the change. An
   approval relayed from another chat was refused by the app in the source
   run, and that is the right behaviour.
4. **Land.** `templates/land.sh` does four things:
   - refuses if the live file's checksum is no longer the approved one
     (someone or something changed it since you looked);
   - copies the live file to a dated backup beside it;
   - copies the new version in;
   - writes a restore script that puts every backup back.
5. **Re-measure live.** Same command, same surface, written next to the
   scratch figure.
6. **Log one line.** What changed, the backup path, before and after.

## Why the fingerprint check

In the source run, an outside tool wrote to the same files during the job and
reverted six approved changes in about four minutes. The manager compared
against the last state it had seen, not the approved one, and reported "no
change" for several minutes. Check against the approved fingerprint, and do
not run a refactor while another tool writes the same setup.

## Try the undo once

Before you trust a restore script, run it once on a scratch copy and check
the file comes back byte for byte.

## Rules that held

- Nothing is deleted. Retired, archived or struck through, never removed.
- A backup beside every changed file. One command puts it back.
- Nothing installed, removed or sent without a yes, line by line.
- For a large batch, a commit of the whole config folder before the batch is
  the outer safety net. Version control of your config folder makes all of
  this cheaper.

## A standing go

If you tell the manager "take the recommended answers, do not wait", decide
in advance what that covers. The source run used: scratch-proved,
backed-up, reversible changes may land without a click each; anything that
reverses an earlier landing, touches global hooks, or needs an app click is
held. Under a standing go, about one ask in five drifted from what was meant.
Keep standing gos short and narrow.

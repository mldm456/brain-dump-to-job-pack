# Analysis: does the method work?

**Verdict: yes as a safety harness and a planning discipline; no as a fast
delivery process.** The parts that put a check between the model and a live
file worked every time they were used. The parts that added documents, chats
and readers before the first change cost more than they returned. Use the
light path by default and the full pack only for large, many-file jobs.

This verdict rests on one recorded run on a single Claude Code setup,
written up as it went. Figures below are as that record states
them; most were counted by script, a few were not re-checked. One run is not
a trial. Treat this as a case study.

## What the run did, in brief

A long brain dump (35 asks, 23 more added later) became a plan, then a job
pack with a main prompt of seven "moves": shrink the always-loaded rules
file, cut the start load, add reply-checking hooks, wire verification, settle
conflicting rules, route work to the right model, and settle unused tools. A
worker chat built each move on copies; a manager chat checked each return
and landed it with backups. About two hours of worker time covered the seven
moves.

## What worked

1. **Numbering the asks and counting by script.** 58 asks, each traced to a
   line. At the end every ask had a verdict, and the verdicts summed to 58.
   Without numbers, the drift below would have been invisible.
2. **The dry run.** One cheap fresh chat, told to do nothing and say what it
   would do, found nine ambiguities in the prompt. A second, on the real
   machine, found ten more, including counts that were wrong on disk and a
   step already done. No file was touched. This is the best value in the
   whole method.
3. **Scratch first, land at a yes, backup beside every file.** No approved
   change was lost. When an outside tool reverted six changes, every one
   could be put back.
4. **Gates that refuse.** Hooks that refused a dispatch missing its RUNG,
   RETURN or DONE MEANS lines held. Rules that were only written down did
   not. A cited study in the record found the same: an instruction held only
   in a rules file is context, not configuration.
5. **The fix-and-check ladder.** A draft, then a cheap verifier (4 fails in
   21 rows), a fix, a strong verifier ("not fit", 12 faults), a rewrite, then
   a pass. A failed check climbing one rung found what a same-rung retry
   would have missed.
6. **Quote checks by script.** 201 of 202 quoted spans were found in the
   source; the one miss was a paraphrase in quote marks.
7. **Dropping a failed artefact instead of patching it.** A one-page tool
   that failed on first use was retired, not rescued.
8. **Measuring each start.** One line in three chat cards halved their start
   load and cut turns to first reply from two to one. Other folders moved into a target band
   after connectors with no job were switched off at start.

## What failed, and why

1. **Too slow to first value.** More than ten turns passed before the first
   useful output; the aim was one or two. At least nine corrections and two
   "just do it" turns. Cause: each stage added a document and a reader
   before acting. The comparison run, which replied in one paragraph and
   started a table at once, reached first value faster and caught one thing
   the heavy method missed (an unmeasured baseline).
2. **Context overrun.** The manager chat ran to about twice its handover
   line, and another to three times. Cause: the job was split after it had
   started, not before. The context warning hook did not fire at the line.
3. **Counts from memory.** The skill count was written three different ways
   in three files, and none matched the disk. The hook count was wrong too.
   Every remembered count was wrong.
4. **Plan drift under a standing go.** 13 of 58 asks (22%) drifted: taken by
   a default, scoped down, or left out. Only 11 (19%) were done by the end.
   Cause: a standing "take the recommended answers" covered too much.
5. **The biggest lever was outside the plan.** The plan targeted a
   skills-listing setting (it added tokens). The real cost was opening
   instructions that made the agent read before replying. Cause: the plan
   came before measuring.
6. **A second writer on the same files.** An outside tool reverted six
   approved changes in about four minutes, and the manager reported "no
   change" because it compared against the last state it had seen. Cause: no
   fingerprint check, and two tools writing one setup.
7. **A checker that punished honesty.** A reply scorer blocked lines like
   "Not done: X" because they contained "done". It fired on the manager's own
   honest replies all day. Fix: sentence-level claim detection; 13 false
   alarms cleared on 50 samples with no true catch lost.
8. **Settings taken as proof.** Plugins set off still loaded. Command-line
   start figures and app figures disagreed. Cause: no one checked what a
   fresh chat actually loaded, or named the surface.
9. **Fixes not re-tested.** A job plan took 13 corrections and was never
   re-tested; a pack took 4 and was not either. A check not re-run proves
   only the old text.
10. **Headless runs refused.** Non-interactive runs could not get a command
    approved, so several sessions ended unproven. Fix: one allow line. A gate
    must be testable with no human present.
11. **Read-only readers asked to write.** Two cheap readers had no write
    tool and returned their tables inline. Match the rung's tools to the
    brief.

## What to change

1. **Measure before you plan.** Start load per folder, counts on disk, what
   actually loads. Plan only against figures.
2. **Split before the first dispatch.** List the parts, give each a fresh
   chat, and keep the manager below its handover line.
3. **Default to the light path.** Asks table, one brief, land. Add the full
   pack, board and dry run only for large many-file jobs.
4. **Always do the dry run.** It is cheap and catches what nothing else does.
5. **Land against an approved fingerprint**, and never run a refactor while
   another tool writes the same files. (`templates/land.sh` does this.)
6. **Re-test after every fix round.** Budget it in DONE MEANS.
7. **Test every checker on negations and questions** before wiring it in.
8. **Keep standing gos narrow**, written down, and logged.
9. **Read the four numbers after three jobs.** In the source run they were
   never read, so the method's own proof was never run.

## What is unproven

- Whether the method beats a plain, careful single chat on the four numbers.
  No counts were kept for the comparison.
- Whether the reply-rule hooks fire on every real typed prompt (seen on
  samples only).
- Whether the method works on a setup with fewer rules and hooks to start
  with. Much of the work was taming an over-built setup.

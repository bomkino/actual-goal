---
name: actual-goal
description: "Improve, audit, harden, compare, or execute prompts so models pursue the user's actual outcome instead of surface signals, inferred evaluator preferences, checklist theatre, narrow tests, style labels, citation counts, or other misleading proxies. Use when the user asks to write, improve, rewrite, debug, critique, stress-test, simplify, compare, or run a prompt; invokes '@actual-goal', '$actual-goal', or '/actual-goal'; says 'actual goal', 'actual-goal this', 'anti-game this', 'make this harder to game', 'don't optimize for the grader', 'reward-seeking', 'do what I mean', or 'no gold stars'; or when research, coding, creative work, analysis, evaluation, automation, deployment, or external actions could appear successful without actually succeeding."
---

# Actual Goal

Make the prompt optimize for the work, not the applause.

Treat a prompt as a task specification with a possible proxy gap. Preserve what the
user actually wants; remove routes to polished, literal, well-scored failure.

This skill adapts the intent-versus-reward distinction from OpenAI and Apollo
Research's *Measuring Reward-Seeking via Contrastive Belief Updates*. It does not
implement Contrastive SDF, scientifically measure a model, or eliminate model-level
reward-seeking. Use the research as a design warning and the contrast as an
out-of-band prompt audit.

## Core model

Build a private Proxy Gap Map:

| Element | Question |
|---|---|
| Actual outcome | What should become true for the user or end audience? |
| Observable proxy | What score, test, format, phrase, signal, or appearance could be mistaken for success? |
| Exploitable gap | How could weak or dishonest work satisfy that proxy? |
| Countercheck | What evidence would distinguish real success from the cheap imitation? |

Keep the map internal in Rewrite and Run modes. Show it only in Audit, Harden, or
Explain mode, or when the user asks.

Use task-specific proxies. "Do not game this prompt" is vague and often useless.
"Do not make tests pass by weakening, deleting, skipping, or bypassing them" closes
a concrete exploit.

## Operating rules

1. Put the real-world result before format, rubric, or style instructions.
2. Preserve explicit hard constraints, voice, facts, and requested scope.
3. Keep rubrics and tests when useful, but make them evidence of success rather
   than substitutes for the objective.
4. Make conflict order explicit. Within the applicable instruction hierarchy,
   prioritize safety, truth, authority, and hard boundaries; then the actual goal;
   then acceptance checks; then style and optional polish.
5. Require observable evidence. A self-reported "done" is not verification.
6. Separate `started`, `in progress`, `succeeded`, and `verified`.
7. Never invent access, actions, tests, sources, quotes, or completion.
8. Do not expand authority merely to look proactive. Sending, publishing,
   purchasing, deleting, exposing sensitive data, and other consequential actions
   need the authorization applicable to the environment and request.
9. Surface irreconcilable constraints instead of silently choosing the one most
   likely to score well.
10. Stay proportional. A simple factual request does not need a project charter.
11. Preserve useful ambiguity in creative work. Precision should clarify the job,
   not sand away voice, rhythm, humor, or surprise.
12. Do not ask for hidden chain-of-thought or treat verbalized reasoning as proof
   of motive. Judge the specification, behavior, artifact, and evidence.
13. Do not inject fictional graders or authority conflicts into the final prompt.
   Explicit test cues can cause metagaming. Run the contrastive audit outside the
   production prompt.

## Select the mode

Infer the mode from the request. If ambiguous, use Rewrite.

- **Rewrite** — Return a ready-to-use prompt. Make surgical changes by default.
- **Audit** — Diagnose the actual goal, assumptions, conflicts, and proxy gaps.
  Do not rewrite unless requested.
- **Harden** — Rewrite a consequential or agentic prompt and add acceptance
  checks, stop conditions, authority boundaries, and false-win defenses.
- **Run** — Improve the task specification privately, then perform the work.
  Do not expose the rewritten prompt unless asked.
- **Explain** — Show the Proxy Gap Map and teach why the changes matter.
- **Compare** — Compare prompt variants by likely behavior, proxy exposure,
  ambiguity, verifiability, and proportionality; recommend or synthesize one.

Interpret compact invocations naturally:

- `@actual-goal [prompt]`, `$actual-goal [prompt]`, or `/actual-goal [prompt]` →
  Rewrite
- `actual-goal audit [prompt]` → Audit
- `actual-goal harden [prompt]` → Harden
- `actual-goal run [task]` → Run
- `actual-goal explain [prompt]` → Explain
- `actual-goal compare [A] vs [B]` → Compare
- "Actual-goal this", "anti-game this", or "no gold stars" → Rewrite unless the
  surrounding request implies another mode

Do not make the user learn exact syntax. Natural language triggers are enough.

## Workflow

### 1. Establish the actual job

Extract only what matters:

- desired real-world outcome
- audience or end user
- artifact, answer, decision, or state change required
- relevant context and evidence
- hard constraints and prohibitions
- preferences and optional polish
- decisions the executor may make independently
- choices or actions that require a question, confirmation, or stop
- proof that would justify claiming completion

Infer obvious details from context. Ask one strategic question only when a missing
answer would materially change the result and no responsible default exists.
Otherwise state the assumption briefly and proceed.

### 2. Separate target from signals

List the actual goal separately from its indicators:

- tests
- rubrics
- examples
- citation counts
- word counts
- required headings
- style adjectives
- status messages
- reviewer preferences
- tool return values
- engagement or other metrics

For each indicator, ask what it protects. Remove it if it protects nothing. Retain
it as a constraint or check if it protects something real.

### 3. Find the costliest false wins

Generate one to three plausible ways the prompt could be satisfied literally while
betraying its purpose. Prioritize failures that are likely, harmful, hard to notice,
or tempting to an executor.

Common false wins:

- polished output with wrong substance
- agreement replacing independent judgment
- tests passing because tests were weakened or behavior was hard-coded
- many citations with weak claim-to-source support
- required buzzwords replacing audience effect
- a successful API response mistaken for verified external state
- checklist completion hiding an unresolved blocker
- excessive output mistaken for rigor
- an invented result concealing missing access
- unauthorized action taken to appear decisive

Read [references/task-lenses.md](references/task-lenses.md) for domain-specific
failure modes and counterchecks.

### 4. Run the contrastive audit

Construct two hypothetical executors privately:

- **Intent executor:** pursues the actual outcome while respecting boundaries.
- **Proxy executor:** pursues the easiest visible signal that could earn approval.

Ask:

1. Where could their actions diverge?
2. Which instruction makes the proxy attractive?
3. What evidence would expose the divergence?
4. What is the smallest prompt change that closes the gap?

This is a prompt-design heuristic inspired by the research. It is not Contrastive
SDF and must not be represented as a scientific measurement.

### 5. Rewrite in outcome order

Use only the sections the task needs:

```markdown
Goal
[What should become true in the world.]

Context
[Only facts that materially affect decisions.]

Deliverable
[What to produce or change, for whom, and in what form.]

Boundaries
- Must:
- Must not:
- May decide independently:
- Ask or stop only if:

Truth and evidence
[What sources, tests, observations, or checks count as evidence.]

Avoid false wins
- [Specific shortcut that could look successful while failing.]

Completion
Do not claim success until [observable checks].
If blocked, state exactly what remains and why.
```

Do not force headings when clean prose, a short command, or the user's existing
structure works better. Desired result first; useful context second; output and
boundaries next; verification last.

### 6. Red-team the draft

Check:

- Could polished but bad work satisfy this?
- Could literal compliance defeat the purpose?
- Could the executor claim completion without evidence?
- Could a narrow test replace intended behavior?
- Could agreement, length, jargon, citation density, or a checklist masquerade as
  quality?
- Could the executor exceed authority to appear proactive?
- Could it hide uncertainty or a blocker?
- Are any constraints contradictory?
- Did the rewrite preserve the user's voice and every hard boundary?
- Is this heavier than the task deserves?

Fix the prompt, not merely the explanation.

### 7. Deliver the usable thing first

Follow the output contract:

**Rewrite**

1. Ready-to-use prompt.
2. `What changed` only when material; maximum five concise bullets.

**Audit**

1. Actual goal.
2. Hidden assumptions or conflicts.
3. Likely proxy traps.
4. Exact fixes, ranked by impact.

**Harden**

1. Ready-to-use prompt.
2. Acceptance checks.
3. Stop or confirmation conditions.
4. Remaining failure modes that cannot be solved by prompting alone.

**Run**

Return the actual result. State completion only when checked. If blocked or partial,
distinguish completed work from what remains.

**Explain**

1. Proxy Gap Map.
2. Ready-to-use prompt.
3. Brief rationale tied to each material change.

**Compare**

1. Concise comparison.
2. Best choice and reason.
3. Improved synthesis when neither version is strong.

Never bury the revised prompt beneath a lecture.

## Special handling

### Existing prompts

Prefer surgical edits. Retain exact names, facts, URLs, commands, identifiers,
quoted copy, and deliberately chosen voice. Do not silently turn a repair into a
rewrite.

### Rubrics and evaluation prompts

Define the construct before the score. Use observable criteria and disqualifying
failures. Include held-out checks when stakes justify them. Do not let the same
model invent the work, define success, and certify itself without independent
evidence.

### Conflicting instructions

Distinguish:

- hard conflict: both requirements cannot be satisfied
- trade-off: both can be partly satisfied
- apparent conflict: clarified by scope or priority

Ask only for a hard conflict that materially changes the result and lacks a safe
default. Otherwise state the priority used.

### External or asynchronous work

Resolve the exact target before acting. Treat a request acceptance or queued job as
started, not done. Re-read or inspect final state. Report pending, failed, partial,
successful, and verified states accurately.

### High-stakes work

Prompt improvements do not replace qualified review, current primary sources,
independent verification, or applicable safety requirements. Strengthen the
evidence path rather than manufacturing confidence.

## References

- Read [references/research-basis.md](references/research-basis.md) when explaining
  the paper, using reward-seeking terminology, or distinguishing research claims
  from this skill's design inferences.
- Read [references/task-lenses.md](references/task-lenses.md) when rewriting a
  domain-specific prompt.
- Read [references/examples.md](references/examples.md) when a before/after pattern
  would help or the requested output mode is unclear.
- Read [references/evals.md](references/evals.md) when evaluating, comparing, or
  revising the skill, or when the user requests an adversarial prompt test.

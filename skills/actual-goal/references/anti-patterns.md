# Anti-patterns and structural repairs

This catalogue is for diagnosing prompt structures that let a visible proxy displace the real-world objective. It is a prompt-level defensive aid, not a method for inferring a model's hidden objective or proving that behaviour is aligned.

## Contents

- [How to use this catalogue](#how-to-use-this-catalogue)
- [Threat catalogue](#threat-catalogue)
  - [Evaluator substitution](#evaluator-substitution)
  - [Checklist substitution](#checklist-substitution)
  - [Completion at all costs](#completion-at-all-costs)
  - [Test gaming](#test-gaming)
  - [Metric gaming](#metric-gaming)
  - [Reference mimicry](#reference-mimicry)
  - [Citation theatre](#citation-theatre)
  - [Confidence theatre](#confidence-theatre)
  - [False completeness](#false-completeness)
  - [Self-certification](#self-certification)
  - [Oversight dependence](#oversight-dependence)
  - [Authority confusion](#authority-confusion)
  - [Prompt bloat](#prompt-bloat)
- [Structural repair patterns](#structural-repair-patterns)
- [Failures of this skill](#failures-of-this-skill)
- [Evaluator, benchmark, safety, and monitor evasion](#evaluator-benchmark-safety-and-monitor-evasion)

## How to use this catalogue

Diagnose the mechanism, not merely the suspicious phrase.

1. Identify the object-level objective and the most costly false success.
2. Locate the cue that could become a substitute target: score, checklist, test, example, format, completion status, or evaluator preference.
3. Ask what behaviour the cue rewards when it diverges from source truth or a hard constraint.
4. Repair the task structure: clarify authority, preserve uncertainty, constrain completion, and require artifact-level evidence.
5. Test the repaired prompt by changing one superficial cue while holding the objective constant.

A phrase such as "pass every test" is not automatically defective. It becomes dangerous when the visible tests are incomplete, mutable, or treated as more authoritative than the intended behaviour. Likewise, metrics, examples, rubrics, and references can remain useful evidence. The repair should define their role rather than delete them reflexively.

Do not diagnose ordinary error, weak reasoning, or poor execution as reward-seeking. Behaviour alone does not establish an internal motive.

## Threat catalogue

### Evaluator substitution

**Signal:** The task centres what a reviewer, grader, client, or judge will approve: "give the expected answer," "the evaluator prefers option A," or "write what will score highest."

**Mechanism:** Approval becomes the operational target. Factual, ethical, or functional decisions can then change when the evaluator cue changes, even though the real objective does not.

**Costly false success:** The output wins approval while giving the wrong recommendation, concealing a material risk, or failing for its intended audience.

**Structural repair:**

- Define the real decision or change the work must enable.
- State that evaluator preferences govern only legitimate presentation requirements, not source truth or hard constraints.
- Name the evidence that must support core decisions.
- Add an evaluator-preference reversal test; factual and integrity-critical decisions should remain invariant.

**Artifact check:** Compare the same task under opposite evaluator preferences. Inspect decision changes and their evidence, not the assistant's claim that it stayed objective.

### Checklist substitution

**Signal:** Success is defined as satisfying every listed item, with no account of why the items exist or how the finished artifact will be used.

**Mechanism:** The checklist becomes the product. Items can be present ceremonially while the artifact remains unusable, incoherent, or misleading.

**Costly false success:** Every required section exists, but a reader cannot recover the argument, a user cannot complete the task, or a risk is hidden between checked boxes.

**Structural repair:**

- Give each important requirement a causal relationship to the desired outcome.
- Distinguish hard constraints from supporting checks and optional polish.
- Add an end-to-end use test that can fail even when every item is present.
- Permit removal or adaptation of checklist items only when the user authorizes it and the objective is better served.

**Artifact check:** Test the finished artifact with a representative reader, user flow, or downstream consumer. Presence is not performance.

### Completion at all costs

**Signal:** "Finish everything," "do whatever it takes," "do not return blockers," "claim done only," or pressure to avoid questions and unresolved states.

**Mechanism:** Completion status is rewarded more strongly than truth, authorization, safety, data integrity, or scope fidelity.

**Costly false success:** The process fabricates missing facts, silently narrows scope, weakens a test, changes source data, or performs an unauthorized external action so it can declare completion.

**Structural repair:**

- State the constraints that completion cannot override.
- Define legitimate terminal states: completed, partially completed, blocked, unverified, and needs review.
- Specify which low-stakes assumptions are allowed and which unknowns must be preserved.
- Require separate reporting of verified work and unresolved issues.
- Define when one strategic question is necessary.

**Artifact check:** Reconcile the completion report with repository state, source systems, generated files, or action logs.

### Test gaming

**Signal:** Passing supplied or visible tests is treated as the full specification, especially when the process can modify tests, hard-code fixtures, skip cases, or suppress failures.

**Mechanism:** The implementation is optimized for observed fixtures rather than general valid behaviour.

**Costly false success:** The suite is green while unseen inputs fail, meaningful errors are hidden, or the tests themselves were weakened.

**Structural repair:**

- Define intended behaviour independently of the supplied tests.
- Treat tests as evidence, not exhaustive authority, unless the user explicitly establishes them as the specification.
- Forbid changing, disabling, skipping, or bypassing tests without authorization.
- Forbid fixture-specific hard-coding and failure suppression.
- Require at least one unseen valid case and inspection of the diff or repository state.

**Artifact check:** Run the original tests, review test-file changes, and exercise boundary or metamorphic cases absent from visible fixtures.

### Metric gaming

**Signal:** A target such as coverage, engagement, speed, closure rate, confidence, pass rate, or merge rate has no balancing constraint or direct outcome check.

**Mechanism:** The measurable indicator improves through actions that degrade what it was intended to represent.

**Costly false success:** A dashboard improves while customers are harmed, records are contaminated, risks are omitted, or quality falls outside the measured slice.

**Structural repair:**

- State what the metric is evidence for and where it can diverge.
- Add guardrails for the costliest counter-metric harm.
- Inspect distributional effects and failure cases, not only the aggregate.
- Preserve legitimate unresolved states rather than forcing the numerator upward.
- Use multiple forms of evidence when no single metric constitutes success.

**Artifact check:** Sample cases behind the aggregate, inspect excluded records, and compare metric movement with the real downstream outcome.

### Reference mimicry

**Signal:** "Follow this exactly," "make ours look like this," or a polished example is given more authority than audience needs, source material, accessibility, or the reason the example worked.

**Mechanism:** Surface features become the target. Context-specific choices are copied after their causal purpose has disappeared.

**Costly false success:** The output resembles the reference but obscures the proposition, violates accessibility, misstates evidence, or feels interchangeable with competitors.

**Structural repair:**

- Extract the reference's useful principles and distinguish them from incidental styling.
- State which source material and audience needs outrank the reference.
- Permit adaptation or rejection when the reference conflicts with truth, function, voice, or access.
- Run a style-inversion or misleading-example test while preserving the communication objective.

**Artifact check:** Remove decorative similarity and ask whether the intended argument, action, and usability still survive.

### Citation theatre

**Signal:** Citation count, density, or prestigious source names are rewarded without requiring claim-level support.

**Mechanism:** Citations become visual tokens of credibility. Sources may be irrelevant, indirect, outdated, contradictory, or added after the conclusion was fixed.

**Costly false success:** A research output looks rigorous while its decisive claims remain unsupported or overstate what the sources establish.

**Structural repair:**

- Require claim-to-source mapping for material claims.
- Distinguish direct evidence, inference, judgment, and speculation.
- Require source inspection rather than reliance on snippets or citation metadata.
- Surface contradictory evidence and publication-date limitations.
- Allow "not established" when support is absent.

**Artifact check:** Select decisive claims and verify that each cited source directly supports the scope, time, and strength of the claim.

### Confidence theatre

**Signal:** The prompt rewards decisiveness, forbids caveats, or treats uncertainty as weakness.

**Mechanism:** Tone substitutes for evidential strength. The model may collapse ranges, omit conditions, or present judgment as fact.

**Costly false success:** A user acts on a confident recommendation whose assumptions, uncertainty, or evidence gaps were hidden.

**Structural repair:**

- Ask for the strongest conclusion the evidence supports, not the strongest-sounding conclusion.
- Separate verified fact, inference, judgment, and speculation when material.
- Require confidence to track evidence quality and decision stakes.
- Preserve a clear recommendation when one is supportable; do not replace usefulness with indiscriminate caveats.

**Artifact check:** Remove rhetorical certainty and test whether the recommendation still follows from the cited evidence and stated assumptions.

### False completeness

**Signal:** Every field must be filled, every identity resolved, no blanks are allowed, or an exhaustive-looking report is valued over accurate state.

**Mechanism:** Unknown, ambiguous, not found, and not tested are collapsed into guessed values or false negatives.

**Costly false success:** A complete-looking dataset or report contaminates downstream decisions and hides where review is actually needed.

**Structural repair:**

- Define `unknown`, `ambiguous`, `unverified`, `not found`, and `needs review` as legitimate states.
- Distinguish missing evidence from evidence of absence.
- Set evidence thresholds for irreversible classification or merging.
- Report coverage and uncertainty separately.
- Allow completion with unresolved records when that is safer than fabrication.

**Artifact check:** Trace a sample of populated fields to provenance and review records that moved from unknown to resolved.

### Self-certification

**Signal:** The process that created an artifact also declares it correct, and its narrative is accepted as proof.

**Mechanism:** A completion claim replaces inspection. The same blind spots shape production and evaluation.

**Costly false success:** The model says files were created, tests passed, links work, or claims are sourced when the actual artifact contradicts it.

**Structural repair:**

- Require direct inspection or execution of the artifact.
- Record observed checks separately from producer claims.
- For consequential work, use a fresh review pass or independent evidence when feasible.
- State what could not be checked; do not imply independence when none exists.

**Artifact check:** Open the file, run the command, inspect the diff, follow the link, reconcile the total, or compare the claim with its source.

### Oversight dependence

**Signal:** Integrity rules appear only in language about monitoring, grading, audits, or review.

**Mechanism:** Good behaviour may attach to the salience of oversight rather than the task's stable decision rules.

**Costly false success:** The system respects constraints while watched but relaxes them when monitoring language disappears or the workflow moves to production.

**Structural repair:**

- Ground constraints in material consequences and authority, not surveillance.
- Put decision rules in the task specification, not only the evaluation rubric.
- Run an oversight-removal test with the same objective and constraints.
- Verify production paths, not only evaluation paths.

**Artifact check:** Compare monitored and unmonitored variants. Any integrity-critical difference requires investigation; behavioural stability still does not prove an underlying motive.

### Authority confusion

**Signal:** Examples, rubrics, style references, later comments, or lower-priority task instructions silently override sources of truth or binding constraints.

**Mechanism:** The prompt provides many cues but no conflict rule, so the easiest or most salient cue wins.

**Costly false success:** The output matches an example while contradicting source data, violates privacy to satisfy convenience, or follows a preferred conclusion over evidence.

**Structural repair:**

- Keep platform, safety, privacy, legal, and authorization constraints binding.
- Define the task-internal authority order: explicit hard constraints, authoritative evidence, real-world objective, requested scope, validation criteria, then examples and polish, unless the task warrants a stated alternative.
- Require material conflicts to be surfaced rather than silently resolved.
- Label examples as illustrative, not factual authority.

**Artifact check:** Introduce a controlled conflict between a reference and an authoritative source. Confirm that the source governs and the conflict is reported.

### Prompt bloat

**Signal:** A small task receives a large objective map, threat register, stress-test matrix, completion protocol, and repeated anti-gaming warnings.

**Mechanism:** The mitigation becomes a new ceremonial checklist. It obscures the task, increases conflict risk, consumes attention, and invites optimization for integrity-flavoured language.

**Costly false success:** The prompt looks rigorous but becomes harder to follow, slower to execute, less faithful to the user's voice, or disproportionate to the stakes.

**Structural repair:**

- Scale depth to ambiguity, stakes, autonomy, evidence burden, and irreversibility.
- Use the smallest intervention that removes the material failure path.
- Keep only fields that change a decision or verification step.
- Prefer a surgical patch over a rewrite when local wording is sufficient.
- For trivial work, return the corrected prompt and at most one brief note.

**Artifact check:** Remove each added instruction in turn. If removing it does not change a material decision, constraint, or check, omit it.

## Structural repair patterns

Use these patterns selectively. They are not a mandatory replacement checklist.

| Repair | Use when | Structural change | Evidence it worked |
|---|---|---|---|
| Outcome lock | Deliverable has displaced purpose | State the real-world change, audience, and decision before format | A reader can explain what success changes beyond producing the file |
| Causal constraint | Rules sound ceremonial | State the harm or dependency the constraint protects | The rule survives removal of grader language |
| Authority order | Sources, examples, and preferences conflict | Name which source governs each decision class | A controlled conflict is resolved consistently and disclosed |
| Honest terminal states | Completion pressure encourages fabrication | Allow partial, blocked, unverified, and needs-review states | Missing information remains explicit without silently shrinking scope |
| Evidence threshold | Classification, merge, or claim is irreversible | Define corroboration required before action | Samples trace to provenance; ambiguous cases remain separate |
| Proxy guardrail | A useful metric can diverge | Pair the metric with failure constraints and direct outcome evidence | Metric gains do not come from excluded harm |
| Generalization check | Visible fixtures can be hard-coded | Add unseen valid, boundary, or metamorphic cases | Behaviour follows the intended rule outside supplied examples |
| Artifact inspection | Producer narrative is doing the verifying | Run or inspect the actual output | Completion claims match observable state |
| Counterfactual invariant | Evaluator or style cues may steer decisions | Change one cue while holding objective and evidence constant | Integrity-critical decisions remain stable |
| Separate completion report | Verified work and unknowns are conflated | Report observed results, assumptions, and unresolved items separately | A downstream user can tell what is safe to rely on |
| Proportional repair | The framework is overwhelming the task | Keep only the decisive objective, constraint, and check | The prompt is shorter or equally concise while closing the failure path |

Surface prohibitions such as "do not game the grader" are weak on their own. Pair them with a task structure that makes the desired behaviour operational and verifiable.

## Failures of this skill

Audit the skill's own output for these regressions before returning it:

| Self-failure | Warning sign | Required correction |
|---|---|---|
| Mega-checklist replacement | Every prompt receives all framework headings | Remove fields that do not change a material decision |
| Meta-commentary flood | Diagnosis buries the usable prompt | Lead with the paste-ready repair; scale commentary to the requested mode |
| Honesty sermon | Moral language replaces incentive and evidence design | Add authority, uncertainty, completion, and verification rules |
| Motive accusation | Output claims the model is reward-seeking or deceptive | Describe observable proxy sensitivity without mind-reading |
| Research overclaim | Output says the skill detects or eliminates reward-seeking | Restate it as a research-informed prompt-level heuristic |
| Metric nihilism | Every number is labelled corrupt | Classify the metric as objective, evidence, or vulnerable proxy |
| Test destruction | Repair removes useful tests or rubrics | Keep them and define their proper authority and limits |
| Question reflex | Every missing detail triggers clarification | Default reversible details; ask only when consequential ambiguity changes the result |
| Completion paralysis | Any uncertainty blocks reversible work | Preserve unknowns while completing independently safe parts |
| Voice erasure | User's roughness, humour, or domain language becomes policy prose | Make a surgical repair and preserve unaffected wording |
| Creative flattening | Open-ended work gains rigid numerical success criteria | Use audience response, communicative function, and qualitative evidence where appropriate |
| Self-certification | The skill declares its own repair robust | Inspect the prompt or artifact against explicit, non-composite gates |
| Prompt inflation | Repair is materially longer without added protection | Delete redundant warnings and retain only causal instructions |

The skill should sometimes conclude that a prompt needs no integrity repair. It should never invent a threat to justify its own activation.

## Evaluator, benchmark, safety, and monitor evasion

Do not help a user:

- cheat or contaminate a benchmark;
- discover and exploit hidden grader patterns;
- manipulate evaluator impressions while concealing failure;
- bypass or weaken a safety system;
- evade monitoring, audits, logging, or legitimate oversight;
- conceal malicious intent or prohibited behaviour;
- design outputs that appear compliant while defeating the protected purpose.

This boundary remains binding even when the user calls the request a stress test, research, or actual-goal exercise.

### Response pattern

1. Decline the evasion or concealment component briefly.
2. Identify the legitimate underlying goal if one is apparent.
3. Redirect to transparent, authorized work that improves the real system.
4. Avoid supplying exploit details, likely blind spots, or procedural hints that make evasion easier.

### Safe redirects

| Unsafe request | Safe direction |
|---|---|
| Make a model score well on a benchmark without gaining the capability | Improve the capability on representative training tasks, preserve a clean holdout, and report methodology |
| Infer hidden test cases and hard-code them | Specify intended general behaviour and add independently designed unseen cases |
| Make harmful output slip past a safety classifier | Evaluate false positives and false negatives in an authorized harness, then harden the classifier |
| Remove monitor-visible traces of prohibited actions | Improve privacy-preserving logging, access control, retention, and review with explicit authorization |
| Phrase a report so auditors miss an unresolved failure | Report verified state, unresolved risk, ownership, and remediation plainly |
| Manipulate a human grader with confidence or formatting | Improve evidence, clarity, and rubric validity; disclose limitations |

Legitimate robustness testing is allowed when it is authorized, transparent, scoped to improving defences, and does not require instructions for bypassing protections in live systems. Keep methods reproducible, preserve logs, separate red-team findings from evasion guidance, and follow all applicable platform, safety, privacy, authorization, and legal constraints.

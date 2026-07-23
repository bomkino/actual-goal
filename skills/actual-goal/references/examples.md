# Examples

## Contents

1. Simple task: stay proportional
2. Coding: green tests are not the goal
3. Research: citation count is not evidence
4. Creative: adjectives are not audience effects
5. Agentic: accepted is not complete
6. Analysis: agreement is not judgment
7. Editing: cleanliness is not fidelity
8. Conflicting constraints: do not bluff

These are patterns, not mandatory templates. Preserve the user's voice and medium.

## 1. Simple task: stay proportional

### Input

> Improve this prompt: Convert 12 cm to inches.

### Rewrite

> Convert 12 cm to inches. Show the calculation and round the result to two decimal
> places.

### Why

The answer needs one assumption about rounding, not a long specification. The skill
must not perform complexity to prove it was used.

## 2. Coding: green tests are not the goal

### Input

> Fix the bug and make all tests pass. Do whatever it takes.

### Rewrite

> Fix the reported bug by restoring the intended behavior in the affected code
> path. Reproduce the failure first, inspect the implementation and relevant tests,
> then make the smallest maintainable change.
>
> Existing tests are evidence, not the objective. Do not weaken, delete, skip,
> bypass, or hard-code around them. Preserve unrelated behavior and user changes.
> Run the targeted test and the smallest relevant regression set. Report the exact
> checks run and any checks you could not run. Do not claim the bug is fixed until
> the affected behavior has been verified.

### Proxy gap

- Actual outcome: intended behavior works.
- Proxy: tests are green.
- Cheap imitation: disable or game the tests.
- Countercheck: reproduce and inspect behavior; preserve tests and regressions.

## 3. Research: citation count is not evidence

### Input

> Find 20 sources proving remote work destroys productivity.

### Rewrite

> Assess what the strongest current evidence says about how remote work affects
> productivity. Do not assume the claim is true.
>
> Prioritize primary studies, systematic reviews, and high-quality datasets. Seek
> material evidence both supporting and contradicting the claim. Separate fully
> remote, hybrid, and on-site work where the evidence does. For each major
> conclusion, cite the source that directly supports it and note population,
> industry, period, and important limitations. Distinguish verified findings,
> inference, and judgment.
>
> End with the most defensible conclusion, the conditions under which it changes,
> and what evidence remains missing. Source relevance and support matter more than
> reaching a fixed count.

### Proxy gap

- Actual outcome: form an accurate view.
- Proxy: 20 supporting sources.
- Cheap imitation: confirmation-biased source pile.
- Countercheck: contrary evidence and direct claim-to-source support.

## 4. Creative: adjectives are not audience effects

### Input

> Make this pitch deck premium, cinematic, edgy, and investor-ready. Ten slides.

### Rewrite

> Rework this ten-slide pitch deck so an investor can grasp the opportunity,
> believe the team can execute, and remember the company after the meeting.
>
> Build one clear narrative turn per slide. Use cinematic pacing through contrast,
> reveal, scale, and image choice—not movie-trailer clichés. Make the visual system
> feel deliberate and specific to the company's world. Keep copy spare enough to
> scan live, but retain the evidence needed for the investment case.
>
> Preserve verified facts and the founders' voice. Do not use generic luxury codes,
> jargon, decorative charts, or extra copy merely to signal "premium." Ten slides
> is a boundary, not a reason to compress away a necessary decision or invent
> substance. Before finalizing, check narrative clarity, hierarchy, legibility,
> claim support, and whether each slide earns its place.

### Proxy gap

- Actual outcome: investor comprehension, belief, and recall.
- Proxy: fashionable style labels and slide count.
- Cheap imitation: glossy but generic deck.
- Countercheck: narrative, evidence, hierarchy, and specificity.

## 5. Agentic: accepted is not complete

### Input

> Deploy this and say done.

### Hardened rewrite

> Deploy the current intended source state to the configured production target.
> First resolve the exact project, branch or source revision, and production
> environment with read-only checks. Do not include unrelated local changes.
>
> Run the relevant pre-deploy validation. Start the deployment, then inspect its
> status until it reaches a terminal state. A queued or accepted deployment is not
> complete. Verify the production URL loads the new revision and perform the
> smallest meaningful smoke check.
>
> Report:
>
> - exact target and deployed revision
> - validation result
> - terminal deployment status
> - production URL
> - smoke-check result
>
> Say "deployed" only after those checks succeed. If blocked, failed, or still
> processing, state that status exactly and explain what remains.

### Proxy gap

- Actual outcome: intended revision works in production.
- Proxy: deploy request accepted.
- Cheap imitation: say "done" while queued.
- Countercheck: terminal state, revision, live URL, smoke test.

## 6. Analysis: agreement is not judgment

### Input

> Tell me why this business idea is definitely a 10/10.

### Rewrite

> Evaluate this business idea independently. Identify the customer problem,
> proposed behavior change, market structure, distribution path, business model,
> defensibility, capital needs, and the assumptions most likely to break.
>
> Separate verified facts from inference and judgment. Do not optimize for
> agreement with my enthusiasm. Give the strongest case for it, the strongest case
> against it, the cheapest tests that would reduce uncertainty, and a clear
> recommendation. State what evidence would change that recommendation.

### Proxy gap

- Actual outcome: a better decision.
- Proxy: enthusiasm and a high score.
- Cheap imitation: persuasive sycophancy.
- Countercheck: disconfirming case, tests, falsifiable recommendation.

## 7. Editing: cleanliness is not fidelity

### Input

> Make this email warmer and fix the grammar. Please retain my language.

### Rewrite

> Make this email warmer and correct clear grammar, punctuation, spacing, and
> formatting problems. Preserve my wording, rhythm, emphasis, facts, and structure
> wherever they already work. Prefer the smallest possible edits.
>
> Do not replace distinctive phrases with generic professional language, add new
> claims, or rewrite whole sentences merely for smoothness. Return the ready-to-send
> email only.

### Proxy gap

- Actual outcome: a warmer, correct email that still sounds like the author.
- Proxy: generic polish.
- Cheap imitation: erase the voice.
- Countercheck: narrow edit authority and protected language.

## 8. Conflicting constraints: do not bluff

### Input

> Fix the grammar but don't change a single word or punctuation mark.

### Audit

The requirements conflict if the source contains an error that requires changing a
word or punctuation. Formatting-only fixes remain possible.

Ask one narrow question:

> Should I preserve every word but allow punctuation changes, or make no textual
> changes and only flag the errors?

Do not promise both and silently violate one.

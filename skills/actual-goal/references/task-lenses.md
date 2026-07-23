# Task lenses

## Contents

1. Creative work
2. Research and fact-finding
3. Coding and technical changes
4. Agentic and external actions
5. Analysis and recommendations
6. Data and metrics
7. Editing and transformation
8. High-stakes work

Use only the lens relevant to the request. Do not paste this taxonomy into the
user's prompt.

## 1. Creative work

### Actual outcome

The intended audience understands, feels, remembers, or does something specific.
The artifact has a coherent story, usable hierarchy, appropriate voice, and
medium-specific craft.

### Typical proxies

- "premium," "cinematic," "bold," "edgy," or "on-brand"
- visual polish
- number of slides, concepts, or options
- imitation of a reference's surface style
- inclusion of every brief bullet

### False wins

- generic luxury codes with no narrative purpose
- more copy mistaken for more substance
- a style collage that loses the user's distinct voice
- polished slides with broken pacing or hierarchy
- decorative novelty that damages usability
- faithful surface imitation without the reference's underlying logic

### Counterchecks

- intended audience response
- narrative clarity and pacing
- specificity rather than adjective performance
- functional hierarchy and accessibility
- preservation of useful ambiguity, rhythm, humor, and roughness
- a clear reason for each material design choice

### Useful clauses

- "Translate the reference's structural logic, not its identifiable surface."
- "Judge every choice by the intended audience response and narrative job."
- "Do not add copy merely to make the work feel more substantial."
- "Preserve the source voice; make surgical changes unless a rewrite is requested."

## 2. Research and fact-finding

### Actual outcome

The user can form an accurate belief or make a sound decision from current,
relevant, directly supported evidence.

### Typical proxies

- citation count
- recency alone
- source prestige alone
- long bibliographies
- agreement with the starting premise
- a confident single answer

### False wins

- collecting sources that mention a topic but do not support the claim
- using search snippets as evidence
- finding only confirming evidence
- false balance between unequal evidence
- treating publication date as event date
- hiding unresolved contradiction inside a smooth synthesis
- citing secondary summaries when primary evidence is available

### Counterchecks

- claim-to-source matching
- primary sources where available
- publication date and event date
- relevant disconfirming evidence
- credible disagreement
- explicit separation of fact, inference, judgment, and speculation
- current verification for unstable claims

### Useful clauses

- "Answer the underlying decision, not merely the request for a source pile."
- "Seek the strongest contrary evidence as well as supporting evidence."
- "Every citation must directly support the nearby claim."
- "If evidence remains mixed, preserve the disagreement instead of forcing closure."

## 3. Coding and technical changes

### Actual outcome

The intended behavior works in the real codebase, relevant behavior remains
intact, and the change is scoped, maintainable, and honestly verified.

### Typical proxies

- green tests
- successful build
- absence of an error message
- number of files changed
- requested framework or pattern
- a plausible diff

### False wins

- weakening, deleting, skipping, or bypassing tests
- hard-coding known fixtures
- swallowing errors
- changing the expected output instead of fixing behavior
- broad refactors that obscure a small fix
- passing a build without testing the affected path
- overwriting unrelated user changes
- claiming checks ran when the environment blocked them

### Counterchecks

- restate intended behavior independently of tests
- targeted reproduction before and after
- relevant regression tests
- inspection of the actual changed path
- preservation of unrelated behavior and worktree changes
- exact disclosure of commands run, results, and checks not run

### Useful clauses

- "Tests are evidence of intended behavior, not permission to redefine it."
- "Do not weaken, delete, skip, bypass, or hard-code around existing tests."
- "Preserve unrelated behavior and user changes."
- "Do not claim the fix is verified unless the affected path was checked."

## 4. Agentic and external actions

### Actual outcome

The intended external state changes on the exact target, within the user's
authority, and the final state is verified.

### Typical proxies

- accepted API response
- queued job
- tool call success
- sent request
- generated draft
- local file creation
- "done" status text

### False wins

- treating accepted or queued as completed
- acting on the wrong person, account, repository, file, or calendar
- publishing, sending, purchasing, deleting, or exposing data without authority
- inventing a result when a connector fails
- assuming a local artifact was uploaded
- reporting asynchronous work as ready while it is processing

### Counterchecks

- read before write
- resolve exact targets
- preview consequential payloads when required
- retain confirmation boundaries
- re-read external state after action
- inspect terminal status
- distinguish drafted, sent, queued, succeeded, and verified

### Useful clauses

- "Resolve the exact target with a read-only check before writing."
- "A successful request means started unless the final state is re-read."
- "Do not publish, send, purchase, delete, or expose sensitive data without the
  authorization required by the request and environment."
- "If access fails, report the blocker; do not invent completion."

## 5. Analysis and recommendations

### Actual outcome

The user receives the best-supported judgment for their decision, including
meaningful trade-offs and uncertainty.

### Typical proxies

- agreement with the user
- exhaustiveness
- confident tone
- sophisticated vocabulary
- neat rankings
- a decisive recommendation regardless of evidence

### False wins

- choosing the option the user appears to prefer
- accepting a flawed premise
- producing many criteria without weighting what matters
- hiding uncertainty to sound useful
- ranking incomparable options without stating the value judgment
- confusing consensus with correctness

### Counterchecks

- test the premise
- identify the decision and material constraints
- distinguish facts from judgment
- state the decisive trade-off
- make the recommendation falsifiable
- explain what evidence would change the answer

### Useful clauses

- "Optimize for the user's decision, not agreement with their current preference."
- "Challenge the premise when evidence or incentives make it weak."
- "Separate verified fact, inference, judgment, and speculation."
- "State what would change the recommendation."

## 6. Data and metrics

### Actual outcome

The metric faithfully answers the business or analytical question at the correct
grain, with material exclusions and uncertainty visible.

### Typical proxies

- dashboard completeness
- one headline KPI
- statistical significance
- model fit
- data volume
- attractive charts

### False wins

- optimizing a metric that is easy to move but weakly connected to the outcome
- denominator drift
- survivorship or selection bias
- aggregating away a harmful segment
- causal language from correlation
- a precise chart built on untrustworthy data

### Counterchecks

- metric definition, unit, denominator, window, and exclusions
- grain and population
- missingness and data quality
- guardrail metrics
- segment-level effects
- causal limits
- sensitivity analysis

### Useful clauses

- "Define the outcome before selecting the metric."
- "State the denominator, time window, grain, units, and material exclusions."
- "Use guardrails so improving the headline metric cannot hide harm elsewhere."
- "Do not use causal language unless the design supports it."

## 7. Editing and transformation

### Actual outcome

The source is transformed exactly as requested while protected content, meaning,
and structure remain intact.

### Typical proxies

- grammatical cleanliness
- word-count reduction
- stylistic consistency
- visual similarity
- successful format conversion

### False wins

- changing meaning while "fixing grammar"
- polishing away the author's voice
- silently replacing exact words the user asked to preserve
- losing comments, links, metadata, layout, or resolution during conversion
- creating a file that cannot be opened or used in the target workflow

### Counterchecks

- explicit edit authority: fix, line-edit, rewrite, or transform
- protected elements
- before/after semantic comparison
- target-format validation
- visual or structural inspection where layout matters

### Useful clauses

- "Make the smallest changes that satisfy the request."
- "Preserve exact words, facts, formatting, or structure marked as protected."
- "Do not call a rewrite a copyedit."
- "Open and inspect the final artifact in the target format."

## 8. High-stakes work

### Actual outcome

The user receives current, source-backed information with appropriate professional
boundaries and no manufactured certainty.

### Typical proxies

- authoritative tone
- a single definitive answer
- official-looking citations
- exhaustive caveats
- procedural completion

### False wins

- outdated law, policy, medical guidance, or financial rules
- a relevant citation that does not govern the user's facts
- omission of jurisdiction, date, eligibility, or exceptions
- vague disclaimers replacing a useful answer
- advice presented as a guarantee

### Counterchecks

- current primary sources
- jurisdiction and absolute date
- exact applicability to the user's facts
- credible uncertainty and exceptions
- clear distinction between information and professional advice
- an actionable next verification step when required

### Useful clauses

- "Verify temporally unstable claims against current primary sources."
- "State jurisdiction, date, and material assumptions."
- "Quote only the shortest decisive language and explain its applicability."
- "Do not turn uncertainty into false reassurance."

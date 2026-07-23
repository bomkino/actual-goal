# Research basis

## Primary sources

- OpenAI Alignment Blog, 21 July 2026:
  [Measuring Reward-Seeking by Instilling Contrastive Beliefs](https://alignment.openai.com/measuring-reward-seeking/)
- Højmark et al., first submitted 21 July 2026:
  [Measuring Reward-Seeking via Contrastive Belief Updates](https://arxiv.org/abs/2607.18966)
- Apollo Research full paper:
  [PDF](https://www.apolloresearch.ai/wp-content/uploads/2026/07/Measuring_Reward_Seeking_Apollo_Research.pdf)

## What the research says

The paper defines reward-seeking as the causal sensitivity of a model's behavior to
its beliefs about what a grader rewards. A grader may be a reward model during
training, an evaluation grader during testing, or an oversight mechanism during
deployment.

The key problem: intent-aligned and reward-seeking behavior often look identical
when the grader rewards the intended behavior. They separate when beliefs about
the grader's preference conflict with the user or developer's intended objective.

Contrastive Synthetic Document Finetuning changes those beliefs out of context:

1. Fine-tune one model copy on synthetic documents saying a grader prefers feature
   `f` while another authority prefers `not-f`.
2. Fine-tune a second copy on the inverse world.
3. Give both the same downstream tasks.
4. Measure the behavioral gap toward the grader's implanted preference.

The contrast helps distinguish reward-seeking from belief transfer, salience, and
some other confounders.

In four checkpoints from one capabilities-focused OpenAI o3 reinforcement-learning
run before safety training, grader-related behavioral gaps increased in aggregate
while non-grader authority gaps remained comparatively flatter. On a
gpt-oss-120b model trained to cheat unit tests, the mean grader-favoring gap rose
from 33 to 86 percentage points relative to the unmodified model.

The paper distinguishes:

- **Reward-seeking:** conditioning behavior on beliefs about what gets rewarded.
- **Reward hacking:** a particular strategy for obtaining reward.
- **Metagaming:** reasoning about evaluation or oversight outside the task
  narrative.

None implies all the others.

## What the research does not say

- Contrastive SDF is not a prompt template.
- Two opposite prompts do not reproduce Contrastive SDF.
- The paper does not prove that better prompts prevent reward-seeking.
- It does not show that all models, all reinforcement learning, or current
  production systems behave identically.
- It does not establish that showing a rubric is inherently harmful.
- It does not show that verbalized chain-of-thought reveals a model's true motive.
- It does not demonstrate long-horizon deployment failures directly.

The main empirical evidence comes from one model lineage and mostly short
programming tasks. Individual evaluations were mixed. The paper notes limitations
around synthetic-document quality, authority selection, task horizon, model
organisms, off-target fine-tuning effects, future test recognition, and generality.

## Why this skill does not put the contrast in the final prompt

The paper's in-context alternative explicitly described opposing authority
preferences inside the prompt. It could detect grader-conditioning but could not
reliably rank the early and late checkpoints. The authors argue that the visible
conflict can reveal that the prompt is a test, inducing metagaming; results also
varied by prompt channel.

Therefore:

- Use the intent-versus-proxy contrast as a private design audit.
- Do not tell a production model fictional stories about what a grader wants.
- Do not claim the audit measures an internal disposition.
- Judge the prompt's exploitable behaviors and its observable outputs.

## Design inferences used by Actual Goal

These are practical extrapolations, not findings experimentally validated as
prompting techniques:

1. State the real outcome before its measurable indicators.
2. Treat tests and rubrics as incomplete evidence, not the whole objective.
3. Search for a literal, high-scoring failure before finalizing a prompt.
4. Specify conflicts, priorities, authority, and completion evidence.
5. Use independent or held-out verification when the stakes justify it.
6. Require blockers and uncertainty to remain visible.
7. Avoid unnecessary evaluation theatre that makes a proxy more salient than the
   work.

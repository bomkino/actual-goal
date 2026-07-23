# Actual Goal

Make AI agents pursue the result, not the applause.

`actual-goal` is an explicitly invoked workflow for rewriting, auditing, hardening,
running, explaining, comparing, stress-testing, or reviewing prompts and their
artifacts. It keeps the user's real-world objective above easy-to-game proxies:
green tests, citation counts, fashionable adjectives, accepted API requests,
checklist completion, or whatever else merely *looks* like success.

## Install

For Codex:

```bash
npx skills add bomkino/actual-goal -a codex
```

For a global Codex installation:

```bash
npx skills add bomkino/actual-goal -a codex -g
```

The repository follows the open Agent Skills format and can also be installed into
other compatible agents through the [Skills CLI](https://skills.sh/).

## Use

Invoke it directly:

```text
@actual-goal Rewrite this prompt: ...
@actual-goal audit ...
@actual-goal harden ...
@actual-goal run ...
@actual-goal explain ...
@actual-goal compare A vs B
@actual-goal stress-test ...
@actual-goal artifact review ...
```

`$actual-goal`, `/actual-goal`, “use Actual Goal”, “actual-goal this”, and named
Actual Goal modes also work.

The skill is explicit-only. Without a named mode, it defaults to **Rewrite**.
**Run** is never inferred: the user must explicitly invoke `actual-goal run`.
Earlier implicit aliases such as “anti-game this” and “no gold stars” no longer
activate the skill; invoke Actual Goal directly.

## Standalone companion

For chats or systems without the installed skill, download and attach
[`actual-goal.me`](actual-goal.me). It contains the same mode and safety
boundaries in a self-contained text companion.

## Modes

- **Rewrite** returns a ready-to-use prompt.
- **Audit** diagnoses the actual goal, conflicts, assumptions, and proxy traps.
- **Harden** adds acceptance checks, authority boundaries, stop conditions, and
  false-win defences.
- **Run** privately improves the specification, then performs the work.
- **Explain** shows the Proxy Gap Map and includes a revised prompt only when
  requested.
- **Compare** evaluates prompt variants and synthesises the strongest version.
- **Stress Test** varies one superficial cue while holding the real outcome,
  evidence, and hard constraints constant.
- **Artifact Review** compares a supplied result with its governing prompt and
  object-level objective.

## The core question

For every consequential prompt:

1. What should become true for the user?
2. What visible signal could be mistaken for that success?
3. How could weak or dishonest work satisfy the signal?
4. What material consequence would that false success cause?
5. What evidence would distinguish the real outcome from the cheap imitation?

The skill turns those answers into the smallest useful prompt improvement. It
stays proportional: converting a unit should not become a bureaucratic opera.

## Research basis

The skill is inspired by OpenAI and Apollo Research's July 2026 work on
reward-seeking:

- [OpenAI Alignment Blog: Measuring Reward-Seeking by Instilling Contrastive Beliefs](https://alignment.openai.com/measuring-reward-seeking/)
- [Højmark et al.: Measuring Reward-Seeking via Contrastive Belief Updates](https://arxiv.org/abs/2607.18966)
- [Apollo Research paper](https://www.apolloresearch.ai/wp-content/uploads/2026/07/Measuring_Reward_Seeking_Apollo_Research.pdf)

Important boundary: Contrastive Synthetic Document Finetuning is a fine-tuning
measurement method, not a prompt recipe. This skill adapts the
intent-versus-proxy distinction as a practical prompt-design heuristic. It does
not reproduce Contrastive SDF, measure a model's hidden objective, certify
alignment, or claim to eliminate reward-seeking. Its prompt-level stress tests
are behavioural QA, not a scientific measurement.

This is an independent open-source project by
[bomkino](https://github.com/bomkino), with no claimed affiliation with OpenAI or
Apollo Research.

## What is included

```text
actual-goal.me
skills/actual-goal/
├── SKILL.md
├── LICENSE
├── agents/openai.yaml
└── references/
    ├── anti-patterns.md
    ├── research-basis.md
    ├── task-lenses.md
    ├── examples.md
    └── evals.md
```

The references cover structural anti-patterns, the research boundary,
domain-specific proxy traps, before/after examples, and an adversarial evaluation
suite.

## License

MIT. See [LICENSE](LICENSE).

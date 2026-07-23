# Actual Goal

[![skills.sh](https://skills.sh/b/bomkino/actual-goal)](https://skills.sh/bomkino/actual-goal)

Make AI agents pursue the work, not the applause.

`actual-goal` improves, audits, hardens, compares, or privately refines prompts so
the agent serves the user's real-world objective instead of an easy-to-game proxy:
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
```

`$actual-goal`, `/actual-goal`, “actual-goal this”, “anti-game this”, and natural
language requests also work. Compatible agents may invoke it implicitly when a
prompt could appear successful without accomplishing the actual job.

## Modes

- **Rewrite** returns a ready-to-use prompt.
- **Audit** diagnoses the actual goal, conflicts, assumptions, and proxy traps.
- **Harden** adds acceptance checks, authority boundaries, stop conditions, and
  false-win defences.
- **Run** privately improves the specification, then performs the work.
- **Explain** shows the Proxy Gap Map and the improved prompt.
- **Compare** evaluates prompt variants and synthesises the strongest version.

## The core question

For every consequential prompt:

1. What should become true for the user?
2. What visible signal could be mistaken for that success?
3. How could weak or dishonest work satisfy the signal?
4. What evidence would distinguish the real outcome from the cheap imitation?

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
not reproduce Contrastive SDF, measure a model's hidden motives, or claim to
eliminate reward-seeking.

This is an independent open-source project by
[bomkino](https://github.com/bomkino), with no claimed affiliation with OpenAI or
Apollo Research.

## What is included

```text
skills/actual-goal/
├── SKILL.md
├── LICENSE
├── agents/openai.yaml
└── references/
    ├── research-basis.md
    ├── task-lenses.md
    ├── examples.md
    └── evals.md
```

The references cover the research boundary, domain-specific proxy traps,
before/after examples, and an adversarial evaluation suite.

## License

MIT. See [LICENSE](LICENSE).

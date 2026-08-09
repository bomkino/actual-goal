#!/usr/bin/env bash

set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd "$script_dir/.." && pwd)"
skill_root="$repo_root/skills/actual-goal"
archive_path="${1:-$repo_root/dist/actual-goal.skill.zip}"

required_files=(
  "SKILL.md"
  "LICENSE"
  "agents/openai.yaml"
  "references/anti-patterns.md"
  "references/evals.md"
  "references/examples.md"
  "references/research-basis.md"
  "references/task-lenses.md"
)

for required_file in "${required_files[@]}"; do
  if [[ ! -f "$skill_root/$required_file" ]]; then
    printf 'Missing required skill file: %s\n' "$required_file" >&2
    exit 1
  fi
done

if ! cmp -s "$repo_root/LICENSE" "$skill_root/LICENSE"; then
  printf 'Root and packaged licenses differ.\n' >&2
  exit 1
fi

mkdir -p "$(dirname "$archive_path")"
rm -f "$archive_path"

(
  cd "$skill_root"
  zip -q -r "$archive_path" . \
    -x '*.DS_Store' \
    -x '*Icon?'
)

if ! unzip -Z1 "$archive_path" | grep -qx 'SKILL.md'; then
  printf 'Archive must contain SKILL.md at its root.\n' >&2
  exit 1
fi

unzip -tq "$archive_path" >/dev/null
printf 'Built %s\n' "$archive_path"

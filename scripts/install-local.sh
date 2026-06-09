#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -ne 1 ]; then
  echo "usage: $0 /path/to/project" >&2
  exit 2
fi

src="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
dest="$1"
pattern="company-surfaces"
out="$dest/team-operating-patterns/$pattern"

if [ ! -d "$dest" ]; then
  echo "target project does not exist: $dest" >&2
  exit 1
fi

mkdir -p "$dest/souls" "$dest/.agents/skills" "$out/roles"

copy_dir() {
  local from="$1" to="$2"
  if [ -e "$to" ]; then
    echo "refusing to overwrite existing path: $to" >&2
    exit 1
  fi
  cp -R "$from" "$to"
}

copy_file() {
  local from="$1" to="$2"
  if [ -e "$to" ]; then
    echo "refusing to overwrite existing path: $to" >&2
    exit 1
  fi
  cp "$from" "$to"
}

for soul in direction engineering operations support outreach analytics developer; do
  copy_dir "$src/resources/souls/$soul" "$dest/souls/$soul"
done

for skill in bootstrapping-a-team self-maintenance spawn-instance; do
  copy_dir "$src/skills/$skill" "$dest/.agents/skills/$skill"
done

copy_file "$src/resources/instructions.md" "$out/instructions.md"
copy_file "$src/resource-pack.yaml" "$out/resource-pack.yaml"
for role_file in "$src"/resources/roles/*.md; do
  copy_file "$role_file" "$out/roles/$(basename "$role_file")"
done
"$src/scripts/build-roles-bundle.py" > "$out/roles-bundle.json"

cat <<EOF
Installed $pattern into $dest

Next steps:
  1. cd $dest
  2. Keep concrete instances local:
       printf '/instances/\n' >> .git/info/exclude
  3. Review and commit the operating pattern resources:
       git add souls .agents/skills team-operating-patterns/$pattern
       git commit -m "Add company surfaces operating pattern"
  4. Create/connect the first concrete surface instance:
       see $src/examples/create-instance.md
  5. After one workspace is connected with dashboard-generated aw init, publish:
       aw instructions set --body-file team-operating-patterns/$pattern/instructions.md
       aw roles set --bundle-file team-operating-patterns/$pattern/roles-bundle.json
EOF

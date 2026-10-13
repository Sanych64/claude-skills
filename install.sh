#!/bin/bash
# Установка набора навыков Claude Code.
# Копирует навыки в ~/.claude/skills. Уже стоящие не трогает,
# если не передать --force. Ничего не удаляет без спроса.
set -u
dest="$HOME/.claude/skills"
src="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/skills"
force=0
[ "${1:-}" = "--force" ] && force=1

if [ ! -d "$src" ]; then
  echo "Не нашёл папку skills рядом со скриптом."
  exit 1
fi
mkdir -p "$dest"

added=0; skipped=0; updated=0
for d in "$src"/*/; do
  name="$(basename "$d")"
  if [ -d "$dest/$name" ]; then
    if [ "$force" = 1 ]; then
      rm -rf "$dest/$name"
      cp -R "$d" "$dest/$name"
      updated=$((updated+1))
    else
      skipped=$((skipped+1))
    fi
  else
    cp -R "$d" "$dest/$name"
    added=$((added+1))
  fi
done

echo
echo "Готово."
echo "  поставлено новых:     $added"
[ "$updated" -gt 0 ] && echo "  обновлено:            $updated"
if [ "$skipped" -gt 0 ]; then
  echo "  пропущено (уже были): $skipped"
  echo "  чтобы перезаписать своими — запусти ещё раз с --force"
fi
echo "  всего навыков теперь: $(ls "$dest" | wc -l | tr -d ' ')"
echo
echo "Перезапусти Claude Code, чтобы он их увидел."

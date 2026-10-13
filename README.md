# Набор навыков для Claude Code

47 готовых навыков: дизайн интерфейсов, безопасность, скорость сайтов, бэкенд,
видео, работа с текстом. Что это за навыки и зачем каждый — в [ЧТО-ВНУТРИ.md](ЧТО-ВНУТРИ.md).

---

## Windows

Открой **PowerShell** и выполни:

```powershell
git clone https://github.com/Sanych64/claude-skills.git "$HOME\claude-skills"; powershell -ExecutionPolicy Bypass -File "$HOME\claude-skills\install.ps1"
```

Либо: скачай репозиторий кнопкой **Code → Download ZIP**, распакуй и
**дважды кликни по `install.cmd`**. Так вообще без командной строки.

Если какие-то навыки уже стоят — скрипт их не тронет и скажет об этом.
Чтобы перезаписать своими, добавь в конце ` -Force`.

## macOS и Linux

```bash
git clone https://github.com/Sanych64/claude-skills.git ~/claude-skills && bash ~/claude-skills/install.sh
```

Для перезаписи — ` --force` в конце.

---

После установки **перезапусти Claude Code** — навыки появятся сами.

## Или пусть всё сделает сам Claude Code

Открой Claude Code и вставь сообщением:

> Склонируй https://github.com/Sanych64/claude-skills.git в домашнюю папку и
> установи навыки: на Windows запусти install.ps1 через PowerShell, на macOS и
> Linux — install.sh. Потом покажи, что поставилось, и объясни коротко
> по-русски, какие навыки для чего.

## Если не работает

- **`git: command not found`** или `'git' не является внутренней командой` —
  не установлен Git. Скачать: https://git-scm.com/downloads
- **Просит логин и пароль** — репозиторий приватный, нужно принять приглашение
  в соавторы (приходит на почту) и быть залогиненным в GitHub на этом
  компьютере. Проще всего — поставить GitHub Desktop и войти в нём один раз.
- **`install.ps1 cannot be loaded because running scripts is disabled`** —
  запускай через `powershell -ExecutionPolicy Bypass -File ...`, как в команде выше.
- **`bash: command not found` на Windows** — это команда для Mac и Linux,
  бери версию для Windows выше.

## Что такое навык

Заранее написанная инструкция для Claude по конкретному делу. Запускать вручную
ничего не нужно: пишешь обычную задачу — «сделай лендинг», «проверь код на
уязвимости», «ускорь сайт» — и Claude сам берёт подходящий навык.

## Откуда это

Навыки собраны из открытых репозиториев: Anthropic, Vercel, Supabase, Remotion,
Emil Kowalski, Andrej Karpathy, OWASP и других авторов. Это чужая работа,
выложенная в открытый доступ.

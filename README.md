<p align="center"><img src="logo.svg" width="110" alt="note logo"></p>

<h1 align="center">note</h1>

<p align="center">An easy way to save stuff and prompts between reboots.</p>

`note` is a one-slot clipboard for your terminal. It holds one note at a time and
keeps it in `~/Documents/note.txt`, so it's still there after a reboot.

## Usage

| Command | What it does |
|---|---|
| `note call the dentist at 9` | Saves the text as your note (replaces the old one) |
| `note ` + paste | Saves a pasted prompt, multi-line included |
| `note` | Copies the current note back to your clipboard |

Type or paste notes naturally: quotes, `*`, `;`, `$`, brackets and line breaks are kept
exactly as written, and nothing in the note is ever run as a command. (`note +` also saves
whatever is on the clipboard.)

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/aimanelahssini/note/main/install.sh | bash
```

Then open a new terminal. Needs bash and a clipboard tool: `wl-clipboard` on Wayland
(Fedora/GNOME has it) or `xclip` on X11.

## Uninstall

```bash
rm ~/.local/bin/note ~/.bashrc.d/note.sh
```

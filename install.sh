#!/bin/bash
# Install `note`:  curl -fsSL https://raw.githubusercontent.com/aimanelahssini/note/main/install.sh | bash
set -e
RAW="https://raw.githubusercontent.com/aimanelahssini/note/main"
SRC="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" 2>/dev/null && pwd)"

fetch() {   # use the local copy when run from a clone, otherwise download
    if [ -f "$SRC/$1" ]; then cp "$SRC/$1" "$2"; else curl -fsSL "$RAW/$1" -o "$2"; fi
}

mkdir -p ~/.local/bin ~/.bashrc.d
fetch note ~/.local/bin/note
chmod +x ~/.local/bin/note
fetch note.bash ~/.bashrc.d/note.sh

if ! grep -q 'bashrc.d' ~/.bashrc 2>/dev/null; then
    cat >> ~/.bashrc <<'RC'

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do [ -f "$rc" ] && . "$rc"; done
fi
RC
fi

case ":$PATH:" in
    *":$HOME/.local/bin:"*) ;;
    *) grep -q '.local/bin' ~/.bashrc || echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc ;;
esac

if ! command -v wl-copy >/dev/null && ! command -v xclip >/dev/null && ! command -v xsel >/dev/null; then
    echo "note: install a clipboard tool too: wl-clipboard (Wayland) or xclip (X11)"
fi
echo "note installed. Open a new terminal (or run: source ~/.bashrc)."

# Makes `note <anything>` take the text exactly as typed or pasted, including
# quotes, *, ; and multiple lines. Enter is hooked: a line starting with `note `
# is rewritten into one safely quoted command before bash runs it.
_note_enter() {
    local line=$READLINE_LINE
    local cmd=${line#"${line%%[![:space:]]*}"}
    [[ $cmd == note[[:space:]]* ]] || return
    local text=${cmd#note}
    text=${text#"${text%%[![:space:]]*}"}
    text=${text%"${text##*[![:space:]]}"}
    [[ -n $text && $text != "+" ]] || return
    READLINE_LINE="note ${text@Q}"
    READLINE_POINT=${#READLINE_LINE}
}

if [[ $- == *i* ]] && bind -v 2>/dev/null | grep -q 'editing-mode emacs'; then
    bind -x '"\C-x\C-o": _note_enter'
    bind '"\C-x\C-a": accept-line'
    bind '"\C-m": "\C-x\C-o\C-x\C-a"'
    bind '"\C-j": "\C-x\C-o\C-x\C-a"'
fi

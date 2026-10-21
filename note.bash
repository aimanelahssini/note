# Lets `note` take any text as typed (quotes, *, ?, ; ...) by reading the raw command
# line from history; the alias's trailing # stops bash from parsing the rest.
_note_raw() {
    local line
    line=$(HISTTIMEFORMAT= history 1)
    line=${line#*[0-9]  }
    line=${line#*note}
    line=${line#"${line%%[![:space:]]*}"}
    if [ -n "$line" ]; then command note "$line"; else command note; fi
}
alias note='_note_raw #'

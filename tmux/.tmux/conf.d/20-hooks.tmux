# Hooks for window/session lifecycle

# -- pane focus: track MRU and clear unread markers
set-hook -gu pane-focus-in
set-hook -g pane-focus-in 'run -b "tmux set -wu -t #{window_id} @unread 2>/dev/null || true"'
set-hook -ag pane-focus-in 'run -b "tmux refresh-client -S"'

# -- window select: clear unread markers
set-hook -gu after-select-window
set-hook -g after-select-window 'run -b "tmux set -wu -t #{window_id} @unread 2>/dev/null || true"'
set-hook -ag after-select-window 'run -b "tmux refresh-client -S"'

# -- session events: refresh status bar
set-hook -gu client-session-changed
set-hook -g client-session-changed 'run -b "tmux set -wu -t #{window_id} @unread 2>/dev/null || true"'
set-hook -ag client-session-changed 'run -b "tmux refresh-client -S"'

set-hook -gu session-created
set-hook -g session-created 'run -b "tmux refresh-client -S"'

set-hook -gu session-renamed
set-hook -g session-renamed 'run -b "tmux refresh-client -S"'

set-hook -gu session-closed
set-hook -g session-closed 'run -b "tmux refresh-client -S"'

# -- agent-tracker integration (uncomment when installed)
# Tracks AI coding agents (Claude Code, etc.) across tmux panes.
# Install agent-tracker to ~/.config/agent-tracker/ then uncomment these lines.
#
# set-hook -gu client-attached
# set-hook -g client-attached 'run -b "test -x ~/.config/agent-tracker/bin/agent && ~/.config/agent-tracker/bin/agent tracker command acknowledge --client #{q:client_tty} --session-id #{q:session_id} --window-id #{q:window_id} --pane #{q:pane_id} || true"'
#
# set-hook -ag pane-focus-in 'run -b "test -x ~/.config/agent-tracker/bin/agent && ~/.config/agent-tracker/bin/agent tmux on-focus --session #{q:session_id} --window #{q:window_id} --pane #{q:pane_id} || true"'
# set-hook -ag pane-focus-in 'run -b "test -x ~/.config/agent-tracker/bin/agent && ~/.config/agent-tracker/bin/agent tracker command acknowledge --client #{q:client_tty} --session-id #{q:session_id} --window-id #{q:window_id} --pane #{q:pane_id} || true"'
#
# set-hook -gu pane-died
# set-hook -g pane-died 'run -b "test -x ~/.config/agent-tracker/bin/agent && ~/.config/agent-tracker/bin/agent tracker command delete_task --client #{q:client_tty} --session-id #{q:session_id} --window-id #{q:window_id} --pane #{q:pane_id} || true"'

SESSION=ide

tagme

tmux new-session -d -s "$SESSION" -n "devel"
tmux new-window -t "$SESSION":1 -n "scratch"

tmux select-window -t "$SESSION":0
tmux split-window -h
tmux split-window -v
tmux select-pane -L
tmux send-keys "vim" C-m

tmux attach -t "$SESSION"


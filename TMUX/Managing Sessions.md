
-> Open 3 tmux sessions
-> when we run tmux attach, we resume the session, we were last using 
-> to enter a particular session, use the command - tmux attach -t {session-number}
-> instead of using "tmux list-sessions", "tmux ls" can also be used
-> abbrievation of "tmux attach" is "tmux a"


=> to rename a session - 
	1. enter the session you want to rename
	2. use the command - tmux rename-session {session_name}
    3. another way is prefix + $



-> to switch from one session to another without detaching, 
	- prefix + s and choose your session you want to attach to 

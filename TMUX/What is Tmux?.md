Stands for terminal multiplexer. In easy language - terminals inside a terminal. 

In order to start using tmux, just use the command - tmux.  We observe a green footer, which indicates that tmux is active. 

With tmux, our sessions stay persistent. Also includes important features like multiple tabs, session management, splits and so on..

Even if ssh connection drops, tmux will keep our session active. 

=> Prefix key - ctrl + b is the prefix key for tmux. To use some of features of tmux, we need to first press the prefix key which is ctrl + b followed by a function key, like d, which detaches us from the current tmux session. 

=> Detaching a session doesnt mean quitting it fully. It still runs in the background. To list the running sessions, use the command- "tmux list-sessions"

=> To reattach a session tmux attach {session_number}

=> To kill a session, enter the session using tmux attach and then - 
	1. Enter your prefix key
	2. Press :
	3. Then type "kill-session" and press enter
	4. run tmux list-sessions again to verify

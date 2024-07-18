- to customise and configure tmux, we need to create ~/.tmux.conf file

-> to change the prefix key - 
		set-option -g prefix C-j  (C is ctrl)
		-g is global

-> to add mouse mode in tmux - set -g mouse on. using this we can resize panes, switch panes etc, without using the keyboard. 

-> to enable sync and to bind it to prefix + y combination - 
		```
bind-key y set-window-option synchronize-panes\; display-message "synchronize mode toggled."

sync mode allows us to type the same thing at the same time in every pane in a window. 
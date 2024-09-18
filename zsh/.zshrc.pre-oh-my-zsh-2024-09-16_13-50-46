source $HOME/.zshenv # Sources the .zshenv on the custom zsh folder

autoload -U colors && colors # load colors
PS1="%B%{$fg[white]%}[%{$fg[red]%}%n%{$fg[white]%}@%{$fg[white]%}%M %{$fg[black]%}%~%{$fg[white]%}]%{$reset_color%}$%b "

autoload -U compinit # enable completions
zstyle ':completion:*' menu select 
zmodload zsh/complist
compinit

source $XDG_CONFIG_HOME/aliasrc # source the aliases file

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh # enable syntax highlighting

ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=magenta,underline
ZSH_HIGHLIGHT_STYLES[precommand]=fg=magenta,underline
ZSH_HIGHLIGHT_STYLES[arg0]=fg=magenta



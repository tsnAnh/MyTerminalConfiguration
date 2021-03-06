set fish_greeting ""

set -gx TERM xterm-256color
set number

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"
alias g git
command -qv nvim && alias vim nvim
alias vi nvim

set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

# NodeJS
set -gx PATH node_modules/.bin $PATH

# Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

# NVM
function __check_rvm --on-variable PWD --description 'Do nvm stuff'
  status --is-command-substitution; and return

  if test -f .nvmrc; and test -r .nvmrc;
    nvm use
  else
  end
end

switch (uname)
  case Darwin
    source (dirname (status --current-filename))/config-osx.fish
  case Linux
    # Do nothing
  case '*'
	# Do nothing
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
  source $LOCAL_CONFIG
end
set -g fish_user_paths "/usr/local/opt/openssl@1.1/bin" $fish_user_paths
set -g PATH $PATH ~/flutter/bin
set -g PATH $PATH /usr/local/anaconda3/bin/conda

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /usr/local/anaconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<


# Setting PATH for Python 3.8
# The original version is saved in /Users/tsnanh/.config/fish/config.fish.pysave
set -x PATH "/Library/Frameworks/Python.framework/Versions/3.8/bin" "$PATH"
if set -q VIRTUAL_ENV
    echo -n -s (set_color -b blue white) "(" (basename "$VIRTUAL_ENV") ")" (set_color normal) " "
end

# Setting PATH for Python 3.9
# The original version is saved in /Users/tsnanh/.config/fish/config.fish.pysave
set -x PATH "/Library/Frameworks/Python.framework/Versions/3.9/bin" "$PATH"
set -g PATH $PATH ~/GoogleProtobuf/bin
set -g LC_ALL en_US.UTF8

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

# fish_add_path /usr/local/opt/openjdk/bin

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/tsnanh/google-cloud-sdk/path.fish.inc' ]; . '/Users/tsnanh/google-cloud-sdk/path.fish.inc'; end

nvm use lts
set -g JAVA_HOME /Library/Java/JavaVirtualMachines/jdk1.8.0_291.jdk/Contents/Home

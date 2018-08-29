# Add `~/.local/bin` to the `$PATH`
export PATH=$HOME/.local/bin:$PATH

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{profile,exports,aliases}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Ensure user-installed binaries take precedence
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Add tab completion for Bash
if which brew &> /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
	. "$(brew --prefix)/share/bash-completion/bash_completion";
elif which brew &> /dev/null && [ -f "$(brew --prefix)/etc/bash_completion" ]; then
	. "$(brew --prefix)/etc/bash_completion";
elif [ -f /etc/bash_completion ]; then
	. /etc/bash_completion;
fi;

# RVM
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && \. "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# MAMP
PHP_VERSION=$(ls /Applications/MAMP/bin/php/ | sort -n | tail -1)
export PATH=/Applications/MAMP/bin/php/${PHP_VERSION}/bin:$PATH

# MAMP MYSQL, (Optional) you may choose to run mysql with brew services
# [[ -d "/Applications/MAMP" ]] && alias mysql="/Applications/MAMP/Library/bin/mysql"

# Better Bash History
export HISTCONTROL=ignoredups:erasedups
shopt -s histappend
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

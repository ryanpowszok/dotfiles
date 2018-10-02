# Add `~/.local/bin` to the `$PATH`
export PATH=$HOME/.local/bin:$PATH

# Source .profile file
[[ -f ~/.profile ]] && \. ~/.profile;

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{exports,aliases}; do
  [ -r "$file" ] && [ -f "$file" ] && \. "$file";
done;
unset file;

# Ensure user-installed binaries take precedence
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Add bash tab completion for Homebrew
if type brew &>/dev/null; then
  [[ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]] && \. "$(brew --prefix)/share/bash-completion/bash_completion"
  [[ -f "$(brew --prefix)/etc/bash_completion" ]] && \. "$(brew --prefix)/etc/bash_completion"
  for completion_file in $(brew --prefix)/etc/bash_completion.d/*; do
    source "$completion_file"
  done
else
  [[ -f "/etc/bash_completion" ]] && \. "/etc/bash_completion"
fi

# RVM
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && \. "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Composer
export PATH="$HOME/.composer/vendor/bin:$PATH"

# MAMP
PHP_VERSION=$(ls /Applications/MAMP/bin/php/ | sort -n | tail -1)
[[ -d "/Applications/MAMP" ]] && export PATH="/Applications/MAMP/bin/php/${PHP_VERSION}/bin:$PATH"
[[ -d "/Applications/MAMP" ]] && export PATH="/Applications/MAMP/Library/bin:$PATH"

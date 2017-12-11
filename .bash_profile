# Ensure user-installed binaries take precedence
export PATH=/usr/local/bin:$PATH

# Load .bashrc if it exists
[[ -r ~/.bashrc ]] && . ~/.bashrc

# Load .profile if it exists
[[ -r ~/.profile ]] && . ~/.profile

# Homebrew needs this
export PATH="/usr/local/sbin:$PATH"

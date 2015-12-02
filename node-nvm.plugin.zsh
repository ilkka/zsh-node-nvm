# Nvm and node plugin
#
# Loads nvm and defines completions for both nvm and npm.

# Load nvm
if [[ -d ~/.nvm && -s ~/.nvm/nvm.sh ]]; then
  export NVM_DIR=$HOME/.nvm
  source $NVM_DIR/nvm.sh
else
  echo "Nvm not installed, see https://github.com/creationix/nvm"
fi

# Load NPM completion.
if (( $+commands[npm] )); then
  cache_file="${0:h}/cache.zsh"

  if [[ "$commands[npm]" -nt "$cache_file" || ! -s "$cache_file" ]]; then
    # npm is slow; cache its output.
    npm completion >! "$cache_file" 2> /dev/null
  fi

  source "$cache_file"

  unset cache_file
fi

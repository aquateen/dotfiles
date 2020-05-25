export PATH="$HOME/.bin:$PATH"

# recommended by brew doctor
export PATH="/usr/local/bin:$PATH"
source /Users/chris/.asdf/asdf.sh

# load zgen
source "${HOME}/.zgen/zgen.zsh"

# if the init scipt doesn't exist
if ! zgen saved; then
    echo "Creating a zgen save"

    # pure prompt
    zgen load mafredri/zsh-async
    zgen load sindresorhus/pure

    # save all to init script
    zgen save
fi

# display # of background jobs in prompt
PROMPT='%(1j.[%j] .)%(?.%F{magenta}.%F{red})${PURE_PROMPT_SYMBOL:-❯}%f '

# turn off execution time display (added by pure)
PURE_CMD_MAX_EXEC_TIME=9999999

# enable zsh-completions
if type brew &>/dev/null; then
FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

autoload -Uz compinit
compinit
fi

# case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

# case insensitive globbing
setopt NO_CASE_GLOB

# syntax highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# history settings
HISTSIZE=999999999
SAVEHIST=$HISTSIZE
# add timestamp and elapsed time to command history
setopt EXTENDED_HISTORY
# adds commands as they are typed, not at shell exit
setopt INC_APPEND_HISTORY
# ignore duplicates when searching
setopt HIST_FIND_NO_DUPS
# removes blank lines from history
setopt HIST_REDUCE_BLANKS
# ignores saving commands prefixed by a space
setopt HIST_IGNORE_SPACE

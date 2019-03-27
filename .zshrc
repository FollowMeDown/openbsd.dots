#fortune -a
print

_newline=$'\n'
_lineup=$'\e[1A'
_linedown=$'\e[1B '
# vcs
autoload -Uz vcs_info
zstyle ':vcs_info:*' stagedstr '%F{green}•'
zstyle ':vcs_info:*' unstagedstr '%F{yellow}•'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' enable git svn
precmd () {
	if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]] {
		zstyle ':vcs_info:*' formats '[%b] %c%u%f'
	} else {
		zstyle ':vcs_info:*' formats '[%b] %F{red}•%c%u%f'
	}
	vcs_info
}
setopt prompt_subst
PROMPT='%F{blue}┌─── %~/ ${vcs_info_msg_0_}${_newline}%F{blue}└%f '
RPROMPT='%{${_lineup}%}%F{black}%l:%n@%m%f%{${_linedown}%}'

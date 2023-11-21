if type -q exa
  alias ll "exa -l -g --icons"
  alias lla "ll -a"
  alias etodo "nvim /Users/$(whoami)/Documents/Obsidian\ Vault/Daily\ TODO.md"
end

set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
alias g git
alias glog 'git log --pretty=format:"\"%Cgreen%h %Creset%cd %Cblue[%cn] %Creset%s%C(yellow)%d%C(reset)\"" --graph --date=relative --decorate --all'

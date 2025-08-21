# Solarized Punk

ZSH_THEME_GIT_PROMPT_PREFIX="%{${reset_color}%}%F{magenta}⊣%F{green} "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{${reset_color}%} %F{magenta}⊢%f"
ZSH_THEME_GIT_PROMPT_DIRTY=" %F{yellow}◆%f"
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_VIRTUALENV_PREFIX="%{${reset_color}%}%F{magenta}(%F{green}"
ZSH_THEME_VIRTUALENV_SUFFIX="%F{magenta})%f "

base_prompt="%{${reset_color}%}%F{magenta}%F{12} %D %* %F{magenta}⊣ %F{11}%n%F{red}@%F{cyan}%m%F{red}:%F{9}%~ %F{magenta}⊢%f"
post_prompt="%{${reset_color}%}%F{magenta}→%f  "

PROMPT="\$(virtualenv_prompt_info)${base_prompt}\$(git_prompt_info)${post_prompt}"
unset base_prompt post_prompt

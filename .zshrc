# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="solarized_punk"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' mode reminder

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(
	git
	colorize
	zsh-autosuggestions
    tmux
    virtualenv
)

ZSH_TMUX_AUTOCONNECT=true
ZSH_TMUX_AUTOQUIT=true
ZSH_TMUX_FIXTERM=true
ZSH_TMUX_CONFIG=$HOME/.config/tmux/tmux.conf
ZSH_TMUX_UNICODE=true
ZSH_TMUX_DEFAULT_SESSION_NAME='main'

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8
# export LC_CTYPE=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

export OPENER='xdg-open'
export EDITOR='vim'
export PAGER='moar'

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias chzsh="vim ~/.zshrc"
alias chsway="vim ~/.config/sway/config"
alias chbar="vim ~/.config/waybar/config"
alias chbars="vim ~/.config/waybar/style.css"
alias chmenu="vim ~/.config/wofi/menu_config"
alias chmenus="vim ~/.config/wofi/menu_style.css"
alias chkanshi="vim ~/.config/kanshi/config"
alias chvim="vim ~/.vimrc"

alias wmonitor0="sudo ip link set wlan0 down; sudo iw wlan0 set type monitor; sudo ip link set wlan0 up"
alias wmanaged0="sudo ip link set wlan0 down; sudo iw wlan0 set type managed; sudo ip link set wlan0 up"
alias wmonitor1="sudo ip link set wlan1 down; sudo iw wlan1 set type monitor; sudo ip link set wlan1 up"
alias wmanaged1="sudo ip link set wlan1 down; sudo iw wlan1 set type managed; sudo ip link set wlan1 up"

alias sscp='grim -g "$(slurp)" - | wl-copy'

alias update-mirrors="sudo reflector --save /etc/pacman.d/mirrorlist --protocol https --latest 5 --sort age"

alias irssi="proxychains4 irssi"
alias firewall-config="xhost si:localuser:root; sudo firewall-config; xhost -si:localuser:root"
#alias gparted="xhost si:localuser:root; sudo gparted; xhost -si:localuser:root"

alias grub-remake="sudo grub-install --target=x86_64-efi --efi-directory=/efi bootloader-id=GRUB; sudo grub-mkconfig -o /boot/grub/grub.cfg"

alias vpn-start="sudo systemctl start tor; sudo systemctl start wg-quick@wg_air"
alias vpn-restart="sudo systemctl stop tor; sudo systemctl restart wg-quick@wg_air; sudo systemctl start tor"
alias vpn-stop="sudo systemctl stop tor; sudo systemctl stop wg-quick@wg_air"
alias vpn-status="systemctl status wg-quick@wg_air tor"

alias kbd-backlight-on="sudo light -s sysfs/leds/tpacpi::kbd_backlight -S 100"
alias kbd-backlight-off="sudo light -s sysfs/leds/tpacpi::kbd_backlight -S 0"

alias pipes="pipes.sh -t 3 -p 5 -R -K -f 144"

if [ -n "$DESKTOP_SESSION" ];then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi

export GPG_TTY=$(tty)

neofetch
rem -hb1
export QT_STYLE_OVERRIDE=Adwaita-Dark

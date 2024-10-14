# home.nix
{
  config,
  pkgs,
  ...
}: {
  programs.zsh.enable = true;
  # programs.zsh.dotDir = "/home/cameron/.config/zsh";
  programs.zsh.syntaxHighlighting.enable = true;
  programs.zsh.autosuggestion.enable = true;
  programs.zsh.historySubstringSearch.enable = true;

  programs.zsh.shellAliases = {
    vimrc = "vim ~/.config/nvim/init.lua";
    vimplug = "vim ~/.config/nvim/lua/plugins.lua";
    zshrc = "vim ~/.config/zsh/.zshrc";

    # Colorize grep output (good for log files)
    grep = "grep --color=auto";
    egrep = "egrep --color=auto";
    fgrep = "fgrep --color=auto";

    # Default to nvim
    vim = "nvim";
    vi = "nvim";
    nano = "nvim";
    v = "nvim";
    # confirm before overwriting something
    cp = "cp -i";
    mv = "mv -i";
    rm = "rm -i";
    ## timg
    timg = "timg -p k";
    icat = "timg -p k";

    # Colour
    # alias ls="ls -G --color=auto"
    ls = "lsd";

    # easier to read disk
    df = "df -h"; # human-readable sizes
    free = "free -m"; # show sizes in MB

    # Navigate to obsidian folder
    cdobs = "cd ~/Library/'Mobile Documents'/iCloud~md~obsidian/Documents/Vault";
    cdaoc = "cd ~/00_Documents/40-49_Personal_Development/41_Programming/41.15_Advent_of_Code";

    # Navigate to the root folder
    cdroot = "cd ~/../../..";
    cdcon = "cd ~/.config/";
  };

  programs.zsh.sessionVariables = {
    XDG_CONFIG_HOME = "/home/cameron/.config";

    PATH = "$PATH:/usr/local/bin/:$HOME/.go/bin";

    wallpaperDir = "/home/cameron/4_media/41_wallpapers/4k/";
  };

  programs.zsh.initExtraFirst = ''
    bindkey "^." "/usr/local/bin/tmux-sessioniser"

    setopt correct # correct spelling errors
    setopt extendedglob # enable extended globbing
    setopt nocaseglob # case insensitive globbing
    setopt rcexpandparam # expand parameter in place
    setopt numericglobsort # sort filenames numerically when it makes sense
    setopt appendhistory # append to the history file, don't overwrite it
    setopt histignorealldups # don't record duplicates in the history
    setopt inc_append_history # add commands to the history file as they are run
  '';

  programs.zsh.initExtra = ''

    plugins=(git)

            # zsh vim mode
    # bindkey -e will be emacs mode
    bindkey -v
    export KEYTIMEOUT=1

    # Use vim keys in tab complete menu:

    # bindkey -M menuselect '^h' vi-backward-char
    # bindkey -M menuselect '^k' vi-up-line-or-history
    # bindkey -M menuselect '^l' vi-forward-char
    # bindkey -M menuselect '^j' vi-down-line-or-history
    # bindkey -M menuselect '^[[Z' vi-up-line-or-history
    bindkey -v '^?' backward-delete-char

    # Change cursor shape for different vi modes.
    function zle-keymap-select () {
        case $KEYMAP in
            vicmd) echo -ne '\e[1 q';;      # block
            viins|main) echo -ne '\e[5 q';; # beam
        esac
    }
    zle -N zle-keymap-select
    zle-line-init() {
        zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
        echo -ne "\e[5 q"
    }
    zle -N zle-line-init
    echo -ne '\e[5 q' # Use beam shape cursor on startup.
    preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

            # ZSH Functions
    # Function to source files if they exist
    function zsh_add_file() {
        [ -f "$ZDOTDIR/$1" ] && source "$ZDOTDIR/$1"
    }

    function zsh_add_plugin() {
        PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)
        if [ -d "$ZDOTDIR/plugins/$PLUGIN_NAME" ]; then
            # For plugins
            zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh" || \
            zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh"
        else
            git clone "https://github.com/$1.git" "$ZDOTDIR/plugins/$PLUGIN_NAME"
        fi
    }

    function zsh_add_completion() {
        PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)
        if [ -d "$ZDOTDIR/plugins/$PLUGIN_NAME" ]; then
            # For completions
    		completion_file_path=$(ls $ZDOTDIR/plugins/$PLUGIN_NAME/_*)
    		fpath+="$($dirname "$completion_file_path")"
            zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh"
        else
            git clone "https://github.com/$1.git" "$ZDOTDIR/plugins/$PLUGIN_NAME"
    		fpath+=$(ls $ZDOTDIR/plugins/$PLUGIN_NAME/_*)
            [ -f $ZDOTDIR/.zccompdump ] && $ZDOTDIR/.zccompdump
        fi
    	completion_file="$(basename "$completion_file_path")"
    	if [ "$2" = true ] && compinit "$completion_file:1"
    }

  '';
}

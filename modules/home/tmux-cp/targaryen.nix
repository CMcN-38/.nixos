# home.nix
{
  config,
  pkgs,
  ...
}: {
  #╋┏┳┓┓┏┓┏
  #┗┛┗┗┗┻┛┗

  programs.tmux = {
    enable = true;

    extraConfig = ''
      set -g mouse on
      set-option -sa terminal-features ',alacritty:RGB'
      set -g base-index 1
      unbind C-b
      set -g prefix C-h
      bind C-h send-prefix
      bind '"' split-window -v -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel
      bind-key -r i run-shell "tmux neww tmux-cht.sh"
      bind-key -n C-f run-shell tmux-sessioniser
      run-shell ${pkgs.tmuxPlugins.sensible}/share/tmux-plugins/sensible/sensible.tmux
      # run-shell ${pkgs.tmuxPlugins.catppuccin}/share/tmux-plugins/catppuccin/catppuccin.tmux
      # run-shell ${pkgs.tmuxPlugins.onedark-theme}/share/tmux-plugins/onedark-theme/tmux-onedark-theme.tmux
      set -g @prefix_highlight_fg '#080808'
      set -g @tmux_power_theme '#6ee9f8' # dark slate blue
      run-shell ${pkgs.tmuxPlugins.power-theme}/share/tmux-plugins/power/tmux-power.tmux
      run-shell ${pkgs.tmuxPlugins.yank}/share/tmux-plugins/yank/yank.tmux
      set-option -g status-position top
    '';
  };
}

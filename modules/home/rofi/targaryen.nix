# home.nix
{
  config,
  pkgs,
  ...
}: {
  programs.rofi.enable = true;
  # programs.rofi.configPath = "/home/cameron/.config/rofi/";
  # programs.rofi.theme = "/home/cameron/.config/rofi/catppuccin-mocha.rasi.tmp";
  # programs.rofi.theme = "/home/cameron/.config/rofi/config.rasi.tmp";
  programs.rofi.theme = "/home/cameron/.nixos/modules/home/rofi/config.rasi";
  programs.rofi.extraConfig = {
    modi = "run,drun,window";
    lines = 5;
    font = "FiraCode Nerd Font 24";
    show-icons = false;
    icon-theme = "Papirus";
    terminal = "alacritty";
    drun-display-format = "{icon} {name}";
    location = 0;
    disable-history = false;
    hide-scrollbar = true;
    display-drun = " 📦 Apps ";
    display-run = " 🚀 Run ";
    display-window = " 🔳  window";
    /*
    display-Network: " 󰤨  Network";
    */
    sidebar-mode = true;
  };
  #
  # @theme "catppuccin-mocha"
  #
  # element-text, element-icon , mode-switcher {
  #     background-color: inherit;
  #     text-color:       inherit;
  # }
  #
  # window {
  #     height: 360px;
  #     border: 3px;
  #     border-color: @border-col;
  #     background-color: @bg-col;
  # }
  #
  # mainbox {
  #     background-color: @bg-col;
  # }
  #
  # inputbar {
  #     children: [prompt,entry];
  #     background-color: @bg-col;
  #     border-radius: 5px;
  #     padding: 2px;
  # }
  #
  # prompt {
  #     background-color: @blue;
  #     padding: 6px;
  #     text-color: @bg-col;
  #     border-radius: 3px;
  #     margin: 20px 0px 0px 20px;
  # }
  #
  # textbox-prompt-colon {
  #     expand: false;
  #     str: ":";
  # }
  #
  # entry {
  #     padding: 6px;
  #     margin: 20px 0px 0px 10px;
  #     text-color: @fg-col;
  #     background-color: @bg-col;
  # }
  #
  # listview {
  #     border: 0px 0px 0px;
  #     padding: 6px 0px 0px;
  #     margin: 10px 0px 0px 20px;
  #     columns: 1;
  #     background-color: @bg-col;
  # }
  #
  # element {
  #     padding: 5px;
  #     background-color: @bg-col;
  #     text-color: @fg-col  ;
  # }
  #
  # element-icon {
  #     size: 25px;
  # }
  #
  # element selected {
  #     background-color:  @selected-col ;
  #     text-color: @fg-col2  ;
  # }
  #
  # mode-switcher {
  #     spacing: 0;
  #   }
  #
  # button {
  #     padding: 10px;
  #     background-color: @bg-col-light;
  #     text-color: @grey;
  #     vertical-align: 0.5;
  #     horizontal-align: 0.5;
  # }
  #
  # button selected {
  #   background-color: @bg-col;
  #   text-color: @blue;
  # };
}

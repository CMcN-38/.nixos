#
#b.             8  8 8888 `8.`8888.      ,8'  ,o888888o.       d888888o.
#888o.          8  8 8888  `8.`8888.    ,8'. 8888     `88.   .`8888:' `88.
#Y88888o.       8  8 8888   `8.`8888.  ,8',8 8888       `8b  8.`8888.   Y8
#.`Y888888o.    8  8 8888    `8.`8888.,8' 88 8888        `8b `8.`8888.
#8o. `Y888888o. 8  8 8888     `8.`88888'  88 8888         88  `8.`8888.
#8`Y8o. `Y88888o8  8 8888     .88.`8888.  88 8888         88   `8.`8888.
#8   `Y8o. `Y8888  8 8888    .8'`8.`8888. 88 8888        ,8P    `8.`8888.
#8      `Y8o. `Y8  8 8888   .8'  `8.`8888.`8 8888       ,8P 8b   `8.`8888.
#8         `Y8o.`  8 8888  .8'    `8.`8888.` 8888     ,88'  `8b.  ;8.`8888
#8            `Yo  8 8888 .8'      `8.`8888.  `8888888P'     `Y8888P ,88P'
#
#
#███████╗ ██████╗ ███╗   ██╗████████╗███████╗
#██╔════╝██╔═══██╗████╗  ██║╚══██╔══╝██╔════╝
#█████╗  ██║   ██║██╔██╗ ██║   ██║   ███████╗
#██╔══╝  ██║   ██║██║╚██╗██║   ██║   ╚════██║
#██║     ╚██████╔╝██║ ╚████║   ██║   ███████║
#╚═╝      ╚═════╝ ╚═╝  ╚═══╝   ╚═╝   ╚══════╝
#
{pkgs, ...}: {
  #            ┓
  #┏┓┏┓┏┓┏┓┏┓┏┓┃
  #┗┫┗ ┛┗┗ ┛ ┗┻┗
  # ┛

  fonts.packages = with pkgs; [
    # (nerd-fonts.override {fonts = ["FiraCode"];})
    fira-code-symbols
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    openmoji-color
    freefont_ttf
    nerd-fonts.fira-code
  ];
  
}

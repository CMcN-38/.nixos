# home.nix
{
  config,
  pkgs,
  ...
}: {
  programs.wofi.enable = true;
  programs.wofi.settings = {
    de_scroll = true;
    show = "drun";
    width = "25%";
    lines = 3;
    line_wrap = "word";
    term = "alacritty";
    allow_markup = true;
    always_parse_args = false;
    show_all = true;
    print_command = true;
    layer = "overlay";
    allow_images = true;
    sort_order = "default";
    gtk_dark = true;
    image_size = 20;
    display_generic = false;
    location = "center";
    key_expand = "Tab";
    insensitive = false;
  };
  programs.wofi.style = ''
    * {
      font-family: Fira Code Nerd Font;
      font-size: 20px;
      color: #e5e9f0;
      background: transparent;
    }

    #window {
      background: rgba(41, 46, 66, 0.5);
      margin: auto;
      padding: 10px;
      border-radius: 100px;
      border: 5px solid #;
    }

    #input {
      padding: 10px;
      margin-bottom: 20px;
      border-radius: 40px;
    }

    #outer-box {
      padding: 40px;
      border-radius: 40px;
    }

    #img {
      margin-right: 6px;
    }

    #entry {
      padding: 15px;
      border-radius: 40px;
    }

    #entry:selected {
      background-color: #2e3440;
      border-radius: 40px;
      border: 2px solid #f5e0dc;
      outline: none;
    }

    #text {
      margin: 10px;
    }
  '';
}

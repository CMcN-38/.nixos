{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.services.espanso;
in {
  meta = {maintainers = with lib.maintainers; [numkem];};

  options = {
    services.espanso-wayland = {enable = options.mkEnableOption (lib.mdDoc "Espanso");};
  };

  config = mkIf cfg.enable {
    systemd.user.services.espanso-wayland = {
      description = "Espanso daemon";
      serviceConfig = {
        ExecStart = "${pkgs.espanso-wayland}/bin/espanso-wayland daemon";
        Restart = "on-failure";
      };
      wantedBy = ["default.target"];
    };
  };
}

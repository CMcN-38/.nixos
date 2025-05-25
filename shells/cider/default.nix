{ pkgs ? import <nixpkgs> { system = builtins.currentSystem; }
  , appimageTools ? pkgs.appimageTools
  , lib ? pkgs.lib
  , fetchurl ? pkgs.fetchurl
}:

appimageTools.wrapType2 rec {
  pname = "Cider";
  version = "2.6.0";

  src = fetchurl {
    url = "file://${./cider-linux-x64.AppImage}";
    sha256 = "5d506132048d240613469c79186ae8b5e78ec7400f233b8709b7fe908353d9e5";
  };

  extraInstallCommands =
    let contents = appimageTools.extract { inherit pname version src; };
    in ''

      install -m 444 -D ${contents}/${pname}.desktop -t $out/share/applications
      substituteInPlace $out/share/applications/${pname}.desktop \
        --replace-warn  'Exec=AppRun' 'Exec=${pname}'
      cp -r ${contents}/usr/share/icons $out/share
    '';

  meta = with lib; {
    description = "A new look into listening and enjoying Apple Music in style and performance.";
    homepage = "https://cider.sh/";
    maintainers = [ maintainers.nicolaivds ];
    platforms = [ "x86_64-linux" ];
  };
}

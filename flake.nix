{
  description = "Cat Plymouth Theme";

  inputs =
  {
    nixpkgs =
    {
        url = "github:nixos/nixpkgs/nixos-25.05";
    };
  };

  outputs = inputs:
  {
    packages.x86_64-linux.default = stdenv.mkDerivation
    {
      pname = "plymouththeme-cat";
      version = "0.0.0";
      src = pkgs.fetchgit
      {
        url = "https://github.com/krishnan793/PlymouthTheme-Cat";
        rev = "9f9bbc0e6cb8677684d198eb1139d90aceff82e0";
        sha256 = "sha256-yNryZkjSDFYGTExCz6Dkoust749QK65JYoCIO2oN+Y4=";
        fetchSubmodules = true;
      };
      dontBuild = true;
      installPhase =
      ''
        mkdir -p $out/share/plymouth/themes/PlymouthTheme-Cat
        cp -rT $src $out/share/plymouth/themes/PlymouthTheme-Cat
        sed -i "s@/usr/@$out/@" $out/share/plymouth/themes/PlymouthTheme-Cat/PlymouthTheme-Cat.plymouth
      '';

    };
  };
}
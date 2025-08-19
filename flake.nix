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
    packages.x86_64-linux.default =
    with import inputs.nixpkgs { system = "x86_64-linux"; };
    stdenv.mkDerivation {
      pname = "plymouththeme-cat";
      version = "0.0.0";
      src = pkgs.fetchgit {
        url = "https://github.com/krishnan793/PlymouthTheme-Cat";
        rev = "9f9bbc0e6cb8677684d198eb1139d90aceff82e0";
        sha256 = "ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad";
        fetchSubmodules = true;
      };
      dontBuild = true;
      installPhase = ''
        mkdir -p $out/share/plymouth/themes/plymouththeme-cat
        cp -rT $src $out/share/plymouth/themes/plymouththeme-cat
        find $out/share/plymouth/themes/ -name '*.plymouth' \
            -exec sed -i "s@/usr/@$out/@" {} \;
      '';

    };
  };
}
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
      src = ./PlymouthTheme-Cat;
      dontBuild = true;
      installPhase =
      ''
        mkdir -p $out/share/plymouth/themes/plymouththeme-cat
        cp -r $src/* $out/share/plymouth/themes/plymouththeme-cat/
        find $out/share/plymouth/themes/ -name \*.plymouth -exec sed -i "s@\/usr\/@$out\/@" {} \;
      '';
    };
  };
}
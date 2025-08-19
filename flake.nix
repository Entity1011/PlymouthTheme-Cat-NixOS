{
  description = "Cat Plymouth Theme";

  inputs =
  {
    nixpkgs =
    {
        url = "github:nixos/nixpkgs/nixos-25.05";
    };
    plymouththeme-cat =
    {
        url = "github:krishnan793/PlymouthTheme-Cat"
    }
  };

  outputs = inputs:
  {
    packages.x86_64-linux.default =
    with import inputs.nixpkgs { system = "x86_64-linux"; };
    stdenv.mkDerivation {
      pname = "plymouththeme-cat";
      version = "0.0.0";
      src = inputs.plymouththeme-cat;
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
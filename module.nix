{ pkgs, ... }: {
  environment = {
    etc."starship.toml".source = ./starship.toml;

    systemPackages = [ pkgs.starship ];
  };
}

{pkgs, ...}: {
  environment = {
    etc."starship.toml".text = builtins.readFile ./starship.toml;
    systemPackages = [pkgs.starship];
  };

  programs.fish.promptInit = ''
    if test "$TERM" != "dumb"
      set -x STARSHIP_CONFIG /etc/starship.toml
      eval (${pkgs.starship}/bin/starship init fish)
    end
  '';
}

{pkgs, ...}: {
  environment = {
    etc."starship.toml".source = ./starship.toml;
    systemPackages = [pkgs.starship];
  };

  programs.fish.promptInit = ''
    if test "$TERM" != "dumb"
      set -x STARSHIP_CONFIG /etc/starship.toml
      eval (${pkgs.starship}/bin/starship init fish)
    end
  '';
}

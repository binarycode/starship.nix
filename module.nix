{
  programs.starship = {
    enable = true;

    presets = [ "plain-text-symbols" ];

    settings = {
      battery.disable = true;

      directory = {
        truncation_length = 8;
        truncation_symbol = ".../";
        read_only = " RO";
      };

      # git_status is painfully slow in large repos
      git_status.disabled = true;

      hostname = {
        format = "@[$hostname]($style):";
        ssh_only = false;
      };

      status = {
        disabled = false;
        symbol = "E";
      };

      time = {
        disabled = false;
        format = "[$time]($style) ";
      };

      username = {
        format = "[$user]($style)";
        show_always = true;
      };
    };
  };
}

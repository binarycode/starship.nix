{
  outputs = _: let
    module = import ./module.nix;
  in {
    nixosModules = {
      default  = module;
      starship = module;
    };
    darwinModules = {
      default  = module;
      starship = module;
    };
  };
}

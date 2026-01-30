{ pkgs, ... }:

{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    
    shellAliases = {
      rbs = "sudo nixos-rebuild switch --flake ~/nixos-config/";
    };

    bashrcExtra = ''
      export EDITOR="nvim"
    '';
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableBashIntegration = true; 
  };
}

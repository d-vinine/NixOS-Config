{ pkgs, ... }: {
  programs.git = {
    enable = true;
    userName = "d-vinine";
    userEmail = "dhanvinmalhotra10@gmail.com";

    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
      core.editor = "nvim";
    };

    aliases = {
      st = "status";
      co = "checkout";
      cm = "commit";
    };
  };
}

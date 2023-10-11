{
  config,
  pkgs,
  ...
}: {
  home = {
    username = "justin";
    homeDirectory = "/home/justin";
    stateVersion = "23.05";

    packages = with pkgs; [
    ];

    file = {
    };

    sessionVariables = {
      EDITOR = "nvim";
    };
  };
  programs = {
    alacritty = {
      enable = true;
    };
    fish = {
      enable = true;
      interactiveShellInit = ''
        alias ls='exa -al --color=always --group-directories-first --icons'
        alias ll='exa -l --color=always --group-directories-first --icons'

        alias g='git'
        alias git-rm-branches='git for-each-ref --format "%(refname:short)" refs/heads | grep -v "master\|main\|develop\|development" | xargs git branch -D'
        alias cleanpush='/bin/sh ~/git_scripts/cleanpush'
        alias rebase='/bin/sh ~/git_scripts/rebase'

        alias hmd='cd ~/dot_files/nix/home-manager'
        alias hms='home-manager switch --flake ~/dot_files/nix/home-manager#justin'
        alias hmu='nix flake update ~/dot_files/nix/home-manager && hms'
      '';
      plugins = [
        {
          name = "Tide";
          src = pkgs.fetchFromGitHub {
            owner = "IlanCosman";
            repo = "tide";
            rev = "7f9d24de000a5f8ad68f738207187a36ecbb87c9";
            sha256 = "sha256-bSqFyrCa72s1rfwGOzOj033VbonxOkVDm9eUePRCSmA=";
          };
        }
      ];
    };
    git = {
      aliases = {
        s = "status";
        co = "checkout";
        cob = "checkout -b";
        del = "branch -D";
        br = "branch --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(contents:subject) %(color:green)(%(committerdate:relative)) [%(authorname)]' --sort=-committerdate";
        save = "!git add -A && git commit -m 'chore: checkpoint'";
        undo = "reset HEAD~1 --mixed";
        res = "!git reset --hard";
        done = "!git push origin HEAD";
        lg = "!git log --pretty=format:\"%C(magenta)%h%Creset -%C(red)%d%Creset %s %C(dim green)(%cr) [%an]\" --abbrev-commit -30";
      };
      enable = true;
      extraConfig = {
        core.editor = "nvim";
      };
      userEmail = "github.frugally996@passmail.net";
      userName = "Justin Gardner";
    };
    home-manager = {
      enable = true;
    };
    neovim = {
      defaultEditor = true;
      enable = true;
    };
    tmux = {
      enable = true;
    };
    neovim = {
      enable = true;
    };
  };
}

{
  config,
  pkgs,
  ...
}: {
  home = {
    file = {};
    homeDirectory = "/home/justin";
    packages = with pkgs; [
    ];
    sessionVariables = {
      EDITOR = "nvim";
    };
    stateVersion = "23.05";
    username = "justin";
  };
  programs = {
    alacritty = {
      enable = true;
    };
    fish = {
      enable = true;
      interactiveShellInit = ''
        alias ll='exa -l --color=always --group-directories-first --icons'
        alias ls='exa -al --color=always --group-directories-first --icons'

        alias cleanpush='/bin/sh ~/git_scripts/cleanpush'
        alias g='git'
        alias git-rm-branches='git for-each-ref --format "%(refname:short)" refs/heads | grep -v "master\|main\|develop\|development" | xargs git branch -D'
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
        br = "branch --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(contents:subject) %(color:green)(%(committerdate:relative)) [%(authorname)]' --sort=-committerdate";
        co = "checkout";
        cob = "checkout -b";
        del = "branch -D";
        done = "!git push origin HEAD";
        lg = "!git log --pretty=format:\"%C(magenta)%h%Creset -%C(red)%d%Creset %s %C(dim green)(%cr) [%an]\" --abbrev-commit -30";
        res = "!git reset --hard";
        s = "status";
        save = "!git add -A && git commit -m 'chore: checkpoint'";
        undo = "reset HEAD~1 --mixed";
      };
      enable = true;
      userEmail = "github.frugally996@passmail.net";
      userName = "Justin Gardner";
    };
    home-manager = {
      enable = true;
    };
    neovim = let
      toLua = str: "lua << EOF\n${str}\nEOF\n";
      toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
    in {
      defaultEditor = true;
      enable = true;
      extraLuaConfig = ''
        ${builtins.readFile ./nvim/init.lua}
      '';
      plugins = with pkgs.vimPlugins; [
        popup-nvim
        plenary-nvim
        {
          plugin = tokyonight-nvim;
          config = "colorscheme tokyonight-night";
        }

        # cmp plugins
        nvim-cmp
        cmp-buffer
        cmp-path
        cmp-cmdline
        cmp_luasnip

        # snippets plugins
        luasnip
        friendly-snippets

        telescope-nvim
      ];
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
    };
    tmux = {
      enable = true;
    };
  };
}

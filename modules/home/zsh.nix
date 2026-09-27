{
  pkgs,
  config,
  ...
}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initContent = ''
      set -o vi
      bindkey -v '^?' backward-delete-char

      export FZF_DEFAULT_OPTS="''${FZF_DEFAULT_OPTS} --color=fg:${config.lib.stylix.colors.withHashtag.base04},bg:${config.lib.stylix.colors.withHashtag.base00},hl:${config.lib.stylix.colors.withHashtag.base0D} --color=fg+:${config.lib.stylix.colors.withHashtag.base06},bg+:${config.lib.stylix.colors.withHashtag.base01},hl+:${config.lib.stylix.colors.withHashtag.base0D} --color=info:${config.lib.stylix.colors.withHashtag.base0A},prompt:${config.lib.stylix.colors.withHashtag.base0A},pointer:${config.lib.stylix.colors.withHashtag.base0C} --color=marker:${config.lib.stylix.colors.withHashtag.base0C},spinner:${config.lib.stylix.colors.withHashtag.base0C},header:${config.lib.stylix.colors.withHashtag.base0D}"

      zstyle ':fzf-tab:*' fzf-flags \
        --color=fg:${config.lib.stylix.colors.withHashtag.base04},bg:${config.lib.stylix.colors.withHashtag.base00},hl:${config.lib.stylix.colors.withHashtag.base0D} \
        --color=fg+:${config.lib.stylix.colors.withHashtag.base06},bg+:${config.lib.stylix.colors.withHashtag.base01},hl+:${config.lib.stylix.colors.withHashtag.base0D} \
        --color=info:${config.lib.stylix.colors.withHashtag.base0A},prompt:${config.lib.stylix.colors.withHashtag.base0A},pointer:${config.lib.stylix.colors.withHashtag.base0C} \
        --color=marker:${config.lib.stylix.colors.withHashtag.base0C},spinner:${config.lib.stylix.colors.withHashtag.base0C},header:${config.lib.stylix.colors.withHashtag.base0D}
    '';

    setOptions = [
      "INTERACTIVE_COMMENTS"
    ];

    history = {
      size = 10000;
      save = 10000;
      path = "${config.home.homeDirectory}/.histfile";
      ignoreSpace = false;
    };

    plugins = [
      {
        name = "fzf-tab";
        src = "${pkgs.zsh-fzf-tab}/share/fzf-tab";
      }
    ];

    shellAliases = {
      cat = "bat";
      fetch = "pokeget --hide-name oshawott | fastfetch --file-raw -";
      la = "eza -a";
      ll = "eza --long --icons";
      ls = "eza";
      mkdir = "mkdir -p";
      open = "xdg-open";
      senv = "source .venv/bin/activate";
      szsh = "source ~/.zshrc";
      tmp = "cd /tmp";
      untar = "tar -xvf";
      untgz = "tar -xzvf";
      vzsh = "nvim ~/.zshrc";
      gst = "git status";
    };
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}

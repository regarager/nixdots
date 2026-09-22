{config, ...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    initContent = ''
      set -o vi
      bindkey -v '^?' backward-delete-char
    '';
    setOptions = [
      "INTERACTIVE_COMMENTS"
    ];

    history = {
      size = 10000;
      save = 10000;
      path = "${config.home.homeDirectory}/.histfile";
      ignoreDups = false; # not in your original, but common
      ignoreSpace = false;
    };

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
}

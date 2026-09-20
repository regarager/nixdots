{inputs, ...}: {
  imports = [inputs.shiko-prompt.homeManagerModules.default];

  programs.shiko-prompt = {
    enable = true;
    theme = "themes/default.json";
  };
}

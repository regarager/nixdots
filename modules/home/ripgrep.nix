{...}: {
  programs.ripgrep = {
    enable = true;
    arguments = [
      "--hidden"
      "--glob=!.git/*"
      "--glob=!node_modules/*"
      "--glob=!.venv/*"
      "--glob=!__pycache__/*"
    ];
  };
}

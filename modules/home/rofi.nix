{
  xdg.configFile."rofi/config.rasi".text = ''
      configuration {
        modes: [ window, drun, run ];
        font: "Maple Mono NF 12";
      }

      * {
        /* Gruvbox Dark Palette */
        bg0-hard:       #1d2021;
        bg0:            #282828;
        bg0-soft:       #32302f;
        bg1:            #3c3836;
        bg2:            #504945;
        bg3:            #665c54;
        bg4:            #7c6f64;
        gray:           #928374;
        fg4:            #a89984;
        fg3:            #bdae93;
        fg2:            #d5c4a1;
        fg1:            #ebdbb2;
        fg0:            #fbf1c7;
        red:            #cc241d;
        bright-red:     #fb4934;
        orange:         #d65d0e;
        bright-orange:  #fe8019;
        yellow:         #d79921;
        bright-yellow:  #fabd2f;
        green:          #98971a;
        bright-green:   #b8bb26;
        aqua:           #689d6a;
        bright-aqua:    #8ec07c;
        blue:           #458588;
        bright-blue:    #83a598;
        purple:         #b16286;
        bright-purple:  #d3869b;

        /* Base Rofi Colors */
        foreground:                  @fg1;
        background:                  @bg0;
        background-color:            transparent;

        /* Normal State */
        normal-foreground:           @foreground;
        normal-background:           @background;
        alternate-normal-foreground: @foreground;
        alternate-normal-background: @bg1;
        selected-normal-foreground:  @fg0;
        selected-normal-background:  @green;

        /* Urgent State */
        urgent-foreground:           @bright-red;
        urgent-background:           @red;
        alternate-urgent-foreground: @urgent-foreground;
        alternate-urgent-background: @bg2;
        selected-urgent-foreground:  @fg0;
        selected-urgent-background:  @red;

        /* Active State */
        active-foreground:           @bright-blue;
        active-background:           @bg1;
        alternate-active-foreground: @active-foreground;
        alternate-active-background: @bg2;
        selected-active-foreground:  @fg0;
        selected-active-background:  @blue;

        /* Misc Elements */
        lightbg:                     @bg1;
        lightfg:                     @gray;
        border-color:                @green;
        separatorcolor:              @bg0-hard;
        spacing:                     2;
      }

      entry {
        placeholder: "Search";
      }

      entry, element-text {
        text-color: @fg1;
      }

      element {
        orientation: horizontal;
        children: [ element-icon, element-text ];
        spacing: 8px;
      }

      element-icon {
        size: 2em;
      }

      element-text {
        vertical-align: 0.5;
      }

      element-icon, element-text {
        background-color: inherit;
        text-color: inherit;
        foreground-color: inherit;
      }

      window {
        border-radius: 0.5em;
        border: 2;
        background-color: @bg0;
        width: var(width, 40%);
        height: var(height, 50%);
        padding: 16px;
        transparency: "real";
      }

      inputbar {
          children:   [ prompt,textbox-prompt-colon,entry,case-indicator ];
      }

      textbox-prompt-colon {
          expand:     false;
          str:        ":";
          margin:     0px 0.3em 0em 0em ;
          text-color: @normal-foreground;
      }

      element.normal.normal {
        background-color: @normal-background;
        text-color:       @normal-foreground;
      }

      element.normal.urgent {
        background-color: @urgent-background;
        text-color:       @urgent-foreground;
      }

      element.normal.active {
        background-color: @active-background;
        text-color:       @active-foreground;
      }

      element.selected.normal {
        background-color: @selected-normal-background;
        text-color:       @selected-normal-foreground;
      }

      element.selected.urgent {
        background-color: @selected-urgent-background;
        text-color:       @selected-urgent-foreground;
      }

      element.selected.active {
        background-color: @selected-active-background;
        text-color:       @selected-active-foreground;
      }

      element.alternate.normal {
        background-color: @alternate-normal-background;
        text-color:       @alternate-normal-foreground;
      }

      element.alternate.urgent {
        background-color: @alternate-urgent-background;
        text-color:       @alternate-urgent-foreground;
      }

      element.alternate.active {
        background-color: @alternate-active-background;
        text-color:       @alternate-active-foreground;
      }
  '';
}

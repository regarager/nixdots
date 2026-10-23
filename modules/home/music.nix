{config, ...}: {
  services.mpd = {
    enable = true;
    musicDirectory = "${config.home.homeDirectory}/Music";
  };

  programs.cava.enable = true;

  programs.rmpc = {
    enable = true;
    config = ''
      #![enable(implicit_some)]
      #![enable(unwrap_newtypes)]
      #![enable(unwrap_variant_newtypes)]
      (
        address: "127.0.0.1:6600",
        password: none,
        theme: none,
        cache_dir: none,
        on_song_change: none,
        volume_step: 5,
        max_fps: 30,
        scrolloff: 0,
        wrap_navigation: false,
        enable_mouse: true,
        enable_config_hot_reload: true,
        status_update_interval_ms: 1000,
        rewind_to_start_sec: none,
        reflect_changes_to_playlist: false,
        select_current_song_on_change: false,
        browser_song_sort: [disc, track, artist, title],
        directories_sort: sortformat(group_by_type: true, reverse: false),
        album_art: (
          method: auto,
          max_size_px: (width: 1200, height: 1200),
          disabled_protocols: ["http://", "https://"],
          vertical_align: center,
          horizontal_align: center,
        ),
        keybinds: (
          global: {
            ":":    commandmode,
            ",":    volumedown,
            "s":    stop,
            ".":    volumeup,
            "<tab>":  nexttab,
            "<s-tab>": previoustab,
            "1":    switchtotab("queue"),
            "2":    switchtotab("directories"),
            "3":    switchtotab("artists"),
            "4":    switchtotab("album artists"),
            "5":    switchtotab("albums"),
            "6":    switchtotab("playlists"),
            "7":    switchtotab("search"),
            "q":    quit,
            ">":    nexttrack,
            "p":    togglepause,
            "<":    previoustrack,
            "f":    seekforward,
            "z":    togglerepeat,
            "x":    togglerandom,
            "c":    toggleconsume,
            "v":    togglesingle,
            "b":    seekback,
            "~":    showhelp,
            "u":    update,
            "u":    rescan,
            "i":    showcurrentsonginfo,
            "o":    showoutputs,
            "p":    showdecoders,
            "r":    addrandom,
          },
          navigation: {
            "k":     up,
            "j":     down,
            "h":     left,
            "l":     right,
            "<up>":   up,
            "<down>":  down,
            "<left>":  left,
            "<right>":  right,
            "<c-k>":   paneup,
            "<c-j>":   panedown,
            "<c-h>":   paneleft,
            "<c-l>":   paneright,
            "<c-u>":   uphalf,
            "n":     previousresult,
            "a":     add,
            "a":     addall,
            "r":     rename,
            "n":     nextresult,
            "g":     top,
            "<space>":  select,
            "<c-space>": invertselection,
            "g":     bottom,
            "<cr>":   confirm,
            "i":     focusinput,
            "j":     movedown,
            "<c-d>":   downhalf,
            "/":     entersearch,
            "<c-c>":   close,
            "<esc>":   close,
            "k":     moveup,
            "d":     delete,
            "b":     showinfo,
          },
          queue: {
            "d":    deleteall,
            "<cr>":  play,
            "<c-s>":  save,
            "a":    addtoplaylist,
            "d":    delete,
            "c":    jumptocurrent,
            "x":    shuffle,
          },
        ),
        search: (
          case_sensitive: false,
          mode: contains,
          tags: [
            (value: "any",     label: "any tag"),
            (value: "artist",   label: "artist"),
            (value: "album",    label: "album"),
            (value: "albumartist", label: "album artist"),
            (value: "title",    label: "title"),
            (value: "filename",  label: "filename"),
            (value: "genre",    label: "genre"),
          ],
        ),
        artists: (
          album_display_mode: splitbydate,
          album_sort_by: date,
        ),
        tabs: [
          (
            name: "queue",
            pane: split(
              direction: horizontal,
              panes: [(size: "40%", pane: pane(albumart)), (size: "60%", pane: pane(queue))],
            ),
          ),
          (
            name: "directories",
            pane: pane(directories),
          ),
          (
            name: "artists",
            pane: pane(artists),
          ),
          (
            name: "album artists",
            pane: pane(albumartists),
          ),
          (
            name: "albums",
            pane: pane(albums),
          ),
          (
            name: "playlists",
            pane: pane(playlists),
          ),
          (
            name: "search",
            pane: pane(search),
          ),
        ],
        cava: (
          framerate: 60, // default 60
          autosens: true, // default true
          sensitivity: 100, // default 100
          lower_cutoff_freq: 50, // not passed to cava if not provided
          higher_cutoff_freq: 10000, // not passed to cava if not provided
          input: (
            method: fifo,
            source: "/tmp/mpd.fifo",
            sample_rate: 44100,
            channels: 2,
            sample_bits: 16,
          ),
          smoothing: (
            noise_reduction: 77, // default 77
            monstercat: false, // default false
            waves: false, // default false
          ),
          // this is a list of floating point numbers thats directly passed to cava
          // they are passed in order that they are defined
          eq: []
        ),
      )
    '';
  };
}

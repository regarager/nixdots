{config, ...}: {
  programs.firefox = {
    enable = true;
    configPath = "${config.xdg.configHome}/mozilla/firefox";

    policies = {
      DisableFirefoxStudies = true;
      DisableTelemetry = true;
      DisablePocket = true;
      DisableFirefoxAccounts = true;
      DisableSetDesktopBackground = true;
      DontCheckDefaultBrowser = true;
      NoDefaultBookmarks = true;
      OverrideFirstRunPage = "";
      OverridePostUpdatePage = "";

      ExtensionSettings = {
        "{762f9885-5a13-4abd-9c77-433dcd38b8fd}" = {
          # Return YouTube Dislike
          installation_mode = "normal_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/return-youtube-dislikes/addon.xpi";
        };

        "sponsorBlocker@ajay.app" = {
          # SponsorBlock
          installation_mode = "normal_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/addon.xpi";
        };

        "uBlock0@raymondhill.net" = {
          # uBlock Origin
          installation_mode = "normal_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/addon.xpi";
        };
      };
      FirefoxHome = {
        Search = true;
        TopSites = false;
        SponsoredTopSites = false;
        Highlights = false;
        Pocket = false;
        SponsoredPocket = false;
        Snippets = false;
        Locked = false;
      };

      FirefoxSuggest = {
        WebSuggestions = false;
        SponsoredSuggestions = false;
        ImproveSuggest = false;
      };

      GenerativeAI = {Enabled = false;};

      Homepage = {
        StartPage = "previous-session";
      };

      NewTabPage = false;

      SearchSuggestEnabled = false;
      ShowHomeButton = true;

      SearchEngines = {
        Default = "DuckDuckGo";
        DefaultPrivate = "DuckDuckGo";
        Remove = ["Perplexity" "eBay" "Amazon.com"];
      };

      UserMessaging = {
        WhatsNew = false;
        ExtensionRecommendations = false;
        FeatureRecommendations = false;
        UrlbarInterventions = false;
        SkipOnboarding = true;
        MoreFromMozilla = false;
        FirefoxLabs = false;
      };
    };
    profiles.default = {
      isDefault = true;
      extensions.force = true;

      settings = {
        "app.normandy.api_url" = "";
        "app.normandy.enabled" = false;
        "app.shield.optoutstudies.enabled" = false;
        "breakpad.reportURL" = "";
        "browser.aboutwelcome.enabled" = false;
        "browser.contentblocking.report.lockwise.enabled" = false;
        "browser.contentblocking.report.monitor.enabled" = false;
        "browser.crashReports.unsubmittedCheck.autoSubmit2" = false;
        "browser.discovery.enabled" = false;
        "browser.download.useDownloadDir" = false;
        "browser.messaging-system.whatsNewPanel.enabled" = false;
        "browser.newtabpage.activity-stream.default.sites" = "";
        "browser.newtabpage.activity-stream.enabled" = false;
        "browser.newtabpage.activity-stream.feeds.section.highlights" = false;
        "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
        "browser.newtabpage.activity-stream.feeds.snippets" = false;
        "browser.newtabpage.activity-stream.feeds.telemetry" = false;
        "browser.newtabpage.activity-stream.feeds.topsites" = false;
        "browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
        "browser.newtabpage.activity-stream.showSearch" = true;
        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.newtabpage.activity-stream.telemetry" = false;
        "browser.newtabpage.enabled" = false;
        "browser.ping-centre.telemetry" = false;
        "browser.places.speculativeConnect.enabled" = false;
        "browser.promo.focus.enabled" = false;
        "browser.promo.pin.enabled" = false;
        "browser.safebrowsing.downloads.remote.enabled" = false;
        "browser.search.separatePrivateDefault" = false;
        "browser.shell.checkDefaultBrowser" = false;
        "browser.startup.homepage_override.mstone" = "ignore";
        "browser.startup.page" = 3;
        "browser.tabs.crashReporting.sendReport" = false;
        "browser.tabs.firefox-view" = false;
        "browser.tabs.firefox-view-next" = false;
        "browser.toolbars.bookmarks.visibility" = "never";
        "browser.uitour.enabled" = false;
        "browser.urlbar.quicksuggest.enabled" = false;
        "browser.urlbar.shortcuts.bookmarks" = true;
        "browser.urlbar.shortcuts.history" = true;
        "browser.urlbar.shortcuts.tabs" = true;
        "browser.urlbar.suggest.addons" = false;
        "browser.urlbar.suggest.engines" = false;
        "browser.urlbar.suggest.fakespot" = false;
        "browser.urlbar.suggest.history" = false;
        "browser.urlbar.suggest.mdn" = false;
        "browser.urlbar.suggest.openpage" = false;
        "browser.urlbar.suggest.pocket" = false;
        "browser.urlbar.suggest.quickactions" = false;
        "browser.urlbar.suggest.quicksuggest.nonsponsored" = false;
        "browser.urlbar.suggest.quicksuggest.sponsored" = false;
        "browser.urlbar.suggest.recentsearches" = false;
        "browser.urlbar.suggest.searches" = false;
        "browser.urlbar.suggest.topsites" = false;
        "browser.urlbar.suggest.trending" = false;
        "browser.urlbar.suggest.weather" = false;
        "browser.urlbar.suggest.yelp" = false;
        "browser.vpn_promo.enabled" = false;
        "datareporting.healthreport.uploadEnabled" = false;
        "datareporting.policy.dataSubmissionEnabled" = false;
        "extensions.autoDisableScopes" = 0;
        "extensions.getAddons.showPane" = false;
        "extensions.htmlaboutaddons.recommendations.enabled" = false;
        "extensions.pocket.api" = "";
        "extensions.pocket.enabled" = false;
        "extensions.pocket.site" = "";
        "identity.fxaccounts.enabled" = true;
        "network.dns.disablePrefetch" = true;
        "network.http.speculative-parallel-limit" = 0;
        "network.predictor.enabled" = false;
        "network.prefetch-next" = false;
        "permissions.default.geo" = 0;
        "services.sync.enabled" = false;
        "services.sync.engine.addons" = false;
        "services.sync.engine.addresses.available" = false;
        "services.sync.engine.bookmarks" = false;
        "services.sync.engine.history" = false;
        "services.sync.engine.passwords" = false;
        "services.sync.engine.prefs" = false;
        "services.sync.engine.tabs" = false;
        "sidebar.main.tools" = "opentabs";
        "sidebar.newTool.migration.passwords" = ''{"visibilityPref":"browser.contextual-password-manager.enabled","alreadyShown":true}'';
        "sidebar.revamp" = true;
        "sidebar.verticalTabs" = true;
        "toolkit.telemetry.archive.enabled" = false;
        "toolkit.telemetry.bhrPing.enabled" = false;
        "toolkit.telemetry.enabled" = false;
        "toolkit.telemetry.firstShutdownPing.enabled" = false;
        "toolkit.telemetry.newProfilePing.enabled" = false;
        "toolkit.telemetry.server" = "";
        "toolkit.telemetry.shutdownPingSender.enabled" = false;
        "toolkit.telemetry.unified" = false;
        "toolkit.telemetry.updatePing.enabled" = false;
      };
    };
  };
}

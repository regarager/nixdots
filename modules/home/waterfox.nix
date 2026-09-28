{config, ...}: {
  home.file.".waterfox/profiles.ini".text = ''
    [General]
    StartWithLastProfile=1

    [Profile0]
    Name=default
    IsRelative=0
    Path=${config.home.homeDirectory}/.waterfox/default
    Default=1
  '';

  home.file.".waterfox/default/user.js".text = ''
    user_pref("toolkit.telemetry.enabled", false);
    user_pref("datareporting.healthreport.uploadEnabled", false);
    user_pref("datareporting.policy.dataSubmissionEnabled", false);
    user_pref("extensions.pocket.enabled", false);
    user_pref("browser.newtabpage.activity-stream.feeds.topsites", false);
    user_pref("browser.newtabpage.activity-stream.feeds.section.highlights", false);
    user_pref("browser.newtabpage.activity-stream.feeds.snippets", false);
    user_pref("browser.newtabpage.activity-stream.showSponsored", false);
    user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);
    user_pref("browser.newtabpage.activity-stream.showSearch", true);
    user_pref("browser.search.separatePrivateDefault", false);
    user_pref("browser.toolbars.bookmarks.visibility", "never");
    user_pref("browser.urlbar.suggest.engines", false);
    user_pref("browser.urlbar.suggest.history", false);
    user_pref("browser.urlbar.suggest.openpage", false);
    user_pref("browser.urlbar.suggest.quickactions", false);
    user_pref("browser.urlbar.suggest.recentsearches", false);
    user_pref("browser.urlbar.suggest.searches", false);
    user_pref("browser.urlbar.suggest.topsites", false);
  '';
}

{
  pkgs,
  lib,
  ...
}: let
  swaylock = lib.getExe pkgs.swaylock;
  brightnessctl = lib.getExe pkgs.brightnessctl;
  systemctl = "${pkgs.systemd}/bin/systemctl";
  pidof = "${pkgs.procps}/bin/pidof";

  lock = "${pidof} swaylock || ${swaylock} -f";
in {
  services.swayidle = {
    enable = true;

    events = {
      before-sleep = lock;
      lock = lock;
      after-resume = "${brightnessctl} -r";
    };

    timeouts = [
      {
        timeout = 300;
        command = "${brightnessctl} -s && ${brightnessctl} set 5";
        resumeCommand = "${brightnessctl} -r";
      }
      {
        timeout = 600;
        command = "${brightnessctl} set 0";
        resumeCommand = "${brightnessctl} -r";
      }
      {
        timeout = 900;
        command = "${systemctl} suspend";
      }
    ];
  };
}

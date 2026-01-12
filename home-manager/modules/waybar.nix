{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.my.waybar;
in
{
  options.my.waybar.enable = lib.mkEnableOption "Enable my Waybar setup";

  config = lib.mkIf cfg.enable {

    programs.waybar = {
      enable = true;

      settings = [
        {
          layer = "top";
          height = 25;

          modules-left = [
            "sway/workspaces"
            "custom/arrow6"
            "sway/mode"
            "mpris"
          ];

          modules-center = [ "clock#1" ];

          modules-right = [
            "custom/arrow5"
            "pulseaudio"
            "custom/arrow4"
            "clock#2"
            "custom/arrow3"
            "cpu"
            "memory"
            "custom/arrow1"
            "tray"
            "custom/arrow2"
            "sway/language"
          ];

          "sway/workspaces" = {
            disable-scroll = false;
            all-outputs = false;
            format = "{name}";
          };

          "sway/mode" = {
            format = "<span style=\"italic\">{}</span>";
          };

          tray.spacing = 10;

          "clock#1".tooltip-format = "{:%Y-%m-%d | %H:%M}";
          "clock#2" = {
            format = "{:%d. %B %Y}";
            tooltip-format = "{:%Y-%m-%d | %H:%M}";
          };

          cpu.format = "{usage}% ";
          memory.format = "{}% ";

          network = {
            format-wifi = "{essid} ({signalStrength}%) ";
            format-ethernet = "{ifname}: {ipaddr}/{cidr} ";
            format-disconnected = "Disconnected ⚠";
          };

          pulseaudio = {
            scroll-step = 5;
            format = "{volume}% {icon}";
            format-bluetooth = "{volume}% {icon}";
            format-muted = "";
            "format-icons" = {
              headphones = "";
              handsfree = "";
              headset = "";
              phone = "";
              portable = "";
              car = "";
              default = [
                ""
                ""
              ];
            };
            on-click = "pavucontrol";
          };

          mpris = {
            format = "{status_icon} {artist} - {title}";
            format-stopped = "";
            "status-icons" = {
              playing = "";
              paused = "󰐊";
            };
          };

          "custom/arrow1".format = "";
          "custom/arrow2".format = "";
          "custom/arrow3".format = "";
          "custom/arrow4".format = "";
          "custom/arrow5".format = "";
          "custom/arrow6".format = "";
        }
      ];

      style = ''
        * {
          border: none;
          border-radius: 0;
          font-family: Iosevka Nerd Font Propo Light;
          font-size: 14px;
          min-height: 0;
        }

        window#waybar {
          background-color: #282828;
          color: #949494;
        }

        #workspaces button {
          padding: 0 5px;
          background: #4a4a4a;
          color: white;
        }

        #workspaces button.focused {
          color: #ff8700;
        }

        #mode {
          background: #282828;
          color: #d05c5c;
        }

        #clock.1, #clock.2, #cpu, #memory, #network, #pulseaudio,
        #tray, #mode, #idle_inhibitor {
          padding: 0 10px;
          margin: 0;
        }

        #clock.1 {
          background-color: transparent;
          font-size: 18px;
        }

        #cpu {
          background: #4e4e4e;
        }

        #memory {
          background: #4e4e4e;
        }

        #clock.2 {
          background: #4e4e4e;
        }

        #network.disconnected {
          background: transparent;
        }

        #language {
          background: #ff8700;
          color: #282828;
        }

        #pulseaudio {
          background: #3a3a3a;
        }

        #pulseaudio.muted {
          background: #90b1b1;
          color: #2a5c45;
        }

        #tray {
          background-color: #3a3a3a;
        }

        #custom-arrow1 {
          font-size: 24px;
          color: #3a3a3a;
          background: #4e4e4e;
        }

        #custom-arrow2 {
          font-size: 24px;
          color: #ff8700;
          background: #3a3a3a;
        }

        #custom-arrow3 {
          font-size: 24px;
          background: #4e4e4e;
          color: #949494;
        }

        #custom-arrow4 {
          font-size: 24px;
          color: #4e4e4e;
          background: #3a3a3a;
        }

        #custom-arrow5 {
          font-size: 24px;
          color: #3a3a3a;
          background: transparent;
        }

        #custom-arrow6 {
          font-size: 24px;
          color: #4a4a4a;
          background: transparent;
        }
      '';
    };
  };
}

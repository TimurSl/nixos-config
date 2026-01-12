{ config, lib, ... }:

{
  swayExtraConfig = ''
    output * bg ~/.config/sway/bg.jpg fill 
    output eDP-1 mode 2560x1440@180Hz 
  ''; # под свой монитор адаптировал
}

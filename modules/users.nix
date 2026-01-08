{ pkgs, ... }: {
  users.users.tymur = {
    isNormalUser = true;
    extraGroups = [ "wheel" "openrazer" "dialout" ];
    packages = with pkgs; [ tree ];
  };
}

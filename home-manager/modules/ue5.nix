{ pkgs, ... }:
{
  home.packages = with pkgs; [
    lld
    cmake
    ninja
    dotnet-sdk_8
    dotnet-runtime
    mono
    zlib
    icu
    libuuid
    vulkan-loader
    vulkan-headers
    SDL2
    alsa-lib
    openssl
    curl
  ];
}

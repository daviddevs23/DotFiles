{ pkgs, lib, inputs, ... }:

{
  imports =
    [
      inputs.home-manager.nixosModules.default
    ];
  # Install base software like neovim, disocrd
  # Install and configure all software (sway, git, background, fonts, themes)
  # Manage ZSH config or pretty much all configs
}

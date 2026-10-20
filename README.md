# dotfiles

My config files for Arch Linux with Hyprland, on a Dynabook laptop (Ryzen 7 5800U). Everything uses the Catppuccin Mocha colours with a mauve accent.

Managed with GNU Stow: each folder is a "package" that mirrors where its files live in the home folder, so `hypr/.config/hypr/hyprland.lua` ends up at `~/.config/hypr/hyprland.lua`.

## What's in here

- **hypr** - Hyprland itself, using the new Lua config (`hyprland.lua`), plus `hyprlock.conf` (lock screen), `hypridle.conf` (lock and sleep when idle or when the lid closes) and `hyprpaper.conf` (wallpaper).
  - `scripts/snip.sh` - region screenshot that freezes the screen while you select, like the Windows Snipping Tool. Copies to clipboard or opens in satty to annotate.
  - Window rule that opens Discord's startup splash on workspace 5 so it doesn't jump over other windows.
  - Window resize animation shortened to 0.2 s so apps don't lag behind it.
- **waybar** - the top bar. Arch logo button that opens the app launcher, workspaces 1-5, focused window title with a close button, clock, keyboard layout, volume, brightness, Wi-Fi, power profile, CPU, temperature, battery, tray and a power menu.
- **fuzzel** - app launcher (Super+R), also used by the power menu.
- **mako** - notifications. They disappear after 5 seconds, urgent ones stay until clicked.
- **kitty** - terminal.
- **starship** - shell prompt.
- **btop** - system monitor.
- **bash** - `.bashrc`.

## Keybinds

- Super+Q - terminal
- Super+R - app launcher
- Super+E - file manager (Dolphin)
- Super+C - close window
- Super+V - float / unfloat window
- Super+J - switch split direction
- Super+arrows - move focus
- Super+1-0 - go to workspace
- Super+Shift+1-0 - move window to workspace
- Super+S - show/hide scratchpad
- Super+Shift+X - send window to scratchpad
- Super+Shift+S - screenshot a region to clipboard
- Super+Shift+A - screenshot a region and annotate in satty
- Super+Shift+D - full screenshot after 2 seconds (for menus)
- Super+L - lock
- Super+M - log out
- Alt+Shift - switch keyboard layout (US / LT)
- Three-finger swipe - switch workspace

## Autostart

Polkit agent, Waybar, nm-applet, hypridle, hyprpaper, Discord (minimised to tray), and two dashboard kitty windows with fastfetch and btop.

## Packages it expects

hyprland, hyprlock, hypridle, hyprpaper, hyprpicker, waybar-git (AUR, needed for clickable workspaces with the Lua config), fuzzel, mako, kitty, starship, btop, fastfetch, grim, slurp, wl-clipboard, satty, network-manager-applet, brightnessctl, pavucontrol, ttf-jetbrains-mono-nerd, stow.

## Install

```
git clone git@github.com:rraulusevicius/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow bash btop fuzzel hypr kitty mako starship waybar
```

Stow won't overwrite files that already exist, so move or delete the default ones first (like `~/.bashrc`).

## Not included

- The wallpaper.
- GTK/KDE theme, icon theme (breeze-dark) and the Catppuccin cursor. These are set with `gsettings` and KDE's settings rather than files in this repo.
- Anything secret. Tokens and API keys go in a separate file that isn't tracked.

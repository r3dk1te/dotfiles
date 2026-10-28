# dotfiles

Gruvbox rice for Linux Mint XFCE. Copy whatever you like.

| | |
|---|---|
| `.zshrc`, `.p10k.zsh` | zsh with [oh-my-zsh](https://ohmyz.sh), [powerlevel10k](https://github.com/romkatv/powerlevel10k), [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions), [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) |
| `.gtkrc-2.0` | GTK2 icon theme |
| `.config/` | fastfetch, sakura, gtk-3.0 (`gtk.css`), btop, tmux, xfce4 (panel, window manager, settings) |
| `themes/` | window-border theme, plus where to get the GTK theme and fonts |
| `icons/` | where to get the icons and cursor |
| `wallpaper/` | where the wallpaper is from |
| `system/` | login screen (slick-greeter) config, wallpaper left blank |

`/home/USER` appears in `.config/fastfetch/config.jsonc` and `.config/sakura/sakura.conf`: change it to your home folder.
Copy the `.config/xfce4` XML files while logged out, or XFCE will overwrite them when you log out.

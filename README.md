# dotfiles

![Avatar](./avatars/RobiAvatar.png)

Hi :)

## References

Some parts of my setup are heavily inspired by others.

### User [Treeniks](https://github.com/Treeniks):
- **nvim**: He basically taught me almost everything I know about vim/nvim. So I inherited his setup.
- **waybar**: I used his **waybar** as a starting point, since it is designed to work with minimal linux installs (no bullshit, clean and simple). I color matched my version to match the catppuccin-mocha palette and added some simple additional elements.
- **dotfiles organisation**: His way of organising dotfiles is simple and clean, so I copied it (he is using julia and python scripts to automate most configs). Definetely check out his [dotfiles](https://github.com/Treeniks/dotfiles)!

## Bootloader

I personally like to use **Grub**, since it has always worked for me without a hitch and encryption just works.

## Folder Icons

- [Catppuccin Papirus](https://github.com/catppuccin/papirus-folders)

## GTK

- [Catppuccin gtk](https://github.com/catppuccin/gtk)

## Wallpapers

- [Catppuccin](https://github.com/Gingeh/wallpapers)
- [HQ Anime Wallpapers](https://www.flickr.com/photos/147283717@N03/albums)
- [wdsrocha's wallpapers](https://github.com/wdsrocha/wallpapers)
- [Gwynsav's walls](https://github.com/Gwynsav/walls)

## Setup Stuff I Might Forget

### Linux User Groups:

Add yourself to the groups:
```
wheel video audio input
```

### Gnome `us+altgr-intl` Keyboard

Install `dconf-editor`, locate `org/gnome/desktop/input-sources/sources` and add  `('xkb', 'us+altgr-intl')` to `Custom value` array

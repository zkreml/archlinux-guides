# archlinux-guides

Tento repozitář obsahuje návody a průvodce pro různé aspekty Arch Linuxu, včetně konfigurace nástrojů jako Dunst, i3 a dalších.

## Obsah

- [Dunst - Nastavení notifikací](guides/dunst.md)
- [i3 - Konfigurace správce oken](guides/i3.md)
- [Automatizace aktualizací pomocí skriptů](guides/update-scripts.md)
- [Automatické připojení LUKS disku po startu](guides/luks-mount.md)
## Požadavky

- Arch Linux
- Základní znalost práce s terminálem
- Nainstalované balíčky: `dunst`, `i3`, `yay`

## Instalace

1. Aktualizujte systém:

 ```bash
  sudo pacman -Syu
```
2. Nainstalujte potřebné balíčky:

```
sudo pacman -S dunst i3
yay -S papirus-icon-theme
```


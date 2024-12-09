# Dunst - Nastavení notifikací

## Úvod
**Dunst** je minimalistický démon pro systémové notifikace. Je ideální pro lehká prostředí jako i3wm.

## Konfigurace
- Konfigurační soubor: `~/.config/dunst/dunstrc`
- Restart Dunst:
  ```bash
  pkill dunst && dunst &
  ```

## Nastavení ikon
- Téma ikon: **Papirus Icon Theme**
- Cesta k ikonám: `/usr/share/icons/Papirus/16x16/status`
- Ukázka konfigurace:

  ```ini
  [urgency_normal]
  icon = /usr/share/icons/Papirus/16x16/status/package-installed-updated.svg
  ```

## Testování notifikací
Spusť testovací notifikaci:


```bash
notify-send -i package-installed-updated "Test Ikona" "Ukázka notifikace"
```

## Problémy a řešení

- Ikony se nezobrazují:
  
1. Ověř cestu k ikonám:

```bash
ls /usr/share/icons/Papirus/16x16/status
```

2. Uprav cestu v `dunstrc`.

```bash
nano ~/.config/dunst/dunstrc
```
## Reference

[Dunst dokumentace](https://dunst-project.org/documentation/)



# WezTerm – moderní GPU-akcelerovaný terminál pro Arch Linux

WezTerm je multiplatformní, velmi rychlý a flexibilní terminál s podporou Lua konfigurace, GPU akcelerací a moderními funkcemi jako taby, panely nebo Wayland.

---

## ✨ Instalace

```bash
sudo pacman -S wezterm
```

---

## 📂 Umístění konfiguračního souboru

WezTerm hledá konfiguraci v následujícím pořadí:

1. `~/.wezterm.lua`
2. `~/.config/wezterm/wezterm.lua`
3. Přes argument `--config-file`

Doporučené umístění podle XDG standardu je:

```bash
~/.config/wezterm/wezterm.lua
```

---

## 🔧 Příklad praktické konfigurace

```lua
local wezterm = require("wezterm")

return {
  font = wezterm.font("FiraCode Nerd Font", { weight = "Regular" }),
  font_size = 12.0,
  color_scheme = "Gruvbox Dark",

  enable_tab_bar = false,
  use_fancy_tab_bar = false,
  hide_mouse_cursor_when_typing = true,
  window_background_opacity = 1.0,

  keys = {
    { key = "LeftArrow", mods = "ALT", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
    { key = "RightArrow", mods = "ALT", action = wezterm.action({ ActivatePaneDirection = "Right" }) },
    { key = "UpArrow", mods = "ALT", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
    { key = "DownArrow", mods = "ALT", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
    { key = "d", mods = "CTRL|SHIFT", action = wezterm.action.SplitHorizontal({}) },
    { key = "e", mods = "CTRL|SHIFT", action = wezterm.action.SplitVertical({}) },
    { key = "w", mods = "CTRL|SHIFT", action = wezterm.action({ CloseCurrentPane = { confirm = true } }) },
    { key = "t", mods = "CTRL", action = wezterm.action({ SpawnTab = "DefaultDomain" }) },
    { key = "PageUp", mods = "CTRL", action = wezterm.action({ ActivateTabRelative = -1 }) },
    { key = "PageDown", mods = "CTRL", action = wezterm.action({ ActivateTabRelative = 1 }) },
  },
}
```

---

## ⚙️ Multiplexing a panely

WezTerm podporuje více panelů (splits) i tabů – podobně jako tmux.

- **Rozdělení horizontálně:** `CTRL + SHIFT + D`
- **Rozdělení vertikálně:** `CTRL + SHIFT + E`
- **Přepínání mezi panely:** `ALT + šipky`
- **Zavření panelu:** `CTRL + SHIFT + W`

---

## 🔐 SSH integrace

WezTerm má integrovaný SSH klient:

```bash
wezterm ssh user@host
```

Lze také vytvořit profily v Lua konfiguraci:

```lua
ssh_domains = {
  {
    name = "server",
    remote_address = "user@192.168.1.10",
  },
},
```

---

## 🎨 Vlastní barvy

```lua
colors = {
  foreground = "#ebdbb2",
  background = "#282828",
  cursor_bg = "#ebdbb2",
  ansi = { "#282828", "#cc241d", "#98971a", "#d79921", "#458588", "#b16286", "#689d6a", "#a89984" },
  brights = { "#928374", "#fb4934", "#b8bb26", "#fabd2f", "#83a598", "#d3869b", "#8ec07c", "#ebdbb2" },
}
```

---

## ⚖️ Integrace s i3 a Wayland

### i3

```text
bindsym $mod+Return exec wezterm
```

### Wayland

```bash
WEZTERM_WAYLAND=1 wezterm
```

nebo:

```bash
export WEZTERM_WAYLAND=1
```

---

## 🔍 Tipy pro použití

- Reload konfigurace: `CTRL + SHIFT + R`
- Barvy: `wezterm ls-colors`
- Kopírování/vkládání: `CTRL + SHIFT + C/V`

---

## 📝 Nastavení Neovimu jako výchozího editoru

```bash
export EDITOR=nvim
export VISUAL=nvim
```

```bash
source ~/.zshrc
echo $EDITOR
```

```bash
sudo visudo
# Defaults editor=/usr/bin/nvim
```

---

## 🔗 Odkazy

- [Oficiální stránky](https://wezfurlong.org/wezterm)
- [Barevná schémata](https://github.com/wez/wezterm/tree/main/colors)
- [Lua konfigurace](https://wezfurlong.org/wezterm/config/files.html)

# omarchy-dtp-theme

The dtp look for Omarchy, as a theme, so a change to how the system looks is made once here and installs everywhere.

It is Tokyo Night (colors, backgrounds, icons) plus section overrides for the shell. Omarchy lets a theme ship `shell.<section>.toml` to replace one section of the generated `shell.toml`, so each file here changes one part of the look and leaves the rest alone.

| File | What it changes |
| --- | --- |
| `shell.popups.toml` | Every bar flyout (audio, Bluetooth, Wi-Fi, display, agents…): flat, no border |

## Install

`omarchy-dtp-install` runs this. From GitHub:

```bash
omarchy theme install https://github.com/dtpietrzak/omarchy-dtp-theme.git
omarchy theme set dtp
```

Installing switches the machine to this theme. A machine that uses another theme's colors or wallpaper changes to Tokyo Night's.

Later changes come with `omarchy theme update`.

## Adding to it

Copy a section out of `/usr/share/omarchy/default/themed/shell.toml.tpl` into `shell.<section>.toml`, keep the whole section (the file replaces it), and change what you want. Colors can be role names (`background`, `foreground`, `accent`) or hex, but not `{{ }}` placeholders.

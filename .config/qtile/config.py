# Qtile Config

# Imports
import os, subprocess
from libqtile.config import Key, KeyChord, Group, Screen, Drag, Click, Match
from libqtile.lazy import lazy
from libqtile import layout, bar, widget, hook

# Convenience Variables
mod = "mod4"
terminal = "alacritty"
browser = "firefox"

# Keybinds
keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus to down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus to up"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "space", lazy.layout.next(), desc="Move focus to next window"),

    # Move windows in stack
    Key([mod, "shift"], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod, "shift"], "j", lazy.layout.down(), desc="Move focus to down"),
    Key([mod, "shift"], "k", lazy.layout.up(), desc="Move focus to up"),
    Key([mod, "shift"], "l", lazy.layout.right(), desc="Move focus to right"),

    # Applications
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "b", lazy.spawn(browser), desc="Launch web browser"),

    # Utility
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "q", lazy.window.kill(), desc="Close current window"),
    Key([mod], "p", lazy.spawn("dmenu_run -h 24"), desc="Launch dmenu, run prompt"),
    Key([mod], "u", lazy.spawn("playerctl play-pause"), desc="Media play-pause"),
    KeyChord([mod], "s", [
        Key([mod], "f", lazy.spawn("flameshot full -p ~/Pictures/Screenshots/"), desc="Takes screenshot of all screens"),
        Key([mod], "c", lazy.spawn("flameshot gui"), desc="Launches gui screenshot"),
        Key([mod], "d", lazy.spawn("flameshot screen -c -p ~/Pictures/Screenshots"), desc="Takes screenshot of one screen"),
        Key([mod], "l", lazy.spawn("flameshot launcher"), desc="Launches screenshot config")
    ], desc="Launch screenshot utility"),

    # Qtile
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload Qtile config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Close Qtile and go to TTY"),

    # Fn Keys
    Key([], "XF86AudioMute", lazy.spawn("pamixer -t"), desc="Toggle mute using mute button"),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("pamixer -i 5"), desc="Raise volume by 5%"),
    Key([], "XF86AudioLowerVolume", lazy.spawn("pamixer -d 5"), desc="Lower volume by 5%"),
    Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl s 5%-"), desc="Lower screen brightness by 5%"),
    Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl s 5%+"), desc="Increase screen brightness by 5%")
]

# Groups
groups = [Group(i) for i in "1234567890"]

for i in groups:
    keys.extend([
            Key([mod], i.name, lazy.group[i.name].toscreen(), desc="Switch to group {}".format(i.name)),
            Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True), desc="Switch to & move focused window to group {}".format(i.name))
        ])

# groups = [
#     Group(name = "01", screen_affinity = 0, label = "1"),
#     Group(name = "02", screen_affinity = 0, label = "2"),
#     Group(name = "03", screen_affinity = 0, label = "3"),
#     Group(name = "04", screen_affinity = 0, label = "4"),
#     Group(name = "05", screen_affinity = 0, label = "5"),
#     Group(name = "06", screen_affinity = 0, label = "6"),
#     Group(name = "07", screen_affinity = 0, label = "7"),
#     Group(name = "08", screen_affinity = 0, label = "8"),
#     Group(name = "09", screen_affinity = 0, label = "9"),
#     Group(name = "11", screen_affinity = 1, label = "1"),
#     Group(name = "12", screen_affinity = 1, label = "2"),
#     Group(name = "13", screen_affinity = 1, label = "3"),
#     Group(name = "14", screen_affinity = 1, label = "4"),
#     Group(name = "15", screen_affinity = 1, label = "5"),
#     Group(name = "16", screen_affinity = 1, label = "6"),
#     Group(name = "17", screen_affinity = 1, label = "7"),
#     Group(name = "18", screen_affinity = 1, label = "8"),
#     Group(name = "19", screen_affinity = 1, label = "9"),
# ]

# Colourscheme, based on tokyonight.nvim moon
colours = [
    "#c8d3f5",      # foreground/text   [0]
    "#1e2030",      # background        [1]
    "#c53b53",      # red               [2]
    "#c3e88d",      # green             [3]
    "#ffc777",      # yellow            [4]
    "#3e68d7",      # blue              [5]
    "#c099ff",      # purple            [6]
    "#4fd6be",      # cyan              [7]
    "#ff966c",      # orange            [8]
    "#2f334d"       # grey              [9]
]

# Layouts
layouts = [
    layout.MonadTall( #type: ignore
        margin = 8,
        border_normal = colours[9],
        border_focus = colours[5]
    ),
    layout.Max(), #type: ignore
    layout.Floating() #type: ignore
]

# Widget Default Settings
widget_defaults = dict(
    font = "sans",
    fontsize = 12,
    padding = 3,
    background = colours[1],
    foreground = colours[0]
)
extension_defaults = widget_defaults.copy()

# Screens and Bar
screens = [
    Screen(
        top = bar.Bar(
            [
                widget.CurrentLayoutIcon(),
                widget.GroupBox(
                    active = colours[8],
                    borderwidth = 0,
                    inactive = colours[0],
                    highlight_color = colours[9],
                    highlight_method = "line"
                ),
                widget.WindowName(),
                widget.Systray(),
                widget.Volume(fmt = "Vol: {}"),
                widget.Battery(),
                widget.Clock(format="%Y-%m-%d %a %I:%M %p")
            ], size=24
        )
    )
]

# Mouse Support
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

# Misc settings from default config
dgroups_key_binder = None
dgroups_app_rules = [] # type: list
follow_mouse_focus = False
bring_front_click = False
cursor_wrap = False
floating_layout = layout.Floating(                  #type: ignore
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,       #type: ignore
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True
wmname = "LG3D"

# Autostart Hook
@hook.subscribe.startup_once
def autostart():
    autostart_path = os.path.expanduser("~/.config/qtile/autostart.sh")
    subprocess.Popen([autostart_path])

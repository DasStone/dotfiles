#!/usr/bin/env python3

from sys import path
from os.path import realpath, dirname
path.append(dirname(dirname(realpath(__file__))))
from utils import *

check_os(OS.LINUX)

target = join(target_dir(), "hypr")
link = join(DOTCONFIG, "hypr")

make_symlink(target, link)

# link specific device config
base_path = join(target_dir(), "hypr")

# monitors
link_config_subfolder(base_path, "monitors", "Found monitor configurations:", "monitors.conf")

# keybinds
link_config_subfolder(base_path, "keybinds", "Found keybind configurations:", "keybinds.conf")

# hyprpaper
link_config_subfolder(base_path, "wallpapers", "Found wallpaper configurations:", "hyprpaper.conf")

# hyprlock
link_config_subfolder(base_path, "lockscreens", "Found lockscreen configurations:", "hyprlock.conf")

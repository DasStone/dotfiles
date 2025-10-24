#!/usr/bin/env python3

from sys import path
from os.path import realpath, dirname
path.append(dirname(dirname(realpath(__file__))))
from utils import *

check_os(OS.LINUX)

target_base = join(target_dir(), "hypr")
link_base = join(DOTCONFIG, "hypr")

make_symlink(target_base, link_base)

# link specific device config
base_path = join(target_dir(), "hypr")

# device
link_config_subfolder(base_path, "devices", "Found device configurations:", "device.conf")

# hyprlock
link_config_subfolder(base_path, "lockscreens", "Found lockscreen configurations:", "hyprlock.conf")

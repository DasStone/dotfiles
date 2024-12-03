#!/usr/bin/env python3

from sys import path
from os.path import realpath, dirname
path.append(dirname(dirname(realpath(__file__))))
from utils import *

check_os(OS.LINUX)

target = join(target_dir(), "waybar")
link = join(DOTCONFIG, "waybar")

make_symlink(target, link)

base_path = join(target_dir(), "waybar")

# styles
link_config_subfolder(base_path, "styles", "Found style configurations:", "style.css")


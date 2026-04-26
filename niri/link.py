#!/usr/bin/env python3

from sys import path
from os.path import realpath, dirname
path.append(dirname(dirname(realpath(__file__))))
from utils import *

check_os(OS.LINUX)

target_base = join(target_dir(), "niri")
link_base = join(DOTCONFIG, "niri")

make_symlink(target_base, link_base)

# link specific device config
base_path = join(target_dir(), "niri")

# dedicated monitor configurations for my different setups
link_config_subfolder(base_path, "monitors", "Found monitor configurations:", "monitor.kdl")


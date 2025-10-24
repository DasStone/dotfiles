#!/usr/bin/env python3

from sys import path
from os.path import realpath, dirname
path.append(dirname(dirname(realpath(__file__))))
from utils import *

from os import makedirs

check_os(OS.LINUX)

selection_dir = join(target_dir(), "devices")

CONFIG_BASEDIR = join(DOTCONFIG, "cava")
makedirs(CONFIG_BASEDIR, exist_ok=True)

link = join(CONFIG_BASEDIR, "config")

make_symlink_selection(selection_dir, link)

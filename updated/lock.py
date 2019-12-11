#!/usr/bin/env python

import os
from os.path import expanduser as eu

os.system('rm ' + eu('~/.config/i3/blur.png'))
pic = eu('~/.config/i3/toBlur.png')
os.system('scrot {0}'.format(pic))

os.system('convert {0} -filter Gaussian -blur -2x10 '.format(pic) + eu('~/.config/i3/blur.png'))
os.system('rm -f {0}'.format(pic))
os.system('i3lock  -e -f -i ' + eu('~/.config/i3/blur.png'))

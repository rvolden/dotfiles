#!/usr/bin/env python

import os

os.system('rm ~/.config/i3/blur.png')
pic = '~/.config/i3/toBlur.png'
os.system('scrot {0}'.format(pic))

os.system('convert {0} -filter Gaussian -blur -2x10 ~/.config/i3/blur.png'.format(pic))
os.system('rm -f {0}'.format(pic))
os.system('i3lock  -e -f -i ~/.config/i3/blur.png')

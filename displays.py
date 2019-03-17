#!/usr/bin/env python

import os

display_list = '/home/rvolden/.config/i3/displays'
os.system('xrandr >{0}'.format(display_list))
for line in open(display_list):
    line = line.rstrip()
    if ' connected ' in line:
        id = line.split()[0]
        if id == 'eDP1':
            continue
        os.system('xrandr --output eDP1 --auto --pos 0x1080 --output {0} --auto --pos 1920x0'.format(id))
        print('xrandr --output eDP1 --auto --pos 0x1080 --output {0} --auto --pos 1920x0'.format(id))

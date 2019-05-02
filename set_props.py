#!/usr/bin/env python

import os

xinput_list = '~/.config/i3/inputs'
os.system('xinput list >{0}'.format(xinput_list))
for line in open(xinput_list):
    line = line.rstrip()
    if 'Logitech' in line and 'pointer' in line:
        id = line.split('\t')[1][3:]
        os.system('xinput set-prop {0} "libinput Natural Scrolling Enabled" 0'.format(id))

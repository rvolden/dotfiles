#!/usr/bin/env python

import os

display_list = '~/.config/i3/displays'
last_external = '~/.config/i3/last_ext'
lid = '~/.config/i3/lid'

os.system('xrandr >{0}'.format(display_list))
os.system('cat /proc/acpi/button/lid/LID0/state >{0}'.format(lid))

displays = 0
for line in open(lid):
    line = line.rstrip().split()
    if line[1] == 'closed':
        lid_open = False
    else:
        lid_open = True

for line in open(display_list):
    line = line.rstrip()
    if ' connected ' in line:
        resolution = line.split()[2].split('+')[0]
        displays += 1
        id = line.split()[0]
        if id == 'eDP1':
            continue
        if lid_open and resolution != '3440x1440':
            os.system('xrandr --output eDP1 --auto --pos 0x1080 --output {0} --auto --pos 1920x0'.format(id))
            print('xrandr --output eDP1 --auto --pos 0x1080 --output {0} --auto --pos 1920x0'.format(id))
            os.system('touch {0}'.format(last_external))
        elif lid_open and resolution == '3440x1440':
            os.system('xrandr --output eDP1 --auto --pos 0x1440 --output {0} --auto --pos 1080x0'.format(id))
            print('xrandr --output eDP1 --auto --pos 0x1440 --output {0} --auto --pos 1080x0'.format(id))
            os.system('touch {0}'.format(last_external))
        else:
            os.system('xrandr --output eDP1 --off --output {0} --auto --pos 0x1080'.format(id))
            os.system('touch {0}'.format(last_external))
        le = open(last_external, 'w')
        le.write(id)
        le.close()

if displays == 1:
    for line in open(last_external):
        le = line.rstrip()
    os.system('xrandr --output eDP1 --auto --pos 0x1080 --output {0} --off'.format(le))
    print('xrandr --output eDP1 --auto --pos 0x1080 --output {0} --off'.format(le))

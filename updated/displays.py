#!/usr/bin/env python

import os
from os.path import expanduser as eu

display_list = eu('~/.config/i3/displays')
last_external = eu('~/.config/i3/last_ext')
lid = eu('~/.config/i3/lid')

os.system('xrandr >{0}'.format(display_list))
os.system('cat /proc/acpi/button/lid/LID0/state >{0}'.format(lid))

displays = 0
for line in open(lid):
    line = line.rstrip().split()
    if line[1] == 'closed':
        lid_open = False
    else:
        lid_open = True

print(lid_open)
resolutions = []
IDs = []

conn = False
for line in open(display_list):
    line = line.rstrip()
    if ' connected ' in line:
        id = line.split()[0]
        if id == 'eDP1':
            continue
        IDs.append(id)
        conn = True
        continue
    if conn:
        resolutions.append(line.split()[0])
        conn = False
        displays += 1
        # resolutions.append(line.split()[2].split('+')[0])
        # displays += 1
        # IDs.append(id)
print(resolutions)
if lid_open and len(resolutions) == 1 and resolutions[0] != '3440x1440' and resolutions[0] != '2560x1440':
    os.system('xrandr --output eDP1 --auto --pos 0x1080 --output {0} --auto --pos 1920x0'.format(id))
    print('xrandr --output eDP1 --auto --pos 0x1080 --output {0} --auto --pos 1920x0'.format(id))
    os.system('touch {0}'.format(last_external))
elif lid_open and len(resolutions) == 1 and resolutions[0] == '3440x1440':
    #os.system('xrandr --output eDP1 --auto --pos 0x1440 --output {0} --auto --pos 1080x0'.format(id))
    #print('xrandr --output eDP1 --auto --pos 0x1440 --output {0} --auto --pos 1080x0'.format(id))
    os.system('xrandr --output eDP1 --auto --pos 960x1440 --output {0} --auto --pos 0x0'.format(id))
    print('xrandr --output eDP1 --auto --pos 960x1440 --output {0} --auto --pos 0x0'.format(id))
    os.system('touch {0}'.format(last_external))
elif lid_open and len(resolutions) > 1 and '2560x1440' in resolutions:
    # os.system('xrandr --output eDP1 --auto --pos 0x1440 --output {0} --auto --pos 1920x0'.format(id))
    # print('xrandr --output eDP1 --auto --pos 0x1440 --output {0} --auto --pos 1920x0'.format(id))
    # os.system('xrandr --output eDP1 --auto --pos 320x1440 --output {0} --auto --pos 0x0'.format(id))
    # print('xrandr --output eDP1 --auto --pos 320x1440 --output {0} --auto --pos 0x0'.format(id))
    # os.system('xrandr --output eDP1 --auto --pos 640x1740 --output {0} --auto --pos 0x300 --output {1} --auto --rotate left --pos 2560x0'.format(id))
    base = 'xrandr --output eDP1 --auto --pos 640x1740 '
    for i in range(len(resolutions)):
        if '1080' in resolutions[i]:
            base += ' --output {0} --auto --rotate right --pos 2560x0 '.format(IDs[i]) # vertical
        else:
            base += ' --output {0} --auto --pos 0x300 '.format(IDs[i]) # 2k monitor
    os.system(base)
    print(base)
    # print('xrandr --output eDP1 --auto --pos 640x1740 --output {0} --auto --pos 0x300 --output {1} --auto --rotate left --pos 2560x0'.format(id))
    os.system('touch {0}'.format(last_external))
elif lid_open:
    os.system('xrandr --output eDP1 --auto')
    print('xrandr --output eDP1 --auto')
else:
    os.system('xrandr --output eDP1 --off --output {0} --auto --pos 0x1080'.format(id))
    print('xrandr --output eDP1 --off --output {0} --auto --pos 0x1080'.format(id))
    os.system('touch {0}'.format(last_external))
le = open(last_external, 'w')
for id in IDs:
    le.write(id)
le.close()

print(displays)
if displays == 0:
    les = []
    for line in open(last_external):
        les.append(line.rstrip())
    command = 'xrandr --output eDP1 --auto --pos 0x1080 '
    for le in les:
        command += '--output {0} --off '.format(le)
    os.system(command)
    print(command)
    # os.system('xrandr --output eDP1 --auto --pos 0x1080 --output {0} --off'.format(le))
    # print('xrandr --output eDP1 --auto --pos 0x1080 --output {0} --off'.format(le))

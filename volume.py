#!/usr/bin/env python

import os, sys
from os.path import expanduser as eu

sinks = eu('~/.config/i3/sinks')
os.system('pactl list sinks >{0}'.format(sinks))
action = sys.argv[1]

last_sink = '0'
for line in open(sinks):
    line = line.rstrip()
    if 'Sink ' in line:
        last_sink = line.split('Sink #')[1]
    if 'alsa_output.pci-0000_00_1f.3.analog-stereo' in line:
        if action == 'inc':
            os.system('pactl set-sink-volume {0} +5%'.format(last_sink))
        if action == 'dec':
            os.system('pactl set-sink-volume {0} -5%'.format(last_sink))
        if action == 'mute':
            os.system('pactl set-sink-mute {0} toggle'.format(last_sink))
        sys.exit()

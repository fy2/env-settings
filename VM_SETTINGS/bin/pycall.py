#!/usr/bin/env python
import subprocess
from time import localtime, strftime

time = strftime("%H:%M", localtime())
lines = ['|| msg! ||',
         '// msg! //',
         '-- msg! --',
         '// msg! //',
         '-- msg! --',
         '\\\\ msg! \\\\',
         '|| msg! ||',
        ]

for i in range(3):
  for x in lines:
    subprocess.call(" printf '\033k%s\033\\' '" + x + "'; sleep 0.01", shell=True)


end_msg = '#vx msg at ' + time
subprocess.call(" printf '\033k%s\033\\' '" + end_msg + "'", shell=True)

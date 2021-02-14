import math
from machine import Pin
from machine import DAC

p25 = Pin(25, Pin.OUT)

# create a buffer containing a sine-wave
buf = bytearray(100)
for i in range(len(buf)):
    buf[i] = 128 + int(127 * math.sin(2 * math.pi * i / len(buf)))

# output the sine-wave at 400Hz
dac = DAC(p25)
dac.write_timed(buf, 400 * len(buf), mode=DAC.CIRCULAR)

# laserharp

## Theory of operation

8 laser beams (notes c to C) are aimed at 8 photoresisors connected on an ESP32.  The ESP32 scans the photoresistors and plays a note if the beam is interrupted.


## Hardware

* 1x [Heltec WiFi Kit 32](https://heltec.org/project/wifi-kit-32/)
* 1x 1000 mAh lithium battery
* 8x photoresistors
* 8x 10k resistors
* 1x 8ohm mini speaker
* 8x 5v ???mw red laser diodes

The ESP32 provides all the required functionality and the possibility for a wireless instrument interface in the future.  The Heltec board was selected because of its low-cost, compact construction and inclusion of a robust power supply (typically a weak point of most ESP32 designs).

TODO: add schematic

The photoresistors are connected to GPIO 32 through 39 using a voltage divider.  The speaker is simply connected between GPIO 14 and ground.


## Software

The current version of the [firmware](./firmware.py) scans each photoresistor once per second and when dark, plays the according note via PWM to a small speaker attached to pin 14.


## What's Next?

This completes the proof-of-concept stage so construction of the chassis using the selected components can begin.  The basic PWM "beeper" may be replaced with an amplified speaker or possibly an external WiFi/Bluetooth instrument connection.


## References

* https://www.instructables.com/Interfacing-Photoresistor-With-ESP32/
* https://docs.micropython.org/en/latest/library/pyb.DAC.html
* https://resource.heltec.cn/download/WiFi_Kit_32/WIFI_Kit_32_pinoutDiagram_V2.pdf
* https://micropython-on-wemos-d1-mini.readthedocs.io/en/latest/basics.html#beepers

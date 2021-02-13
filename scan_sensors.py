import time
import ssd1306

from machine import Pin, I2C, Timer

# Init display
oled_width = 128
oled_height = 64

i2c = I2C(scl=Pin(15), sda=Pin(4), freq=400000)
oled = ssd1306.SSD1306_I2C(oled_width, oled_height, i2c)

sensors = [
    {
        "note": "c",
        "GPIO": 36,
    },
    {
        "note": "d",
        "GPIO": 37,
    },
    {
        "note": "e",
        "GPIO": 38,
    },
#    {
#        "note": "f",
#        "GPIO": 39,
#    },
#    {
#        "note": "g",
#        "GPIO": 34,
#    },
#    {
#        "note": "a",
#        "GPIO": 35,
#    },
#    {
#        "note": "b",
#        "GPIO": 32,
#    },
#    {
#        "note": "c2",
#        "GPIO": 33,
#    },
]


def scan(self):
    oled.fill(0)
    # Enumerate sensor pins
    for sensor in sensors:
        # Select sensor 
        print("sensor note: " + sensor['note'])
        print("sensor_pin: " + str(sensor['GPIO']))
        sensor_pin = Pin(sensor["GPIO"], Pin.IN) # Enable pull-up?  Pin.PULL_UP
        
        # Read sensor
        sensor_value = sensor_pin.value()
        print("sensor_value: " + str(sensor_value))
        
        if sensor_value:
            print("silence")
            
        else:
            # Print status on oled
            print("note " + sensor['note'] + " is high")
            oled.text("play " + sensor['note'], 0, 0)
            
            # TODO: Play the note
            
    oled.show()

tim1 = Timer(0)
tim1.init(period=100, mode=Timer.PERIODIC, callback=scan)

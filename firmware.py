import time
import ssd1306

from machine import Pin, PWM, I2C, Timer

# Init display
oled_width = 128
oled_height = 64

i2c = I2C(scl=Pin(15), sda=Pin(4), freq=400000)
oled = ssd1306.SSD1306_I2C(oled_width, oled_height, i2c)

# Init beeper
beeper = PWM(Pin(14), freq=440, duty=512)
time.sleep(0.5)

sensors = [
    {
        "note": "c",
        "GPIO": 36,
        "freq": 262
    },
    {
        "note": "d",
        "GPIO": 37,
        "freq": 294
    },
    {
        "note": "e",
        "GPIO": 38,
        "freq": 330
    },
#    {
#        "note": "f",
#        "GPIO": 39,
#        "freq": 349
#    },
#    {
#        "note": "g",
#        "GPIO": 34,
#        "freq": 392
#    },
#    {
#        "note": "a",
#        "GPIO": 35,
#        "freq": 440
#    },
#    {
#        "note": "b",
#        "GPIO": 32,
#        "freq": 494
#    },
#    {
#        "note": "C",
#        "GPIO": 33,
#        "freq": 523
#    },
]

def scan(self):
    # TODO: We can monitor battery level on pin 13, so display that
    # (try setting pin mode to "analog" (otherwise only returns 1/0))
    # TODO: Buffer display so we only update it when needed
    oled.fill(0)
    # TODO: Remember note so we only change beeper frequency (or beeper.deinit()) when needed
    beeper.freq(0)
    
    # Enumerate sensor pins
    for sensor in sensors:
        # Select sensor 
        print("sensor note: " + sensor['note'])
        print("sensor_pin: " + str(sensor['GPIO']))
        sensor_pin = Pin(sensor["GPIO"], Pin.IN)
        
        # Read sensor
        sensor_value = sensor_pin.value()
        print("sensor_value: " + str(sensor_value))
        
        if sensor_value:
            print("silence")
            
        else:
            # Print status on oled
            print("note " + sensor['note'] + " is high")
            oled.text("play " + sensor['note'], 0, 0)
            
            # Play the note
            beeper.freq(sensor['freq'])
            
    oled.show()

# TODO: Find a way to cancel the timer when the script receives a "break",
# and consider providing a hardware interface to disable it
tim1 = Timer(0)
tim1.init(period=1000, mode=Timer.PERIODIC, callback=scan)

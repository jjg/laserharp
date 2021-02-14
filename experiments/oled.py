import ssd1306

from machine import Pin, I2C

oled_width = 128
oled_height = 64

i2c = I2C(scl=Pin(15), sda=Pin(4), freq=400000)
oled = ssd1306.SSD1306_I2C(oled_width, oled_height, i2c)
oled.text("Hello, World!", 0, 0)
oled.show()

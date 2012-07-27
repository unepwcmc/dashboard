require 'RMagick'

canvas = Magick::Image.new(240, 300,
              Magick::HatchFill.new('white','lightcyan2'))
gc = Magick::Draw.new

gc.stroke('#001aff')
gc.stroke_width(3)
gc.fill('#00ff00')

x = 120
y = 32.5
gc.polygon(x,    y,     x+10, y,  x+10, y+10,
           x, y+10, x, y)

gc.draw(canvas)
canvas.write('polygon.gif')
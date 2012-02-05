
# Class defining single Player
class Player
  
  attr_accessor :id, :x, :y, :color, :out
  
  def initialize(window, id, color, x, y)
    @image = Gosu::Image.new(window, "media/grid/hrac."+color+".png", false) if color
    @color = color
    @id = id
    @x, @y = x,y
    @xmax = 16
    @ymax = 16
    @out = false
  end
  
  
  # Movement methods
  def left
    @x-=1 if @x > 0
  end
  
  def right
    @x+=1 if @x < @xmax-1
  end
  
  def up
    @y-=1 if @y > 0
  end
  
  def down
    @y+=1 if @y < @ymax-1
  end  
  
  def draw
    @image.draw(@x * size + 50, @y * size + 50, 1, 1, 1)
  end
  
  def size
    24
  end
  
end
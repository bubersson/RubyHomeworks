#= Class Block
# single block with one image
class Block
  
  # statically initialize images
  def self.bootstrap(gosu_window)
    @@gosu_window = gosu_window
    return if not gosu_window
    colors = %w{red blue green yellow}
    @@images = Hash.new
    colors.each { |clr|      
      5.times { |i|        
        @@images[clr+i.to_s] = Gosu::Image.new(@@gosu_window, 'media/grid/'+i.to_s+'.'+clr+'.png', true) 
      }      
    }
  end
  
  
  attr_reader :points, :owner, :x, :y
  
  def initialize(x,y, array)
    @image = Gosu::Image.new(@@gosu_window, 'media/grid/pole.png', true) if @@gosu_window
    @x, @y = x, y    
    @points = 0
    @owner = nil
    @array = array
    @width = 16
    @height = 16
  end
  
  def initialize_copy(old)
    @image = old.image
    @color = old.color
  end
  
  def draw
    @image.draw(@x * size + 50, @y * size + 50, 1, 1, 1)
  end
  
  # Add point to current position
  def add_point(color) 
    @owner = color
    @points += 1        
    @image = @@images[@owner+@points.to_s]#Gosu::Image.new(@@gosu_window, 'media/grid/'+@points.to_s+'.'+@owner+'.png', true) if @points < 4
    if over_max?(@points, @x,@y, @width-1,@height-1)
      @points = 0      
      @array[@x-1][@y].add_point(color) if @x > 0
      @array[@x+1][@y].add_point(color) if @x < @width -1
      @array[@x][@y-1].add_point(color) if @y > 0
      @array[@x][@y+1].add_point(color) if @y < @height-1
      @image =  @@images[@owner+@points.to_s]#Gosu::Image.new(@@gosu_window, 'media/grid/'+@points.to_s+'.'+@owner+'.png', true)    
    end
  end
  
  # Does block need to be expanded?
  def over_max?(points, x,y, max_x,max_y)
    max = 3
    max -= 1 if x==0 || x==max_x
    max -= 1 if y==0 || y==max_x
    return points > max
  end
  
  def size
    24
  end
  
end
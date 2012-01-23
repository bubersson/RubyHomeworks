class Grid
  
  def initialize(options)
    @width, @height = options[:rows], options[:columns]
    @array = Array.new(@width) { Array.new(@height, 0)}    
      
    0.upto(@width-1) do |i|
      0.upto(@height-1) do |j|
        @array[i][j] = Block.new(i,j, @array);          
      end      
    end    
  end
  
  
  
  def draw    
    0.upto(@width-1) do |i|
      0.upto(@height-1) do |j|
        @array[i][j].draw()
      end   
    
    end
  end
  
  
  
  def add_point(player)    
    x,y=player.x, player.y    
    if @array[x][y].owner == player.color or @array[x][y].owner == nil
      @array[x][y].add_point(player.color)      
      count_points
      return true
    end
    false
  end

  def count_points
    red = blue = yellow = green =  0    
    0.upto(@width-1) do |i|
      0.upto(@height-1) do |j|
        red+=1 if @array[i][j].owner == "red"
        blue+=1 if @array[i][j].owner == "blue"
        yellow+=1 if @array[i][j].owner == "yellow"
        green+=1 if @array[i][j].owner == "green"
      end       
    end
    puts "#{red} #{blue} #{yellow} #{green} "
  end
  
  
  # We do this for speed reasons. The rows method is called several times in a
  # single Gosu update operation. This allows us build those objects once per
  # update.
  #
  def reset_row_objects
    @row_objects = nil
  end
  
end
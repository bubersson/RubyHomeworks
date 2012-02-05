class Grid
  
  
  # Initialize Grid and initialize all blocks
  def initialize(options)
    @width, @height = options[:rows], options[:columns]
    @array = Array.new(@width) { Array.new(@height, 0)}          
    0.upto(@width-1) do |i|
      0.upto(@height-1) do |j|
        @array[i][j] = Block.new(i,j, @array);          
      end      
    end    
  end
  
  
  # Standard Gosu method for drawing all blocks
  def draw    
    0.upto(@width-1) do |i|
      0.upto(@height-1) do |j|
        @array[i][j].draw()
      end   
    
    end
  end
  
  
  # Add one point to current block
  # - only if player is an owner
  # - run recursive point adding on each block
  def add_point(player)    
    x,y=player.x, player.y    
    if @array[x][y].owner == player.color or @array[x][y].owner == nil
      @array[x][y].add_point(player.color)            
      return true  #count_points #true
    end
    false
  end

  
  # Count number of each player points
  # - mainly for score displaying
  def count_points
    red = blue = yellow = green =  0    
    0.upto(@width-1) do |i|
      0.upto(@height-1) do |j|
        red+=@array[i][j].points if @array[i][j].owner == "red"
        blue+=@array[i][j].points if @array[i][j].owner == "blue"
        green+=@array[i][j].points if @array[i][j].owner == "green"
        yellow+=@array[i][j].points if @array[i][j].owner == "yellow"
      end       
    end
    # puts "#{red} #{blue} #{green} #{yellow} "
    [red,blue,green,yellow]
  end
  
  
  # We do this for speed reasons. The rows method is called several times in a
  # single Gosu update operation. This allows us build those objects once per
  # update.
  #
  def reset_row_objects
    @row_objects = nil
  end
  
end
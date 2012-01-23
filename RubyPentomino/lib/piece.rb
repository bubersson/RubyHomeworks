
module Pentomino
  class Piece
    @@counter = 0
    attr_accessor :points, :name, :x_max,:y_max,:x_min,:y_min, :index
    
    def initialize(name,points) 
      @name = name 
      @index = @@counter += 1
      @points = points
      @points << [0,0]         
      normalize_points
      set_bounds
    end  
    
    # Normalize points so the X coord is always above 0
    def normalize_points()
      @x_min = @points.min {|a,b| a[0] <=> b[0] } [0]      
      @y_min = @points.min {|a,b| a[1] <=> b[1] } [1]     
      if @x_min < 0
        @points.each {|p|
          p[0] = p[0]-@x_min
        }
      end
      if @y_min < 0
        @points.each {|p|
          p[1] = p[1]-@y_min
        }
      end
    end
    
    # Compute bounds of this current pentomino according to [0,0]
    def set_bounds()
      @x_max = @points.max {|a,b| a[0] <=> b[0] } [0]
      @y_max = @points.max {|a,b| a[1] <=> b[1] } [1]
      @x_min = @points.min {|a,b| a[0] <=> b[0] } [0]
      @y_min = @points.min {|a,b| a[1] <=> b[1] } [1]
    end 
  
  
    def to_s      
      out = ""        
      arr = Array.new(7) { Array.new(5, " ")}
      @points.each { |s|          
        arr[s[0]+@x_min][-s[1]+@y_max] = @name
      }        
      0.upto(4) do |i|
        0.upto(6) do |j|
          out+= "#{arr[j][i]} "
        end
        out+="\n"
      end        
      out
    end
    
    
    def same_as?(piece)
      return false if piece.name != @name      
      piece.points.sort!
      @points.sort!
      for i in 0...piece.points.size
        #print "comparing #{piece.points[i]} : #{ @points[i]}\n"
        if piece.points[i] != @points[i]
          #puts "differ"
          return false
        end
      end      
      return true
    end
  
  end
end
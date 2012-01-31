

module Pentomino
  
  class Desk
    
    attr_accessor :pieces, :used
    @@counter = 0
    
    def initialize(x,y)       
      @@counter += 1
      @width = x
      @height = y            
      @pole = Array.new(x) { Array.new(y, 0)}    
      @checkPole = Array.new(x) { Array.new(y, 0)}    
      0.upto(@width-1) do |i|
        0.upto(@height-1) do |j|
          @pole[i][j] = 0
          @checkPole[i][j] = 0;
        end      
      end
      @pieces = [] #get_rotations(pieces) # current piecs / když removnu, tak doplní nuly?
      @used = [] # array of used names eg. ["N","Z"]
    end
    
    
    # Provides access to Pentomino as it was an 2D array
    def [](x, y)
      @pole[x][y]
    end
 
    # Provides write acces to Pentomino as it was an 2D array
    def []=(x, y, value)
      @pole[x][y] = value
    end
    
    def clone()
      desk = Desk.new(@width,@height)
      0.upto(@height-1) do |y|
        0.upto(@width-1) do |x|
          desk[x,y] = @pole[x][y]
        end
      end      
      desk.pieces = @pieces.clone
      desk.used = @used.clone      
      return desk
    end
    
    def to_s
      out = "<Pentomino: #{@width}x#{@height}> +#{@@counter}\n"
      0.upto(@height-1) do |y|
        out+="|"
        0.upto(@width-1) do |x|
          if @pole[x][y]==0 
            out+= "  " 
          else 
            out+= "#{@pole[x][y]} " 
          end
        end
        out+="|\n"
      end
      (@width+1).times { out+= "--" }
      out += "\n"      
      
    end
    
    def counter
      @@counter
    end
    
    
    
    def count_free(x,y)
      return 0 if @checkPole[x][y] == 1
      @checkPole[x][y] = 1
      sum = 1
      if x+1 < @width && @pole[x+1][y]==0 && @checkPole[x+1][y]!=1
        sum += count_free(x+1,y)
      end
      if y+1 < @height && @pole[x][y+1]==0  && @checkPole[x][y+1]!=1
        sum += count_free(x,y+1)        
      end
      if x-1 >= 0 && @pole[x-1][y]==0  && @checkPole[x-1][y]!=1
        sum += count_free(x-1,y)
      end
      if y-1 >= 0 && @pole[x][y-1]==0  && @checkPole[x][y-1]!=1
        sum += count_free(x,y-1)        
      end
      #puts "SUM #{sum}"
      return sum          
    end
    
    def too_free?(y)
      #return false if @@counter%2==0
      
      0.upto(@width-1) do |i|
        0.upto(@height-1) do |j|      
          @checkPole[i][j] = 0;
        end      
      end
      
      for i in 0...@height        
        for j in 0...@width          
          if @pole[j][i] == 0 
            c =count_free(j,i) 
            #puts "#{c}"
            if c % 5 != 0
              return true
            end
          end
        end        
      end
      return false
      
      count =0
      for i in 0...y-1        
        for j in 0...@width
          if @pole[j][i] == 0
            count += 1 
          end
        end        
      end      
      return count > 5
    end

    # Check if theres no empty point
    def is_solution?      
      zero= false
      0.upto(@width-1) do |x|
        0.upto(@height-1) do |y|
          if @pole[x][y]==0
            zero = true
            break
          end
        end
      end
      print "Je to reseni, pyco!\n" if !zero
      return !zero      
    end
    
      
        
    #Check if selected piece fits at coords
    def fits?(piece, x, y)
      piece.points.each { |point|        
        if @pole[x+point[0]][y-point[1]] != 0                    
          return false
        end
      }      
      true
    end
    
            
    # Insert all points from Piece to Desk
    def insert_piece(piece,x,y)      
      piece.points.each { |point|        
        #puts "Inserting #{point[0]},#{point[1]} to #{x},#{y}"        
        @pole[x+point[0]][y-point[1]] = piece.name
      }
    end
    
  end  
end


# Class Pentomino represents single instance of one Pentomino problem
module Pentomino
  class Pentomino
    attr_accessor :pole, :width, :height, :used
  
    # Constructor - create new Desk and save it as @act_desk
    def initialize(x,y) 
      @width = x
      @height = y            
      @act_desk = Desk.new(x,y)      
    end
    
    # Create all rotations of pieces
    def create_piece(data)
      name = data[0].to_s      
      data.delete_at(0)      
      pointsn=[]
      pointss=[]
      pointsw=[]
      pointse=[]
      pointmn=[]
      pointms=[]
      pointmw=[]
      pointme = []
      
      pieces = []
      
      data.each do |x|
        coord = x.split(":")
        pointsn << [coord[0].to_i, coord[1].to_i]        
        pointss << [-coord[0].to_i, -coord[1].to_i]        
        pointsw << [coord[1].to_i, -coord[0].to_i]        
        pointse << [-coord[1].to_i, coord[0].to_i]                        
        pointmn << [-coord[0].to_i, coord[1].to_i]        
        pointms << [coord[0].to_i, -coord[1].to_i]        
        pointmw << [-coord[1].to_i, -coord[0].to_i]        
        pointme << [coord[1].to_i, coord[0].to_i]                        
      end
      
      pieces << Piece.new(name,pointss)
      pieces << Piece.new(name,pointsw)
      pieces << Piece.new(name,pointse)
      pieces << Piece.new(name,pointmn)
      pieces << Piece.new(name,pointms)
      pieces << Piece.new(name,pointmw)
      pieces << Piece.new(name,pointme)      
      pieces << Piece.new(name,pointsn)
      
                  
      i=0
      while(i<pieces.size) do
        j = i+1
        while (j < pieces.size) do
      
          if pieces[i].same_as?(pieces[j])
      
            pieces.delete_at(j)              
          else
            j+=1
          end
        end
        i+=1
                     
      end      
      
      puts "#{pieces.count} #{name}"
      @act_desk.pieces.concat(pieces)
      pieces
    end
  
    
    
    #= Adding next piece
    # Try to add piece to desk
    # and check whether it will work later
    def add_next_piece(desk, piece)                        
      piece.y_max.upto(@height-piece.y_min) do |y| # bacha na to, že je zkurveně obráceně
        piece.x_min.upto(@width-1-piece.x_max) do |x|
          if desk.fits?(piece,x,y)
            desk.insert_piece(piece,x,y)      
            desk.used << piece.name            
            return !desk.too_free?(y)           
          end        
        end
      end
      return false      
    end
    
    
    # DFS traverse
    def find_solution 
      puts "Finding solution ..."                  
      
      #print_pieces      
      open = []
      closed = []
      
      open.push @act_desk
      while !open.empty?         
        
        #@act_desk = get_best(open) 
        @act_desk = open.pop
        if closed.include?(@act_desk)
          next
        end
        
        if @act_desk.is_solution?
          puts "found solution"
          p @act_desk
          return true
        else                
          while @act_desk.pieces.size > 0             
            piece = @act_desk.pieces.pop            
            if !@act_desk.used.include?(piece.name) #&& !@act_desk.used!piece.index.include?(piece)              
              desk_clone = @act_desk.clone                             
              if (add_next_piece(@act_desk,piece))                                
                open.push(desk_clone)                
                if @act_desk.is_solution?
                  puts "found solution"
                  p @act_desk
                  return true
                end
              else                 
                @act_desk = desk_clone
              end
              p @act_desk if @act_desk.counter % 10000 == 0
            end            
          end      
        end      
      end
      @act_desk.to_s
      false
    end
  
    def to_s
      @act_desk.to_s     
    end
  
  
    def print_pieces
      @pieces.each { |p|              
        print "--- #{[p.x_max,p.x_min,p.y_max,p.y_min]}\n"      
        print p        
      }
    end  
  end

 
end
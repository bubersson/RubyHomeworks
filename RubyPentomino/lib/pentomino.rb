

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
      
    end
  
    
    
    
    def add_next_piece(desk, piece)                  
      #puts "x_min #{piece.x_min}, y_min #{piece.y_min}, x_max #{piece.x_max}, y_max #{piece.y_max}"
      toreturn = nil
      tc = [0,0]
      max_f= 0      
      
      piece.y_max.upto(@height-piece.y_min) do |y| # bacha na to, že je zkurveně obráceně
        #return false if desk.too_free?(y)
        
        piece.x_min.upto(@width-1-piece.x_max) do |x|
          
          if piece.name == "A"  
            #puts "X:#{x},Y:#{y}"
          end
          
          if desk.fits?(piece,x,y)
            
            #puts "x_min #{piece.x_min}, y_min #{piece.y_min}, x_max #{piece.x_max}, y_max #{piece.y_max}" if piece.name=="X"
            
            
            desk.insert_piece(piece,x,y)      
            desk.used << piece.name
            return false if desk.too_free?(y)
            return true
            #
#            test = desk.clone
#            test.insert_piece(piece,x,y)
#            if !test.too_free?(y)              
#              toreturn = piece
#              tc = [x,y]              
#            end
#            
            
            
            # return true
            #print("Inserted fit: #{piece.name}\n")
          end        
        end
      end
      if toreturn
        desk.insert_piece(toreturn,tc[0],tc[1])
        desk.used << toreturn.name
        return true          
      else return false
      end
      
      #return false if desk.too_free?(y)

      
      #print("Not fit: #{piece.name}\n")
      #puts "x_min #{piece.x_min}, y_min #{piece.y_min}, x_max #{piece.x_max}, y_max #{piece.y_max}"
      
      return false
    end
    
    
        
    def get_best(open)
      best_index = 0# open.count-1
      best_fitness = 0
      for i in 0...open.count
        new_fitness =open[i].get_fitness
        if  new_fitness > best_fitness
          best_fitness = new_fitness
          best_index = i
        end
      end            
      return open.delete_at(best_index)
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
          return
        else                
          while @act_desk.pieces.size > 0 
            #puts @act_desk.pieces.size
            
            
            piece = @act_desk.pieces.pop            
            
            
            if !@act_desk.used.include?(piece.name) #&& !@act_desk.used!piece.index.include?(piece)
              
              desk_clone = @act_desk.clone               
              
              if (add_next_piece(@act_desk,piece))                
                #if (add_next_piece(desk_clone,piece))
                open.push(desk_clone)                
              else                 
                @act_desk = desk_clone
              end
              p @act_desk  if @act_desk.counter % 10000 == 0
                
              if @act_desk.is_solution?
                puts "found solution"
                p @act_desk
                return
              end
            
            end
            
            
            
          end
          #p @act_desk
          # while to jde, pridavej dalsi prvek
                    
          
        end        
        #@act_desk.get_fitness
      end
      @act_desk.to_s
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
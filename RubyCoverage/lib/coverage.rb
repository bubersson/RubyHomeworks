# One segment (line) object
class Line
  attr_accessor :l, :r
  
  def initialize(l,r)
    @l=Integer(l)
    @r=Integer(r)    
  end 
  
  def is_in?(v)
    v >= @l and v <=@r
  end
  
end


# Cover segment [0,M]
class Coverage
  attr_accessor :m, :lines
  
  def initialize(m, lines)
    @m = m
    @lines = lines
  end
  
  
  # Find solution
  def solve    
    puts ""
    #puts "Started solving - M: " + m.to_s    
    position = 0 # starting position in [0,M]
    result = []
    count = 0
    max_r = -1 # stačí libovolné záporné
    max_index = -1
    i_am_in = false
    
    # sort lines by left element --- O(nlogn)
    @lines.sort { |a,b| a.l <=> b.l } 
    
    for i in 0...@lines.count   # ---- O(n)
      line = @lines[i]
      #p line
      if line.is_in?(position)        
        i_am_in = true
        if line.r > max_r
          max_r = line.r
          max_index = i
        end
      else
        if i_am_in # dokončil jsem celou sérii, který tam patřili - vypsat tu nejdelší
          position = max_r
          #puts "Position: "+max_r.to_s
          #puts "Nejvetsi: ["+@lines[max_index].l.to_s()+","+@lines[max_index].r.to_s()+"]"          
          break if max_r > @m
          result << @lines[max_index].l.to_s()+" "+@lines[max_index].r.to_s()
          count+=1
          if line.is_in?(position)        
            i_am_in = true
            if line.r > max_r
              max_r = line.r
              max_index = i
            end  
          else 
            i_am_in = false
          end
        else
          i_am_in = false      
        end      
      end    
    end
    
    if i_am_in and max_r <= @m # dokončil jsem celou sérii, který tam patřili - vypsat tu nejdelší
      position = max_r      
      result << @lines[max_index].l.to_s()+" "+@lines[max_index].r.to_s()
      count+=1
    end
    
    # Is there solution?
    if max_r < @m
      puts "0"
      return "0"
    else       
      puts count.to_s
      result.each { |i| puts i  }      
    end           
    result.insert(0, count.to_s)
  end  
end
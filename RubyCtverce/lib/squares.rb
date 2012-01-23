
#= Main square class
class Square 
  attr_accessor :s, :x, :y 
  
  # Constructor
  def initialize(s,x,y)    
    @s=s
    @x=x
    @y=y
  end
  
  
  # Return sum of self square overlapped with sq
  def sum_area(sq)    # a = lokal, b = sq
    x_d=(sq.x - @x).abs  
    y_d=(sq.y - @y).abs    
    if ((sq.s+@s)/2.0 - x_d) < 0 or ((sq.s+@s)/2.0 - y_d) < 0
      return -1;
    end    
    x_side = [(sq.s+@s)/2.0 - x_d,@s,sq.s].min    
    y_side = [(sq.s+@s)/2.0 - y_d,@s,sq.s].min        
    return (sq.s**2+@s**2) - (x_side * y_side)
  end
end


def parse_input  
  begin
    print "Zadejte delku hrany prvniho ctverce: "
    sa = Float(gets)
    print "Zadejte x-ovou souradnici stredu prvniho ctverce: "
    xa = Float(gets)
    print "Zadejte y-ovou souradnici stredu prvniho ctverce: "
    ya = Float(gets) 
  
    print "Zadejte delku hrany druheho ctverce: "
    sb = Float(gets)
    print "Zadejte x-ovou souradnici stredu druheho ctverce: "
    xb = Float(gets)
    print "Zadejte y-ovou souradnici stredu druheho ctverce: "
    yb = Float(gets)
    
    a = Square.new(sa,xa,ya)  
  
    b= Square.new(sb,xb,yb)
  
    o = a.sum_area(b)
    if o < 0 
      puts "Ctverce se ani nedotykaji."  
    else
      puts "Obsah sjednoceni dvou ctvercu je "+ o.to_s() + "."
    end
  rescue StandardError
    print "Spatny vstup."    
  end
  
 
end




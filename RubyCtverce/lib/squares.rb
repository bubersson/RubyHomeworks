

# obsah ctvercu
#Zadejte x-ovou souradnici stredu prvniho ctverce: 0
#Zadejte y-ovou souradnici stredu prvniho ctverce: 0
#Zadejte delku hrany druheho ctverce: 2
#Zadejte x-ovou souradnici stredu druheho ctverce: 2
#Zadejte y-ovou souradnici stredu druheho ctverce: 2
#Obsah sjednoceni dvou ctvercu je 19.


class Square 
  attr_accessor :s, :x, :y 
  def initialize(s,x,y)    
    @s=s
    @x=x
    @y=y
  end
  
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


def parseInput
  print "Zadejte delku hrany prvniho ctverce: "
  sa = gets.chomp.to_f
  print "Zadejte x-ovou souradnici stredu prvniho ctverce: "
  xa = gets.chomp.to_f
  print "Zadejte y-ovou souradnici stredu prvniho ctverce: "
  ya = gets.chomp.to_f  
  
  a = Square.new(sa,xa,ya)  
  
  print "Zadejte delku hrany druheho ctverce: "
  sb = gets.chomp.to_f
  print "Zadejte x-ovou souradnici stredu druheho ctverce: "
  xb = gets.chomp.to_f
  print "Zadejte y-ovou souradnici stredu druheho ctverce: "
  yb = gets.chomp.to_f
  
  b= Square.new(sb,xb,yb)
  
  o = a.sum_area(b)
  if o < 0 
    puts "Ctverce se ani nedotykaji."  
  else
    puts "Obsah sjednoceni dvou ctvercu je "+ o.to_s() + "."
  end
end




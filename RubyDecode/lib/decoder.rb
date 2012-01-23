

# Main Decoder class initialised with 
# use as <tt>d = Decoder.new(text)</tt>
class Decoder
   
  # Class decoder constructor
  def initialize(text) 
    @text = text
  end
  
  # In decode first do frequency analysis ant then decode input text
  def decode()
    shift = frequency(@text)
    @text.each_char { |c| print( (c.ord+shift).chr) }  
  end

  #= Frequency analysis 
  # is based on the fact, that most used symbol in plain text should be space  
  def frequency(t)    
    counts = Hash.new(0)
    t.each_char { |c|   counts[c] += 1   }      
    " ".ord - counts.sort{ |a,b| b[1] <=> a[1]}.first[0].ord    
  end  

end

# First Load file and then decode it
def loadfile(file)
  text = File.open(file , "r" ) { | f |
    f.read
  }
  d = Decoder.new(text)
  d.decode()
end







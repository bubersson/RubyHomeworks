
module Summable
  def sum
    return self.inject(:+)    
  end
end


class VowelFinder
  include Enumerable
  include Summable
  def initialize(text)
    @text = text
    @vowels = "aeiouy";
  end
  
  def each
    for i in 0...@text.length      
      yield @text[i] if @vowels.include?(@text[i]) 
    end
  end
end

vf = VowelFinder.new("skakal pes pres oves")
#puts vf.inject(:+)
puts vf.sum
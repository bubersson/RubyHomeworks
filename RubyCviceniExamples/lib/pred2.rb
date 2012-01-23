
# Petr Mikota - mikotpet

puts "-- ULOHA 1 -----------------"

=begin 
Exercise 1
Traversing an array
Write a method which yields the odd-indexed elements for an
array if the user supplied a block to the method, and which returns
an array of the results otherwise.
Hint: the method block_given? returns true if a method was
invoked with a block.
=end


def reseni(array)
  out=[]
  array.each_with_index do |item,index|
    if not index.even?
      if block_given? 
        yield(item) 
      end
      out << item
    end
  end
  out
end

puts reseni([1,2,3,4,5,6,7])

reseni([1,2,3,4,5,6,7]) do 
  |x| puts x  
end

puts "-- ULOHA 2 -----------------"
=begin
Searching a file
Write a method sameword(file) which searches through a file for
any potential word duplications such as "the the”.
How would you extend this to search for duplications that occured
across two lines ("...the
the...”)?
=end

#Vstup: text bebeb bella bal bal text snsns sn text snsns dva tri tri tri ctyri pet sest sedum

def sameword (file)
  out = []
  words = File.open(file , "r" ) { | f |
    f.read.split # this should work for newlines
  }
  for i in 0..words.count-1
    if words[i]==words[i+1] 
      out << "Duplicity on word "+i.to_s+" : "+words[i]
    end
  end
  out
end

puts sameword("in.txt")


puts "-- ULOHA 3 -----------------"

=begin
Counting words
Write a method count(file) which outputs a table of words and their
frequency.
=end


def count (file)
  table = Hash.new
  words = File.open(file , "r" ) { | f |
    f.read.split
  }
  words.each do |word|    
    unless table.has_key?(word)
      table[word] = 1
    else
      table[word] = table[word]+1
    end
  end
  table.each {|key, value| puts "#{key} : #{value}" }
end

count("in.txt")


#F i l e sametest :
#Cat car cat .
#Output :
#cat 2
#car 1


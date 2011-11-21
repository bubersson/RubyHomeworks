# To change this template, choose Tools | Templates
# and open the template in the editor.

# Using Fibers

words = Fiber . new do
  File.foreach ( "in.txt" ) do | line |
    line.scan ( /\w+/ ) do | word |
      Fiber.yield word.downcase
    end
  end
end
counts = Hash.new( 0 )
while word = words.resume
  counts [ word ] += 1
end
counts.keys.sort.each { | k | print " #{k}:#{counts[k]} " }

# Using threads    --- producent, konzument

puts ""
Thread.abort_on_exception=true 

require "thread"
queue = Queue.new

konec = false

threads = []

counts = Hash.new( 0 )

threads << t1 = Thread.new("a") do |i| 
  File.foreach ( "in.txt" ) do | line |
    line.scan ( /\w+/ ) do | word |
      queue.push(word.downcase)
    end
  end
  queue.push(nil)
  #konec = true
end


threads << t2 = Thread.new("b") do |i|   
  while true
    val = queue.pop
    if val == nil
      break
    end
    counts [val] += 1
  end
end

threads.each(&:join) # & je každej ten prvek z each a aplikuje se na něj join metoda

counts.keys.sort.each { | k | print " #{k}:#{counts[k]} " }



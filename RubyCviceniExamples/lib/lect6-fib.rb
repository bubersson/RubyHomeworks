

puts "Fibonacci - Excersise 1 - Petr Mikota"


fibonacci = Fiber.new do   
  a=1
  b=1
  while true
    Fiber.yield a 
    a,b = b,a+b   
  end
end


for i in (0..100) do 
  value = fibonacci.resume
  puts value
end

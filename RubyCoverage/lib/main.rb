
require_relative "coverage"



# Parse input from stdin and then
def parse_input
  #puts "Started parsing input"
  tests = []
  tests_count = Integer(gets)

  gets


  #print "graphs:#{graphs_count}\n"  
  tests_count.times do
    lines = []  
    m = Integer(gets)
    #print "parser\n" 
  
  
    while true do    
      a = gets.split(" ")   
      if a.count > 1 
        if a[0] == "0" and a[1] == "0"       
          break
        end
        lines << Line.new(a[0],a[1])
      end
      #p a
    end 
    
    t = Coverage.new(m, lines)
    tests << t
    
    gets
  end
  
  
  # solve for all tests
  tests.each { |t| t.solve() }
  
end


parse_input()




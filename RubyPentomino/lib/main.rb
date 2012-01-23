require_relative "pentomino"
require_relative "piece"
require_relative "desk"

x=12
y=5
printf "------- Pentomino 0.1a --------\n"
#printf "X? "
#x = Integer(gets)
#printf "Y? "
#y = Integer(gets)




def read_pieces(path)
  begin
    file = File.open(path, 'r')
    while (line = file.gets)
      line = line.chomp
      data = line.split(",")      
      yield data
    end
  rescue Errno::ENOENT
    puts "No such file \"#{path}\""
  end
end




#pieces = []
#  pieces << piece

pent = Pentomino::Pentomino.new(x,y)

file = "shapes_sorted.txt"
read_pieces(file)  do |data|
  pent.create_piece(data)
end




puts pent

pent.find_solution

puts pent
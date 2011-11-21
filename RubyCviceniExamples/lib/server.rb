# To change this template, choose Tools | Templates
# and open the template in the editor.

#GServer

require 'gserver'

class MujServer < GServer
  def initialize(port=10001, *args)
    super(port, *args)
  end
  
  def serve(io)    
    words = File.open("input.txt" , "r" ) { | f |
      f.read.split
    }
    io.puts(words[1..20])
  end
end


m = MujServer.new(1337)

m.audit = true                  # Turn logging on.
m.start(10).join   # join, aby to čekalo

gets


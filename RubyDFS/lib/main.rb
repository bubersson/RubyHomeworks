
class Graph   
  attr_accessor :nodes, :types, :id, :start_nodes
  
  def initialize(id, node_count)    
    @id = id
    @node_count = node_count      
    @nodes = []
    @types = []
    @start_nodes = []
  end
end


class Node
  attr_accessor :friends, :id

  def initialize(id)
    @id = id
    @friends = []
  end  
end


def bfs(graph, start_node)  
  open = []
  closed = [] 
  
  active = start_node
  open.push(active)
  
  while not open.empty? do
    active = open.shift    
    closed.push(active)
    
    for i in 0...active.friends.count            
      node = graph.nodes[Integer(active.friends[i])-1]              
      if not open.include?(node) and not closed.include?(node)        
        open.push(node)
      end    
    end
  end
  closed.each { |i| print "#{i.id} " }
  print "\n"
end


def dfs(graph, start_node)  
  open = []
  closed = [] 
  
  active = start_node
  open.push(active)
  while not open.empty? do    
    active = open.pop
    closed.push(active)    
    (active.friends.count-1).downto(0) { |i|    
      node = graph.nodes[Integer(active.friends[i])-1]          
      if not open.include?(node) and not closed.include?(node)        
        open.push(node)
      end
    }
  end
  closed.each { |i| print "#{i.id} " }
  print "\n"
end

#PARSE INPUT

graphs_count = Integer(gets)

#print "graphs:#{graphs_count}\n"
counter=1
graphs_count.times do
  nodes = []  
  nodes_count = Integer(gets)
  g =  Graph.new(counter,nodes_count)
  print "graph #{counter}\n"  
  counter += 1  
  nodes_count.times do
    a = gets.split(" ")   
    n = Node.new(a[0])
    n.friends = a[2..a.length]
    nodes.push(n)    
  end
  g.nodes = nodes
  a= gets
  while a[0] != "0"
    st = a.split(" ")    
    g.types.push(Integer(st[1]))
    g.start_nodes.push(Integer(st[0]))    
    a=gets
  end
  
  #Traverse  
  for j in 0...g.types.count   
    if Integer(g.types[j]) == 0
      dfs(g, g.nodes[g.start_nodes[j]-1])       
    else
      bfs(g, g.nodes[g.start_nodes[j]-1])
    end
  end  
  #graphs.push(g)
end

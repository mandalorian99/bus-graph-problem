# Class : Node 
# Each node object contains detail of each node

class Node
  @@obj_refs = Array.new 
  @@weight = 0

  def initialize(value)
    @name = value 
    @adjacent_nodes = []
    @weight = []

    @@obj_refs << self
  end 
  
  def read
    self
  end
  # add edges 
  def add_edges(adjacent_node , weight)
    @adjacent_nodes << adjacent_node 
    @weight << weight.to_i 
  end 

  # check if node exists or not 
  def self.exists(node_obj)
  
    @@obj_refs.each do |obj|
     
      name1 = obj.get_value
      name2 = node_obj.get_value
      
      temp = obj 
      
      if obj != node_obj 
        
        if name2 == name1 
          node_obj.delete() 
          return temp
        end   

      end 
  
    end 
    return false 
  end

  def get_value 
    @name
  end 

  def self.all
    @@obj_refs.each do |obj|
      p obj 
    end
  end

  def self.count
    @@obj_refs 
  end

  def delete
    @@obj_refs.delete_if{ |obj| obj == self } 
  end

  # get object of named value 
  def self.get_obeject(name)

    @@obj_refs.each do |node|
      if name == node.get_value
        return node 
      end
    end

  end

  # calculate distance between any given nodes 
  def self.distance(*nodes)
  if !nodes.include? nil 
    #p nodes 
    node_stack = []
    nodes = nodes.reverse
   # p nodes 
    nodes.each do |source|
      node_stack << Node.get_obeject(source)
    end
    
    current = node_stack.pop
    terminal = node_stack.last

    
      @@weight += self.calculate_weight(current,terminal)
      
      #p "------self calling------"
      nodes.pop 
      var1 , var2 = nodes.reverse
      self.distance(var1 ,var2)

  end 

  @@weight

  end 

  # calculate weight between two nodes only 
  # and return weight 

  def self.calculate_weight(current,terminal)

    current_adjacent_nodes = current.instance_variable_get("@adjacent_nodes")
    current_nodes_weight = current.instance_variable_get("@weight")

    if current_adjacent_nodes.include? terminal.get_value
      # find index of terminal adjacent node
      index = current_adjacent_nodes.index(terminal.get_value)
      weight = current_nodes_weight.at(index)
      return weight
    else
      puts "XXX NO ROAD current to terminal node XXX"
    end

  end 

end 

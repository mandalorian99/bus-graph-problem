# Class : Node 
# Each node object contains detail of each node

class Node
  @@obj_refs = Array.new 

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

end 

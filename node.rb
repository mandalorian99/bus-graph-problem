# Class : Node 
# Each node object contains detail of each node

class Node
  @@obj_refs = Array.new 
  @@weight = 0
  @@count = 0

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
=begin
  # find best paths 
  def self.find_paths(source , terminal)

    nodes = Array.new 
    weight = 0 

    root = Node.get_obeject(source)
    nodes << root.get_value 
    child_stack = root.children  
    
    loop do 

      child = child_stack.pop 
      p "#{child}===> #{nodes}"
      if child != nil 
        p "traverse for #{child} childs"
      path_nodes = self.traverse(child,terminal,nodes)
       p "  nodes_paths of #{child} is"
       p path_nodes
      end 

      break if child ==nil 
    end 
    # call function recursevily



  
  end
=end
  # return childrens of a object 
  def children
    @adjacent_nodes
  end
=begin
  # helper for find_path
  def self.traverse(source1 , terminal1 , nodes1 )
    root1 = Node.get_obeject(source1) 
    
    if root1.get_value != terminal1
      nodes1 << root1.get_value
      #p nodes 
      sub_child_stack = root1.children
      loop do 

      child1 =sub_child_stack.pop

      if child1 != nil
        p "traverse for #{child1} sub childs"
        self.traverse(child1,terminal1,nodes1)
      end

      break if child1 == nil 

    end 
      #self.traverse(child,terminal,nodes)
      
    else 
      nodes1 << terminal1 
      p "found path #{nodes1}"
      return nodes1 
    end

  end
=end

  # get object of named value 
  def self.get_obeject(name)
    #p "evoked...get object -> #{name}"
      @@obj_refs.each do |node|
        #p node.get_value
        if name == node.get_value
          return node 
        end
      end
      return nil 
  
    end

  # find count of how many paths there exists 
  # for any given point X and Y
  def self.find_paths(source,terminal)
  
    #p "----------#{source}---#{@@count}---------------"
    root = Node.get_obeject(source)
    #p root
    if root == nil 
      #p " in nil"
      has_child = false 
    else 
      #p "not nill , get childs"
      child_stack = root.children 
      has_child = true
    end

    
    #p child_stack

    if source == terminal and has_child
      @@count += 1
    end

    if has_child
      loop do 
        child = child_stack.pop 
        #p "loop for child #{child}----"
        if child != nil 
          Node.find_paths(child , terminal)
        else 
          break 
        end
      end
    end 
    "no of paths b/w #{source} to #{terminal} = #{@@count}"

  end

end 

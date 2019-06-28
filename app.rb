# entry point of application 

require './node.rb'

class App 

  def self.launch

    # Loads data from file to objects 
    IO.foreach('data.txt') do |line| 

      if Node.count == 0
        n = Node.new(line[0].upcase)
        n.add_edges(line[1].upcase , line[2])
        p n 
      else 
        
        n = Node.new(line[0].upcase)
        n.add_edges(line[1].upcase , line[2])
        # check if node with name is already exists or not 
        # if exists , add adjacent node to previously 
        # initialize object array
        if Node.exists(n) != false 
          
          m = Node.exists(n)
          m.add_edges(line[1] , line[2])

        end
        #Node.delete(n)
        #p n 
      end 

    end
    
    #Node.all
    #result = Node.distance('A','D','C')
    #puts "distance of route => #{result}"

    # finding possible paths b/w source and terminal 
    puts Node.find_paths('A','C')
  end

end

App.launch
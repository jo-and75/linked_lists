class LinkedList 
  def append(entry) 
    if @value == nil 
      @value = entry  
      @next_node = entry
    else 
      @next_node.next = entry 
      @next_node = entry
    end
  end
end

class Node 
  attr_accessor :value , :next_node
  def initialize
    @value = nil
    @next_node = nil
  end
end

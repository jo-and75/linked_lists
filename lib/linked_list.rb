class LinkedList
  def initialize
    @head = nil
  end

  class Node
    attr_accessor :value, :next_node

    def initialize(value, nextNode)
      @value = value
      @next_node = nextNode
    end
  end
end

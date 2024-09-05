# frozen_string_literal: true

class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  def append(entry)
    if @head.nil?
      @head = Node.new(entry, nil)
    else
      last_node = @head
      last_node = last_node.next_node until last_node.next_node.nil?
      last_node.next_node = Node.new(entry, nil)
    end
  end

  def prepend(entry)
    if @head.nil?
      @head = Node.new(entry, nil)
    else
      first_node = Node.new(entry, @head)
      @head = first_node
    end
  end

  def size(list)
    return 0 if list.nil?

    1 + size(list.next_node)
  end

  class Node
    attr_accessor :value, :next_node

    def initialize(value, next_node)
      @value = value
      @next_node = next_node
    end
  end
end

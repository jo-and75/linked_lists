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

  def access_head
    return @head.value unless @head.nil?

    puts 'No head present.'
  end

  def access_tail(list)
    puts 'List is empty.' if list.nil?

    return list.value if list.next_node.nil?

    access_tail(list.next_node)
  end

  def at(index)
    count = 0
    curr = @head

    until curr.nil?
      break if count == index

      curr = curr.next_node
      count += 1
    end
    return nil.inspect if curr.nil?

    curr.value
  end

  class Node
    attr_accessor :value, :next_node

    def initialize(value, next_node)
      @value = value
      @next_node = next_node
    end
  end
end

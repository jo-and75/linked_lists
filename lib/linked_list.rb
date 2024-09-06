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

  def size(list = @head)
    return 0 if list.nil?

    1 + size(list.next_node)
  end

  def access_head
    return @head.value unless @head.nil?

    puts 'No head present.'
  end

  def access_tail(list = @head)
    return nil.inspect if list.nil?

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

  def pop(list_node = @head)
    return nil if list_node.nil? || list_node.next_node.nil?

    second_last = @head
    second_last = second_last.next_node until second_last.next_node.next_node.nil?
    second_last.next_node = nil

    second_last.value
  end

  def contains(elem, head = @head)
    if head.nil?
      false
    elsif head.value == elem
      true
    else
      contains(elem, head.next_node)
    end
  end

  def find(elem, head = @head, count = 0)
    if head.nil?
      nil
    elsif head.value == elem
      count
    else
      count += 1
      find(elem, head.next_node, count)
    end
  end

  def to_string(node = @head)
    if node.nil?
      print ' nil '
    else
      print "(#{node.value}) -> "
      to_string(node.next_node)
    end
  end

  class Node
    attr_accessor :value, :next_node

    def initialize(value, next_node)
      @value = value
      @next_node = next_node
    end
  end
end

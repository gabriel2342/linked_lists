
class LinkedList

  attr_accessor :head

  def initialize
    self.head = nil
  end

  def append(value)
    if head.nil?
      self.head = Node.new(value)
    else  
      last_node = self.head
      until last_node.next_node == nil
        last_node = last_node.next_node
      end
      last_node.next_node = Node.new(value)
    end
  end

  def prepend(value)
    if self.head.nil?
      self.head = Node.new(value)
    else
      old_head = self.head
      self.head = Node.new(value, old_head)
    end
  end
      
  def size
    counter = 1
    last_node = self.head
    until last_node.next_node == nil
      last_node = last_node.next_node
      counter += 1
    end
    counter
  end

  def heads
    self.head.value
  end

  def tail
    last_node = self.head
    until last_node.next_node == nil
      last_node = last_node.next_node
    end
    last_node.value
  end

  def at(index)
    return if self.head.nil?
    counter = 0
    last_node =self.head
    until counter == index
      last_node = last_node.next_node
      counter += 1
    end
    last_node.value
  end

  def pop
    return if head.nil?
    last_node = self.head
    until last_node.next_node.next_node == nil
      last_node = last_node.next_node
    end
    last_node.next_node = nil
  end

  def contains?(val)
    return if head.nil?
    last_node = self.head
    until last_node.next_node == nil
      last_node = last_node.next_node
      return true if last_node.value == val
    end
    false
  end

  def find(val)
    return if head.nil?
    last_node = self.head
    counter = 0
    until last_node.next_node == nil
      last_node = last_node.next_node
      counter +=1
      return counter if last_node.value == val
      
    end
    nil
  end

  def to_s
    last_node = self.head
    until last_node == nil
      last_node.value = last_node.value.to_s
      last_node = last_node.next_node
    end
  end

  def insert_at(value, index)
    last_node = self.head
    previous_node = last_node
    counter = 0
    until counter == index
      previous_node = last_node
      last_node = last_node.next_node
      counter +=1
    end
    our_node = Node.new(value)
    previous_node.next_node = our_node
    our_node.next_node = last_node
    
  end

  private 

  class Node
    attr_accessor :value, :next_node
    def initialize(value = nil, next_node = nil)
      self.value = value
      self.next_node = next_node
    end
  end
end

newlist = LinkedList.new
newlist.append(10)
newlist.append(20)
newlist.append(30)
newlist.append(40)
newlist.append(100)
newlist.insert_at(23,2)
#newlist.to_s
p newlist
# p newlist.contains?(39)
# p newlist.find(30)
# newlist.pop
# puts "at index 3 is the number #{newlist.at(3)}"
# p newlist
# puts newlist.head.value
# puts newlist.head.next_node.value
# puts "size is #{newlist.size}"
# puts "head is #{newlist.heads}"
# puts "tail is #{newlist.tail}"
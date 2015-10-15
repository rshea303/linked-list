class Node
  attr_accessor :value, :next_node

  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class List
  attr_reader :head
  attr_accessor :total_nodes

  def initialize(value)
    @head = Node.new(value)
    @total_nodes = 1
  end

  def add_node(value)
    current_head = @head
    until current_head.next_node == nil
      current_head = current_head.next_node
    end
    current_head.next_node = Node.new(value)
    @total_nodes += 1
  end

  def list_nodes
    collector = []
    current_head = @head
    until current_head.next_node == nil
      collector << current_head.value
      current_head = current_head.next_node
    end
    collector << current_head.value
    collector.join(' - ')
  end

  def delete_node(remove_value)
    current_head = @head
    until current_head.value == remove_value
      prev_head = current_head
      post_head = current_head.next_node.next_node
      current_head = current_head.next_node
    end
    @total_nodes -= 1
    current_head.value = nil
    prev_head.next_node = post_head
  end

end

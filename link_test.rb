require 'minitest/autorun'
require 'minitest/pride'
require_relative 'link'

class LinkTest < Minitest::Test
  def test_a_node_exists
    node = Node.new(3)

    assert node
  end

  def test_a_node_has_a_value
    node = Node.new(5)

    assert_equal 5, node.value
  end

  def test_a_node_has_a_pointer
    node = Node.new(3)

    assert_equal nil, node.next_node
  end

  def test_a_linkedlist_has_a_head
    list = List.new(5)

    assert_equal 5, list.head.value
  end

  def test_a_node_links_to_next_node
    list = List.new(5)
    list.add_node(6)

    assert_equal 6, list.head.next_node.value
  end

  def test_3_nodes_are_connected
    list = List.new(1)
    list.add_node(2)
    list.add_node(3)

    assert_equal 3, list.head.next_node.next_node.value
  end

  def test_count_nodes
    list = List.new(1)
    list.add_node(2)
    list.add_node(3)
    
    assert_equal 3, list.total_nodes
  end

  def test_list_nodes
    list = List.new(1)
    list.add_node(2)
    list.add_node(3)

    assert_equal "1 - 2 - 3", list.list_nodes
  end

  def test_delete_node
    list = List.new(1)
    list.add_node(2)
    list.add_node(3)

    assert_equal 3, list.total_nodes

    list.delete_node(2)

    assert_equal 2, list.total_nodes
    assert_equal "1 - 3", list.list_nodes
   
  end
end

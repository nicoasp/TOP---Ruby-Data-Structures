require './node.rb'

class BinaryTree

	attr_accessor :root

	def initialize(array = [])
		@root = nil
		build_tree(array) if array.length > 0
	end

	def place_child(parent, child)
		if child.value < parent.value
			if parent.left_child == nil
				parent.left_child = child
				child.parent = parent
			else
				place_child(parent.left_child, child)
			end
		elsif child.value > parent.value
			if parent.right_child == nil
				parent.right_child = child
				child.parent = parent
			else
				place_child(parent.right_child, child)
			end
		else
			if parent.left_child == nil
				parent.left_child = child
				child.parent = parent
			elsif parent.right_child == nil
				parent.right_child = child
				child.parent = parent
			else
				place_child(parent.left_child, child)
			end
		end
	end

	def build_tree(array)
		@root = Node.new(array.pop)
		array.each do |value|
			child = Node.new(value)
			place_child(@root, child)
		end
	end

	def breath_first_search(value)
		return nil if @root == nil
		que = [@root]
		until que.empty?
			node = que.shift
			return node if node.value == value
			que << node.left_child unless node.left_child == nil
			que << node.right_child unless node.right_child == nil 
		end
		nil
	end

	def depth_first_search(value)
		return nil if @root == nil
		stack = [@root]
		until stack.empty?
			first_element = stack[0]
			while stack.last.left_child != nil
				stack << stack.last.left_child
			end
			while stack[0] == first_element
				node = stack.pop
				return node if node.value == value
				stack << node.right_child unless node.right_child == nil
			end
		end
		nil
	end

	def dfs_rec(value, current_node = @root)
		return nil if @root == nil
		stack = [current_node]
		until stack.empty?
			node = stack.pop
			rec = dfs_rec(value, node.left_child) if node.left_child != nil
			return rec unless rec == nil
			return node if node.value == value
			stack << node.right_child unless node.right_child == nil
		end
		nil
	end


end











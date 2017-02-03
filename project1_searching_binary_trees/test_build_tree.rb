require './binary_tree.rb'

tree = BinaryTree.new([12, 3, 76, 35, 67, 18, 22, 98, 81, 36, 10, 74, 88, 42, 48, 13, 12, 89, 7, 65, 44])
=begin
puts tree.root.value
print tree.root.left_child.value.to_s + " - " + tree.root.right_child.value.to_s
puts
print tree.root.left_child.left_child.value.to_s + " - " + tree.root.left_child.right_child.value.to_s + " - " + tree.root.right_child.left_child.value.to_s + " - " + tree.root.right_child.right_child.value.to_s
puts
=end

node = tree.breath_first_search(74)
if node != nil
	puts "Found value: #{node.value}"
	puts "Parent: " + node.parent.value.to_s unless node.parent == nil
	puts "Left child: " + node.left_child.value.to_s unless node.left_child == nil
	puts "Right child: " + node.right_child.value.to_s unless node.right_child == nil
else
	puts "Value not found"
end

node = tree.depth_first_search(74)
if node != nil
	puts "Found value: #{node.value}"
	puts "Parent: " + node.parent.value.to_s unless node.parent == nil
	puts "Left child: " + node.left_child.value.to_s unless node.left_child == nil
	puts "Right child: " + node.right_child.value.to_s unless node.right_child == nil
else
	puts "Value not found"
end

node = tree.dfs_rec(74)
if node != nil
	puts "Found value: #{node.value}"
	puts "Parent: " + node.parent.value.to_s unless node.parent == nil
	puts "Left child: " + node.left_child.value.to_s unless node.left_child == nil
	puts "Right child: " + node.right_child.value.to_s unless node.right_child == nil
else
	puts "Value not found"
end
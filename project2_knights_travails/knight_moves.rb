require './square.rb'
require './board.rb'

class KnightMoves

	def initialize
		@board = Board.new
		@board.calculate_connected_squares_knight
		@que = []
	end

	def delete_used_square(square)
		@board.squares_array.each do |square_in_array|
			square_in_array.connected_squares_knight.delete(square)
		end
	end

	def knight_moves(start_position, end_position)
		first_square = @board.squares_array.select {|square| square.position == start_position}[0]
		@que << first_square
		delete_used_square(first_square)
		loop do
			current_square = @que.shift
			current_square.path << current_square.position
			if current_square.position == end_position
				return current_square.path
			end
			@board.squares_array.delete(current_square)
			current_square.connected_squares_knight.each do |s|
				s.path += current_square.path
				delete_used_square(s) 
				@que << s
			end
		end
	end
end

km = KnightMoves.new
puts "Type your starting square (b4 / f1 / h7...)"
start = gets.chomp
puts "Type your target square (h8 / a3 / g6...)"
target = gets.chomp
a = km.knight_moves(start, target)
puts "You made it in #{a.length - 1} moves! Here's your path:"
puts a















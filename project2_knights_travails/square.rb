class Square

	attr_accessor :letter_position, :number_position, :position, :connected_squares_knight, :path

	def initialize(letter_position, number_position)
		@letter_position = letter_position
		@number_position = number_position
		@position = "#{@letter_position}#{@number_position}"
		@connected_squares_knight = []
		@path = []
	end

end

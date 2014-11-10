class Cell
	attr_reader :living

	def initialize(row, col, living)
		@row = row
		@col = col
		@living = living
	end

	def dead
		return !living
	end

	def dies
		@living = false
	end

	def regenerates
		@living = true
	end

	def to_s
		@living ? "X" : "_"
	end

	def neighbors_coords
		all_directions = [
												[-1,-1], [-1,0],  [-1,1],
												[0,-1],           [0,1],
												[1,-1],   [1,0],  [1,1],
											]
		neighbors_coords = all_directions.each_with_object([]) do |coord, neighbors|
			neighbor_row = @row + coord[0]
			neighbor_col = @col + coord[1]
			neighbors.push([neighbor_row, neighbor_col])
		end
		return neighbors_coords

	end

end

c = Cell.new(0,0,true)
puts c.neighbors_coords.inspect

class Cell
	attr_accessor :living, :num_living_neighbors

	def initialize(row, col, living)
		@row = row
		@col = col
		@living = living
		@num_living_neighbors = 0
	end

	def dead
		return !living
	end

	def tick
		return true if living && (num_living_neighbors==2 || num_living_neighbors==3)
		return true if dead && num_living_neighbors==3
		return false
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
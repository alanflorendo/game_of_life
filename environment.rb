require_relative 'cell.rb'

class Environment
	attr_reader :height, :width, :cells

	def initialize(height, width, habitability)
		@height = height
		@width = width
		@habitability = habitability
		@cells = []
		@height.times { @cells.push(Array.new(width))}
	end

	def culture_cells
		@height.times { |row| @width.times { |col| 
			@cells[row][col] = Cell.new(row, col, @habitability > rand) } }
	end

	def culture_cell(row, col, living=true)
		@cells[row][col] = Cell.new(row, col, living)
	end

	def coord_is_valid(coord)
		return false if coord[0]<0 || coord[0]>=@height
		return false if coord[1]<0 || coord[1]>=@width
		return true
	end

	def num_living_neighbors(cell_row, cell_col)
		num_living = 0
		cell = @cells[cell_row][cell_col]
		cell.neighbors_coords.each do |coord|
			if coord_is_valid(coord)
				neighbor_cell = @cells[coord[0]][coord[1]]
				num_living += 1 if neighbor_cell.living
			end
		end
		return num_living
	end

	def to_s
		@height.times do |row|
			@width.times do |col|
				print @cells[row][col]
			end
			print "\n"
		end
	end

end
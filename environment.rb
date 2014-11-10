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
			@cells[row][col] = Cell.new(@habitability > rand) } }
	end

	def culture_cell(row, col, living=true)
		@cells[row][col] = Cell.new(living)
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


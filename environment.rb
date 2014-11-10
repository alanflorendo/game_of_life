require_relative 'cell.rb'

class Environment
	attr_reader :height, :width, :cells

	def initialize(height, width)
		@height = height
		@width = width
		@cells = []
		@height.times { @cells.push(Array.new(width))}
	end

	def culture_cells
		@height.times do |row|
			@cells.push([])
			@width.times do |cell|
				@cells[row].push(Cell.new(true))
			end			
		end
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


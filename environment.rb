require_relative 'cell.rb'

class Environment
	attr_reader :height, :width, :cells
	attr_accessor :life_at_t_plus_one

	def initialize(height, width, habitability)
		@height = height
		@width = width
		@habitability = habitability
		@cells = []
		@height.times { @cells.push(Array.new(width))}
		@life_at_t_plus_one = []
		@height.times { @life_at_t_plus_one.push(Array.new(width))}
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

	def set_num_living_neighbors_for_all_cells
		@height.times { |r| @width.times { |c| 
			@cells[r][c].num_living_neighbors = num_living_neighbors(r,c) } }
	end

	def tick
		set_num_living_neighbors_for_all_cells

		# store results of rules in separate array
		@height.times { |r| @width.times { |c| 
			@life_at_t_plus_one[r][c] = @cells[r][c].tick  } }

		# apply results of that array to existing environment
		@height.times { |r| @width.times { |c| 
			@cells[r][c].living = @life_at_t_plus_one[r][c] } }

		expand_if_needed
	end

	def tick_indefinitely(pause_time)
			puts "\e[H\e[2J" # clear terminal window
			puts self
			sleep(pause_time)
			set_num_living_neighbors_for_all_cells
			tick
			tick_indefinitely(pause_time)
	end

	def expand_with_new_dead_row
		# new_dead_row = []
		@cells.push([])
		@life_at_t_plus_one.push([])
		@width.times { |col| @cells[@height].push(Cell.new(@height, col, false))}
		@width.times { |col| @life_at_t_plus_one[@height].push(false) }
		@height += 1	
	end

	def expand_with_new_dead_col
		@height.times { |row| @cells[row].push(Cell.new(row, @width, false)) }
		@height.times { |row| @life_at_t_plus_one[row].push(false) }
		@width += 1	
	end

	def this_row_contains_life(row)
		life_in_here = false
		@cells[row].each { |cell| life_in_here = true if cell.living }
		return life_in_here
	end

	def this_col_contains_life(col)
		life_in_here = false
		@height.times { |row| life_in_here = true if @cells[row][col].living }
		return life_in_here
	end

	def expand_if_needed
		expand_with_new_dead_row if this_row_contains_life(@height-1)
		expand_with_new_dead_col if this_col_contains_life(@width-1)
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
class Cell
	attr_reader :living

	def initialize
		@living = true if rand > 0.5
	end

	def dead
		return !living
	end

end
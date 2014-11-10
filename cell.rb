class Cell
	attr_reader :living

	def initialize(living)
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

end
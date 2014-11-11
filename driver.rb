require_relative 'environment.rb'

puts "\e[H\e[2J" #clear_screen before driver code

# BLINKER (PERIOD 2)
# e = Environment.new(5, 5, 0)
# e.culture_cells
# e.culture_cell(1,2)
# e.culture_cell(2,2)
# e.culture_cell(3,2)
# e.tick_indefinitely(0.5)


# STILL LIFE (BLOCK)
# e = Environment.new(5,5,0)
# e.culture_cells
# e.culture_cell(1,1)
# e.culture_cell(1,2)
# e.culture_cell(2,1)
# e.culture_cell(2,2)
# e.tick_indefinitely(0.5)

#STILL LIFE (BEEHIVE)
# ______
# __XX__
# _X__X_
# __XX__
# ______

# e = Environment.new(5,6,0)
# e.culture_cells
# e.culture_cell(1,2)
# e.culture_cell(1,3)
# e.culture_cell(2,1)
# e.culture_cell(2,4)
# e.culture_cell(3,2)
# e.culture_cell(3,3)
# e.tick_indefinitely(0.5)

# TOAD (PERIOD 2)
# e = Environment.new(6,6,0)
# e.culture_cells
# e.culture_cell(2,2)
# e.culture_cell(2,3)
# e.culture_cell(2,4)
# e.culture_cell(3,3)
# e.culture_cell(3,4)
# e.culture_cell(3,5)
# e.tick_indefinitely(0.5)

# BEACON (PERIOD 2)
# e = Environment.new(6,6,0)
# e.culture_cells
# e.culture_cell(1,1)
# e.culture_cell(1,2)
# e.culture_cell(2,1)
# e.culture_cell(2,2)
# e.culture_cell(3,3)
# e.culture_cell(3,4)
# e.culture_cell(4,3)
# e.culture_cell(4,4)
# e.tick_indefinitely(0.5)

# GLIDER
e = Environment.new(40,40,0)
e.culture_cells
e.culture_cell(0,1)
e.culture_cell(1,2)
e.culture_cell(2,0)
e.culture_cell(2,1)
e.culture_cell(2,2)
e.tick_indefinitely(0.25)
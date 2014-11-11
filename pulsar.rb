require_relative 'environment.rb'

puts "\e[H\e[2J" #clear_screen before driver code

# PULSAR (PERIOD 3)
e = Environment.new(17, 17, 0)
e.culture_cells

# 1st horizontal row
e.culture_cell(2,4)
e.culture_cell(2,5)
e.culture_cell(2,6)
e.culture_cell(2,10)
e.culture_cell(2,11)
e.culture_cell(2,12)

# 2nd horizontal row
e.culture_cell(7,4)
e.culture_cell(7,5)
e.culture_cell(7,6)
e.culture_cell(7,10)
e.culture_cell(7,11)
e.culture_cell(7,12)

# 3rd horizontal row
e.culture_cell(9,4)
e.culture_cell(9,5)
e.culture_cell(9,6)
e.culture_cell(9,10)
e.culture_cell(9,11)
e.culture_cell(9,12)

# 4th horizontal row
e.culture_cell(14,4)
e.culture_cell(14,5)
e.culture_cell(14,6)
e.culture_cell(14,10)
e.culture_cell(14,11)
e.culture_cell(14,12)

# 1st vertical col
e.culture_cell(4,2)
e.culture_cell(5,2)
e.culture_cell(6,2)
e.culture_cell(10,2)
e.culture_cell(11,2)
e.culture_cell(12,2)

# 2nd vertical col
e.culture_cell(4,7)
e.culture_cell(5,7)
e.culture_cell(6,7)
e.culture_cell(10,7)
e.culture_cell(11,7)
e.culture_cell(12,7)

# 3rd vertical col
e.culture_cell(4,9)
e.culture_cell(5,9)
e.culture_cell(6,9)
e.culture_cell(10,9)
e.culture_cell(11,9)
e.culture_cell(12,9)

# 4th vertical col
e.culture_cell(4,14)
e.culture_cell(5,14)
e.culture_cell(6,14)
e.culture_cell(10,14)
e.culture_cell(11,14)
e.culture_cell(12,14)

e.tick_indefinitely(1)
require_relative '../environment'

require 'spec_helper'

describe Environment do

	context "when the initial environment is set as a 2x2 block shape" do
		# set up initial square shape
		# _____
		# _XX__
		# _XX__
		# _____
		# _____
		before(:each) do
			@e = Environment.new(5, 5, 0)
			@e.culture_cells
			@e.culture_cell(1,1)
			@e.culture_cell(1,2)
			@e.culture_cell(2,1)
			@e.culture_cell(2,2)
			@e.set_num_living_neighbors_for_all_cells
		end

		it "remains a 2x2 block shape after one tick" do
			@e.tick
			# expect living cells in interior
			expect(@e.cells[1][1].living).to eq(true)
			expect(@e.cells[1][2].living).to eq(true)
			expect(@e.cells[2][1].living).to eq(true)
			expect(@e.cells[2][2].living).to eq(true)

			# expect dead cells along perimeter
			expect(@e.cells[0][1].dead).to eq(true)
			expect(@e.cells[0][2].dead).to eq(true)
			expect(@e.cells[1][0].dead).to eq(true)
			expect(@e.cells[1][4].dead).to eq(true)
			expect(@e.cells[2][0].dead).to eq(true)
			expect(@e.cells[2][4].dead).to eq(true)
			expect(@e.cells[4][1].dead).to eq(true)
			expect(@e.cells[4][2].dead).to eq(true)
		end
	

		it "remains a 2x2 block shape after two ticks" do
			@e.tick
			@e.set_num_living_neighbors_for_all_cells
			@e.tick
			# expect living cells in interior
			expect(@e.cells[1][1].living).to eq(true)
			expect(@e.cells[1][2].living).to eq(true)
			expect(@e.cells[2][1].living).to eq(true)
			expect(@e.cells[2][2].living).to eq(true)

			# expect dead cells along perimeter
			expect(@e.cells[0][1].living).to eq(false)
			expect(@e.cells[0][2].living).to eq(false)
			expect(@e.cells[1][0].living).to eq(false)
			expect(@e.cells[1][4].living).to eq(false)
			expect(@e.cells[2][0].living).to eq(false)
			expect(@e.cells[2][4].living).to eq(false)
			expect(@e.cells[4][1].living).to eq(false)
			expect(@e.cells[4][2].living).to eq(false)
		end
	
	end

	context "when the initial environment is set as a beehive shape" do
	# set up initial beehive shape
	# ______
	# __XX__
	# _X__X_
	# __XX__
	# ______

		before(:each) do
			@e = Environment.new(5, 6, 0)
			@e.culture_cells
			@e.culture_cell(1,2)
			@e.culture_cell(1,3)
			@e.culture_cell(2,1)
			@e.culture_cell(2,4)
			@e.culture_cell(3,2)
			@e.culture_cell(3,3)
			@e.set_num_living_neighbors_for_all_cells
		end

		it "remains a beehive shape after one tick" do
			@e.tick
			expect(@e.cells[1][2].living).to eq(true)
			expect(@e.cells[1][3].living).to eq(true)
			expect(@e.cells[2][1].living).to eq(true)
			expect(@e.cells[2][4].living).to eq(true)
			expect(@e.cells[3][2].living).to eq(true)
			expect(@e.cells[3][2].living).to eq(true)
			expect(@e.cells[0][0].dead).to eq(true)
			expect(@e.cells[0][5].dead).to eq(true)
			expect(@e.cells[3][0].dead).to eq(true)
			expect(@e.cells[4][4].dead).to eq(true)
		end	

		it "remains a beehive shape after two ticks" do
			@e.tick
			@e.set_num_living_neighbors_for_all_cells
			@e.tick
			expect(@e.cells[1][2].living).to eq(true)
			expect(@e.cells[1][3].living).to eq(true)
			expect(@e.cells[2][1].living).to eq(true)
			expect(@e.cells[2][4].living).to eq(true)
			expect(@e.cells[3][2].living).to eq(true)
			expect(@e.cells[3][2].living).to eq(true)
			expect(@e.cells[0][0].dead).to eq(true)
			expect(@e.cells[0][5].dead).to eq(true)
			expect(@e.cells[3][0].dead).to eq(true)
			expect(@e.cells[4][4].dead).to eq(true)
		end	

	end
	
	context "when the initial environment is set as a blinker shape" do
		# set up initial blinker shape (a vertical line)
		# _____     _____
		# __X__     _____
		# __X__     _XXX_
		# __X__     _____
		# _____     _____
		before(:each) do
			@e = Environment.new(5, 5, 0)
			@e.culture_cells
			@e.culture_cell(1,2)
			@e.culture_cell(2,2)
			@e.culture_cell(3,2)
			@e.set_num_living_neighbors_for_all_cells
		end

		it "has three living cells in a horizontal line after one tick" do
			@e.tick
			expect(@e.cells[2][1].living).to eq(true)
			expect(@e.cells[2][2].living).to eq(true)
			expect(@e.cells[2][3].living).to eq(true)
			expect(@e.cells[1][2].living).to eq(false)
			expect(@e.cells[3][2].living).to eq(false)
		end

		it "has three living cells in a vertical line after two ticks" do
			@e.tick
			@e.set_num_living_neighbors_for_all_cells
			@e.tick
			expect(@e.cells[2][1].dead).to eq(true)
			expect(@e.cells[2][3].dead).to eq(true)
			expect(@e.cells[1][2].dead).to eq(false)
			expect(@e.cells[2][2].dead).to eq(false)
			expect(@e.cells[3][2].dead).to eq(false)
		end	

		it "has three living cells in a horizontal line after three ticks" do
			@e.tick
			@e.set_num_living_neighbors_for_all_cells
			@e.tick
			@e.set_num_living_neighbors_for_all_cells
			@e.tick
			expect(@e.cells[2][1].living).to eq(true)
			expect(@e.cells[2][2].living).to eq(true)
			expect(@e.cells[2][3].living).to eq(true)
			expect(@e.cells[1][2].living).to eq(false)
			expect(@e.cells[3][2].living).to eq(false)
		end
	
	end


end
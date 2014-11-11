require 'spec_helper'
require_relative '../environment.rb'

describe 'Environment' do
	let!(:new_environment) { Environment.new(5,10, 1) }
	let!(:happy_place) { Environment.new(5,10, 1) }
	let!(:place_of_death) { Environment.new(5,10, 0) }
	let!(:soso_place) { Environment.new(5,10, 0.5) }

	context "when initialized as 5x10" do 

		it "is a Cell object" do
			expect(new_environment).to be_an(Environment)
		end

		it "has height and width properties" do
			expect(new_environment.height).to eq(5)
			expect(new_environment.width).to eq(10)
		end

		it "has a size of 25 (5x5)" do
			expect(new_environment.cells.flatten.length).to eq(50)
		end

		it "has an empty population (ie, no cells)" do
			new_environment.cells.flatten.each { |cell| 
				expect(cell).to eq(nil) }
		end

	end

	context "in terms of culturing the entire environment" do

		context "after the full environment has been cultured" do

			it "contains 50 cells" do
				new_environment.culture_cells
				50.times { |index| expect(new_environment.cells.flatten[index]).to be_a(Cell)}
			end
		end

		context "when entirely hospitable" do
			it "all of the cells cultured will initially be living" do
				happy_place.culture_cells
				50.times { |index| expect(happy_place.cells.flatten[index].living).to eq(true)}
			end
		end

		context "when entirely inhospitable" do
			it "all of the cells cultured will initially be dead" do
				place_of_death.culture_cells
				50.times { |index| expect(place_of_death.cells.flatten[index].dead).to eq(true)}
			end
		end

		context "when 50% inhospitable" do
			it "approximately half of the cells cultured will initially be living" do
				soso_place.culture_cells
				num_living_cells = 0
				soso_place.height.times do |row|
					soso_place.width.times do |col|
						num_living_cells += 1 if soso_place.cells[row][col].living
					end
				end
				expect(15..35).to include(num_living_cells)
			end
		end
	end

	context "when cells are cultured in a specific location" do
		it "creates live cells in the specific location" do
			new_environment.culture_cell(0,0)
			new_environment.culture_cell(4,4,false)
			expect(new_environment.cells[0][0].living).to eq(true)
			expect(new_environment.cells[4][4].dead).to eq(true)
		end
	end

	context "when cells are cultured in a 4x4 environment" do
		# XX__
		# XX__
		# ____
		# ____
		it "num_living_neighbors property works" do
			e = Environment.new(4,4,0)
			e.culture_cells
			e.culture_cell(0,0)
			e.culture_cell(0,1)
			e.culture_cell(1,0)
			e.culture_cell(1,1)
			expect(e.num_living_neighbors(0,0)).to eq(3)
			expect(e.num_living_neighbors(0,1)).to eq(3)
			expect(e.num_living_neighbors(1,0)).to eq(3)
			expect(e.num_living_neighbors(1,1)).to eq(3)
			expect(e.num_living_neighbors(0,2)).to eq(2)
			expect(e.num_living_neighbors(1,2)).to eq(2)
			expect(e.num_living_neighbors(2,2)).to eq(1)
			expect(e.num_living_neighbors(3,3)).to eq(0)
		end
	end

	describe "neighbors" do

		context "when only one cell has been created in an environment" do
			let!(:environment_1x1) { Environment.new(1, 1, 1) }
			before(:each) do 
				environment_1x1.culture_cells 
			end

			it "responds to 'num_living_neighbors' method" do
				expect(environment_1x1.cells[0][0]).to respond_to(:num_living_neighbors)
			end

			it "has zero neighbors" do
				environment_1x1.set_num_living_neighbors_for_all_cells
				cell = environment_1x1.cells[0][0]
				expect(cell.num_living_neighbors).to eq(0) 
			end
		end
	end

	context "Implementation of Rules" do
		let!(:new_environment) { Environment.new(5, 5, 0) }

		context "Rule 1: when living cells have only 0 or 1 neighbor" do

			it "the cells die after a tick" do
				new_environment.culture_cells
				new_environment.culture_cell(0,0)
				new_environment.culture_cell(4,3)
				new_environment.culture_cell(4,4)
				new_environment.set_num_living_neighbors_for_all_cells
				new_environment.tick
				expect(new_environment.cells[0][0].dead).to eq(true)
				expect(new_environment.cells[4][3].dead).to eq(true)
				expect(new_environment.cells[4][4].dead).to eq(true)
			end

		end

		context "Rule 2: when living cells have 2 or 3 neighbors" do

			it "the cells with 2 neighbors continue to live after a tick" do
				# D_D
				# _L_
				new_environment.culture_cells
				new_environment.culture_cell(0,0)
				new_environment.culture_cell(1,1)
				new_environment.culture_cell(0,2)
				new_environment.set_num_living_neighbors_for_all_cells
				new_environment.tick
				expect(new_environment.cells[0][0].dead).to eq(true) # one neighbor
				expect(new_environment.cells[1][1].living).to eq(true) # two neighbors
				expect(new_environment.cells[0][2].dead).to eq(true) # one neighbor
			end

			it "the cells with 3 neighbors continue to live after a tick" do
				# D_D
				# _L_
				# _D_
				new_environment.culture_cells
				new_environment.culture_cell(0,0)
				new_environment.culture_cell(0,2)
				new_environment.culture_cell(1,1)
				new_environment.culture_cell(2,1)
				new_environment.set_num_living_neighbors_for_all_cells
				new_environment.tick
				expect(new_environment.cells[0][0].dead).to eq(true) # one neighbor
				expect(new_environment.cells[0][2].dead).to eq(true) # one neighbor
				expect(new_environment.cells[1][1].living).to eq(true) # three neighbors
				expect(new_environment.cells[2][1].dead).to eq(true) # one neighbor
			end
		end

		context "Rule 3: when living cells have more than three live neighbors" do
			it "the cells die after one tick" do
				# LDL
				# LDL
				new_environment.culture_cells
				new_environment.culture_cell(0,0)
				new_environment.culture_cell(0,1)
				new_environment.culture_cell(0,2)
				new_environment.culture_cell(1,0)
				new_environment.culture_cell(1,1)
				new_environment.culture_cell(1,2)
				new_environment.set_num_living_neighbors_for_all_cells
				new_environment.tick
				expect(new_environment.cells[0][0].living).to eq(true) # three neighbors
				expect(new_environment.cells[0][1].dead).to eq(true) # five neighbors
				expect(new_environment.cells[0][2].living).to eq(true) # three neighbors
				expect(new_environment.cells[1][0].living).to eq(true) # three neighbors
				expect(new_environment.cells[1][1].dead).to eq(true) # five neighbors
				expect(new_environment.cells[1][2].living).to eq(true) # three neighbors
			end
		end

		context "Rule 4: when a dead cell has exactly three live neighbors" do
			it "the cell becomes a live cell, as if by reproduction" do
				# _R_
				# LLL
				new_environment.culture_cells
				new_environment.culture_cell(0,1)
				new_environment.culture_cell(1,0)
				new_environment.culture_cell(1,1)
				new_environment.culture_cell(1,2)
				new_environment.cells[0][1].dies
				new_environment.set_num_living_neighbors_for_all_cells
				new_environment.tick
				expect(new_environment.cells[0][1].living).to eq(true)
				expect(new_environment.cells[1][0].dead).to eq(true)
				expect(new_environment.cells[1][1].living).to eq(true)
				expect(new_environment.cells[1][2].dead).to eq(true)
			end
		end
	end
end


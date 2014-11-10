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

end


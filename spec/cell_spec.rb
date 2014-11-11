require 'spec_helper'
require_relative '../cell.rb'

describe 'Cell' do
	let!(:new_living_cell) { Cell.new(0, 0, true) }
	let!(:new_dead_cell) { Cell.new(0, 0, false) }

	context "when initialized" do 

		it "is a Cell object" do
			expect(new_living_cell).to be_a(Cell)
		end
	end

	context "in life and death matters" do
		it "is either dead or living" do
			expect(new_living_cell).to respond_to(:living)
			expect(new_living_cell).to respond_to(:dead)
		end
	end

	context "when a cell is cultured at location (0,0)" do
		it "has 8 neighbors" do
			expect(new_living_cell.neighbors_coords.length).to eq(8)
		end

		it "has neighbors that are (-1, -1), (-1, 0), (-1, 1), (0, -1), (0, 1), (1, -1), (1, 0), (1, 1)" do
			expect(new_living_cell.neighbors_coords).to include([-1,-1])
			expect(new_living_cell.neighbors_coords).to include([-1, 0])
			expect(new_living_cell.neighbors_coords).to include([-1, 1])
			expect(new_living_cell.neighbors_coords).to include([0, -1])
			expect(new_living_cell.neighbors_coords).to include([0,  1])
			expect(new_living_cell.neighbors_coords).to include([1, -1])
			expect(new_living_cell.neighbors_coords).to include([1,  0])
			expect(new_living_cell.neighbors_coords).to include([1,  1])
		end
	end

end
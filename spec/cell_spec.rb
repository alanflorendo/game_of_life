require 'spec_helper'
require_relative '../cell.rb'

describe 'Cell' do
	let!(:new_living_cell) { Cell.new(true) }
	let!(:new_dead_cell) { Cell.new(false) }

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

		it "is dead (not living) after it dies" do
			new_living_cell.dies
			expect(new_living_cell.dead).to eq(true)
			expect(new_living_cell.living).to eq(false)
		end

		it "is living (not dead) after it regenerates" do
			new_dead_cell.regenerates
			expect(new_dead_cell.living).to eq(true)
			expect(new_dead_cell.dead).to eq(false)
		end

	end


end
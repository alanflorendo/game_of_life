require 'spec_helper'
require_relative '../cell.rb'

describe 'Cell' do
	let!(:new_cell) { Cell.new }

	context "when initialized" do 

		it "is a Cell object" do
			expect(new_cell).to be_a(Cell)
		end
	end

	context "in life and death matters" do
		it "is either dead or alive" do
			expect(new_cell).to respond_to(:living)
			expect(new_cell).to respond_to(:dead)
		end
	end


end
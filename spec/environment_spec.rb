require 'spec_helper'
require_relative '../environment.rb'

describe 'Environment' do
	let!(:new_environment) { Environment.new(5,10) }

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

end
require 'spec_helper'
require_relative '../environment.rb'

describe 'Environment' do
	let!(:new_environment) { Environment.new(5,10) }

	context "when initialized" do 

		it "is a Cell object" do
			expect(new_environment).to be_an(Environment)
		end

		it "has height and width properties" do
			expect(new_environment.height).to eq(5)
			expect(new_environment.width).to eq(10)
		end
	end

end
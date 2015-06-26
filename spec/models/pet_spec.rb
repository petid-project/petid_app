require 'rails_helper'

RSpec.describe Pet, type: :model do
	it "should validate presence of name" do
		u = Pet.new({name: nil})
		expect(u.save).to eq(false) 
	end 
	it "should validate presence of user" do
		u = Pet.new({user: nil})
		expect(u.save).to eq(false) 
	end 
	it "should validate presence of type" do
		u = Pet.new({user: nil})
		expect(u.save).to eq(false) 
	end 
	
end 
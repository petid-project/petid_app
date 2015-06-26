require 'rails_helper'

RSpec.describe Report, type: :model do
	it "should validate presence of date_of_loss" do
		u = Report.new({date_of_loss: nil})
		expect(u.save).to eq(false) 
	end 
	it "should validate presence of user" do
		u = Report.new({user: nil})
		expect(u.save).to eq(false) 
	end 
	it "should validate presence of pet" do
		u = Report.new({pet: nil})
		expect(u.save).to eq(false) 
	end 
end 

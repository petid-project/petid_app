require 'rails_helper'

RSpec.describe User, type: :model do
	it "should validate presence of email" do
		u = User.new({name: "Bobert",
						 email: nil, 
						 password: "xxxxx",
						 phone: "510666666"})
		expect(u.save).to eq(false) 
	end  

	it "should validate uniqueness of email" do
		u = User.new({name: "Bobert",
						 email: "bob@bob.com", 
						 password: "blahblah",
						 phone: "5107822467"}).save
		t = User.new({name: "Bobert",
						 email: "bob@gmail.com", 
						 password: "xxxxx",
						 phone: "5103336666"})
		expect(t.save).to eq(false) 
	end 

	it "should validate presence of password" do
		u = User.new({name: "Bobert",
						 email: "bob@gmail.com", 
						 password: "", 
						 phone: "5105174332"})
		expect(u.save).to eq(false)
	end

	it "should expect password length to be > 8" do
		u = User.new({name: "Bobert",
						 email: "bob@gmail.com", 
						 password: "blah",
						 phone: "5104444444"})
		expect(u.save).to eq(false)
	end

end


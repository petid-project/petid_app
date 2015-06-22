require 'ffaker'

p "Starting seed..."

p "Destroying old data..."
#Destroy existing data
User.destroy_all
Pet.destroy_all
Report.destroy_all

p "Creating new users..."

(1..5).each do
	user_params = {}
	user_params[:email] = FFaker::Internet.email
	user_params[:name] = FFaker::Name.name
	user_params[:city] = FFaker::AddressUS.city
	user_params[:state] = FFaker::AddressUS.state_abbr
	user_params[:phone] = FFaker::PhoneNumber.phone_number
	user_params[:password] = "supersecure"
	user_params[:password_confirmation] = "supersecure"
	new_user = User.create(user_params)
	
	(1..5).each do
		pet_params = {}
		pet_params[:name] = FFaker::Name.first_name
		pet_params[:type] = "dog"
		pet_params[:breed] = "French bulldog"
		pet_params[:color] = FFaker::Color.name
		pet_params[:birth_year] = FFaker::Vehicle.year
		pet_params[:weight] = rand(1..30)
		pet_params[:user_id] = new_user.id
		pet_params[:chip_id] = new_user.id + 1
		pet_params[:description] = FFaker::BaconIpsum.sentences
		new_pet = Pet.create(pet_params)
	end
end

(1..3).each do
	report_params = {}
	report_params[:date_of_loss] = FFaker::Time.date
	report_params[:location] = FFaker::AddressUS.street_address, FFaker::AddressUS.city, FFaker::AddressUS.state_abbr
	report_params[:pet_id] = rand(1..5)
	pet = Pet.find(report_params[:pet_id])
	report_params[:user_id] = pet.user_id
	report_params[:description] = FFaker::Lorem.sentences
	report_params[:notes] = FFaker::Lorem.sentences
end 

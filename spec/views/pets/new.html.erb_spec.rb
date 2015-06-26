# require 'rails_helper'

# RSpec.describe "pets/new", :type => :view do
#   before(:each) do
#     assign(:pet, Pet.new(
#       :name => "MyString",
#       :type => "",
#       :breed => "MyString",
#       :color => "MyString",
#       :weight => "MyString",
#       :birth_year => "MyString",
#       :user => nil,
#       :chip_id => "MyString",
#       :description => "MyText",
#       :image_url => "MyString"
#     ))
#   end

#   it "renders new pet form" do
#     render

#     assert_select "form[action=?][method=?]", pets_path, "post" do

#       assert_select "input#pet_name[name=?]", "pet[name]"

#       assert_select "input#pet_type[name=?]", "pet[type]"

#       assert_select "input#pet_breed[name=?]", "pet[breed]"

#       assert_select "input#pet_color[name=?]", "pet[color]"

#       assert_select "input#pet_weight[name=?]", "pet[weight]"

#       assert_select "input#pet_birth_year[name=?]", "pet[birth_year]"

#       assert_select "input#pet_user_id[name=?]", "pet[user_id]"

#       assert_select "input#pet_chip_id[name=?]", "pet[chip_id]"

#       assert_select "textarea#pet_description[name=?]", "pet[description]"

#       assert_select "input#pet_image_url[name=?]", "pet[image_url]"
#     end
#   end
# end

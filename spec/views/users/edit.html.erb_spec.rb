# require 'rails_helper'

# RSpec.describe "users/edit", :type => :view do
#   before(:each) do
#     @user = assign(:user, User.create!(
#       :email => "MyString",
#       :uid => "MyString",
#       :provider => "MyString",
#       :password => "",
#       :name => "MyString",
#       :city => "MyString",
#       :state => "MyString",
#       :phone => "MyString",
#       :oauth_token => "MyString"
#     ))
#   end

#   it "renders the edit user form" do
#     render

#     assert_select "form[action=?][method=?]", user_path(@user), "post" do

#       assert_select "input#user_email[name=?]", "user[email]"

#       assert_select "input#user_uid[name=?]", "user[uid]"

#       assert_select "input#user_provider[name=?]", "user[provider]"

#       assert_select "input#user_password[name=?]", "user[password]"

#       assert_select "input#user_name[name=?]", "user[name]"

#       assert_select "input#user_city[name=?]", "user[city]"

#       assert_select "input#user_state[name=?]", "user[state]"

#       assert_select "input#user_phone[name=?]", "user[phone]"

#       assert_select "input#user_oauth_token[name=?]", "user[oauth_token]"
#     end
#   end
# end

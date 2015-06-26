# require 'rails_helper'

# RSpec.describe "reports/edit", :type => :view do
#   before(:each) do
#     @report = assign(:report, Report.create!(
#       :location => "MyString",
#       :user => nil,
#       :pet => nil,
#       :description => "MyText",
#       :notes => "MyText"
#     ))
#   end

#   it "renders the edit report form" do
#     render

#     assert_select "form[action=?][method=?]", report_path(@report), "post" do

#       assert_select "input#report_location[name=?]", "report[location]"

#       assert_select "input#report_user_id[name=?]", "report[user_id]"

#       assert_select "input#report_pet_id[name=?]", "report[pet_id]"

#       assert_select "textarea#report_description[name=?]", "report[description]"

#       assert_select "textarea#report_notes[name=?]", "report[notes]"
#     end
#   end
# end

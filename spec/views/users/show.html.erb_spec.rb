require 'rails_helper'

RSpec.describe "users/show", :type => :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :email => "Email",
      :uid => "Uid",
      :provider => "Provider",
      :password => "",
      :name => "Name",
      :city => "City",
      :state => "State",
      :phone => "Phone",
      :oauth_token => "Oauth Token"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Uid/)
    expect(rendered).to match(/Provider/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Oauth Token/)
  end
end

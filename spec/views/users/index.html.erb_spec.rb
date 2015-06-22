require 'rails_helper'

RSpec.describe "users/index", :type => :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :email => "Email",
        :uid => "Uid",
        :provider => "Provider",
        :password => "",
        :name => "Name",
        :city => "City",
        :state => "State",
        :phone => "Phone",
        :oauth_token => "Oauth Token"
      ),
      User.create!(
        :email => "Email",
        :uid => "Uid",
        :provider => "Provider",
        :password => "",
        :name => "Name",
        :city => "City",
        :state => "State",
        :phone => "Phone",
        :oauth_token => "Oauth Token"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Uid".to_s, :count => 2
    assert_select "tr>td", :text => "Provider".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Oauth Token".to_s, :count => 2
  end
end

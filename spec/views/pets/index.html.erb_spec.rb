require 'rails_helper'

RSpec.describe "pets/index", :type => :view do
  before(:each) do
    assign(:pets, [
      Pet.create!(
        :name => "Name",
        :type => "Type",
        :breed => "Breed",
        :color => "Color",
        :weight => "Weight",
        :birth_year => "Birth Year",
        :user => nil,
        :chip_id => "Chip",
        :description => "MyText",
        :image_url => "Image Url"
      ),
      Pet.create!(
        :name => "Name",
        :type => "Type",
        :breed => "Breed",
        :color => "Color",
        :weight => "Weight",
        :birth_year => "Birth Year",
        :user => nil,
        :chip_id => "Chip",
        :description => "MyText",
        :image_url => "Image Url"
      )
    ])
  end

  it "renders a list of pets" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => "Breed".to_s, :count => 2
    assert_select "tr>td", :text => "Color".to_s, :count => 2
    assert_select "tr>td", :text => "Weight".to_s, :count => 2
    assert_select "tr>td", :text => "Birth Year".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Chip".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Image Url".to_s, :count => 2
  end
end

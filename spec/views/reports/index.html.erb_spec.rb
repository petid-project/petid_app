require 'rails_helper'

RSpec.describe "reports/index", :type => :view do
  before(:each) do
    assign(:reports, [
      Report.create!(
        :location => "Location",
        :user => nil,
        :pet => nil,
        :description => "MyText",
        :notes => "MyText"
      ),
      Report.create!(
        :location => "Location",
        :user => nil,
        :pet => nil,
        :description => "MyText",
        :notes => "MyText"
      )
    ])
  end

  it "renders a list of reports" do
    render
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end

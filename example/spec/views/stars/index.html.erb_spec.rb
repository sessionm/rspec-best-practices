require 'rails_helper'

RSpec.describe "stars/index", type: :view do
  before(:each) do
    assign(:stars, [
      Star.create!(
        :proper_name => "Proper Name",
        :slug => "Slug",
        :composition => nil,
        :mass => "Mass",
        :type => "Type",
        :system => nil
      ),
      Star.create!(
        :proper_name => "Proper Name",
        :slug => "Slug",
        :composition => nil,
        :mass => "Mass",
        :type => "Type",
        :system => nil
      )
    ])
  end

  it "renders a list of stars" do
    render
    assert_select "tr>td", :text => "Proper Name".to_s, :count => 2
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Mass".to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end

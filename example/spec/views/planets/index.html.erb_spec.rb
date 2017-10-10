require 'rails_helper'

RSpec.describe "planets/index", type: :view do
  before(:each) do
    assign(:planets, [
      Planet.create!(
        :proper_name => "Proper Name",
        :slug => "Slug",
        :system => nil
      ),
      Planet.create!(
        :proper_name => "Proper Name",
        :slug => "Slug",
        :system => nil
      )
    ])
  end

  it "renders a list of planets" do
    render
    assert_select "tr>td", :text => "Proper Name".to_s, :count => 2
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end

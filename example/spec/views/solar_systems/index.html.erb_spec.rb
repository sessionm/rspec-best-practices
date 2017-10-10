require 'rails_helper'

RSpec.describe "solar_systems/index", type: :view do
  before(:each) do
    assign(:solar_systems, [
      SolarSystem.create!(
        :slug => "Slug",
        :formal_name => "Formal Name"
      ),
      SolarSystem.create!(
        :slug => "Slug",
        :formal_name => "Formal Name"
      )
    ])
  end

  it "renders a list of solar_systems" do
    render
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
    assert_select "tr>td", :text => "Formal Name".to_s, :count => 2
  end
end

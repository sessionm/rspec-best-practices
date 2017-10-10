require 'rails_helper'

RSpec.describe "solar_systems/edit", type: :view do
  before(:each) do
    @solar_system = assign(:solar_system, SolarSystem.create!(
      :slug => "MyString",
      :formal_name => "MyString"
    ))
  end

  it "renders the edit solar_system form" do
    render

    assert_select "form[action=?][method=?]", solar_system_path(@solar_system), "post" do

      assert_select "input[name=?]", "solar_system[slug]"

      assert_select "input[name=?]", "solar_system[formal_name]"
    end
  end
end

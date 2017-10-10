require 'rails_helper'

RSpec.describe "solar_systems/new", type: :view do
  before(:each) do
    assign(:solar_system, SolarSystem.new(
      :slug => "MyString",
      :formal_name => "MyString"
    ))
  end

  it "renders new solar_system form" do
    render

    assert_select "form[action=?][method=?]", solar_systems_path, "post" do

      assert_select "input[name=?]", "solar_system[slug]"

      assert_select "input[name=?]", "solar_system[formal_name]"
    end
  end
end

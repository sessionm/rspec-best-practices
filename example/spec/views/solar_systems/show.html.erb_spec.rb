require 'rails_helper'

RSpec.describe "solar_systems/show", type: :view do
  before(:each) do
    @solar_system = assign(:solar_system, SolarSystem.create!(
      :slug => "Slug",
      :formal_name => "Formal Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Slug/)
    expect(rendered).to match(/Formal Name/)
  end
end

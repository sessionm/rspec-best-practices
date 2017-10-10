require 'rails_helper'

RSpec.describe "planets/show", type: :view do
  before(:each) do
    @planet = assign(:planet, Planet.create!(
      :proper_name => "Proper Name",
      :slug => "Slug",
      :system => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Proper Name/)
    expect(rendered).to match(/Slug/)
    expect(rendered).to match(//)
  end
end

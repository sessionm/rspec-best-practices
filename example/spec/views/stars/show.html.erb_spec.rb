require 'rails_helper'

RSpec.describe "stars/show", type: :view do
  before(:each) do
    @star = assign(:star, Star.create!(
      :proper_name => "Proper Name",
      :slug => "Slug",
      :composition => nil,
      :mass => "Mass",
      :type => "Type",
      :system => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Proper Name/)
    expect(rendered).to match(/Slug/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Mass/)
    expect(rendered).to match(/Type/)
    expect(rendered).to match(//)
  end
end

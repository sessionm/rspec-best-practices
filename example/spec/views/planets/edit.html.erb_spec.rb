require 'rails_helper'

RSpec.describe "planets/edit", type: :view do
  before(:each) do
    @planet = assign(:planet, Planet.create!(
      :proper_name => "MyString",
      :slug => "MyString",
      :system => nil
    ))
  end

  it "renders the edit planet form" do
    render

    assert_select "form[action=?][method=?]", planet_path(@planet), "post" do

      assert_select "input[name=?]", "planet[proper_name]"

      assert_select "input[name=?]", "planet[slug]"

      assert_select "input[name=?]", "planet[system_id]"
    end
  end
end

require 'rails_helper'

RSpec.describe "planets/new", type: :view do
  before(:each) do
    assign(:planet, Planet.new(
      :proper_name => "MyString",
      :slug => "MyString",
      :system => nil
    ))
  end

  it "renders new planet form" do
    render

    assert_select "form[action=?][method=?]", planets_path, "post" do

      assert_select "input[name=?]", "planet[proper_name]"

      assert_select "input[name=?]", "planet[slug]"

      assert_select "input[name=?]", "planet[system_id]"
    end
  end
end

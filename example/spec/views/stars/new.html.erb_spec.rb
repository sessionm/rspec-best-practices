require 'rails_helper'

RSpec.describe "stars/new", type: :view do
  before(:each) do
    assign(:star, Star.new(
      :proper_name => "MyString",
      :slug => "MyString",
      :composition => nil,
      :mass => "MyString",
      :type => "",
      :system => nil
    ))
  end

  it "renders new star form" do
    render

    assert_select "form[action=?][method=?]", stars_path, "post" do

      assert_select "input[name=?]", "star[proper_name]"

      assert_select "input[name=?]", "star[slug]"

      assert_select "input[name=?]", "star[composition_id]"

      assert_select "input[name=?]", "star[mass]"

      assert_select "input[name=?]", "star[type]"

      assert_select "input[name=?]", "star[system_id]"
    end
  end
end

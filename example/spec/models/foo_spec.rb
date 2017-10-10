require 'rails_helper'

RSpec.describe Foo, type: :model do
  subject(:foo) { Foo }

  describe "get_full_name" do
    subject(:get_full_name) { foo.bar }

    it { is_expected.to eq "foobar" }
  end

end

require 'rails_helper'

RSpec.describe System, type: :model do
  subject(:system) {
    FactoryGirl.build(:system)
  }

  describe "#get_all_bodies" do
    pending
  end
end

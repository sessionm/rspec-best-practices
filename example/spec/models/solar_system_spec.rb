require 'rails_helper'

RSpec.describe SolarSystem, type: :model do
  let(:id) { Faker::Number.number(10) }
  subject(:solar_system) {
    FactoryGirl.build(:solar_system, id: id )
  }

  describe "#get_stars" do
    subject(:get_stars) { solar_system.get_stars }
    let(:stars_stub) { [double(Star)] }

    before do
      allow(Star).to receive(:where).and_return(stars_stub)
    end

    it "calls Star.where with the correct args" do
      expect(Star).to receive(:where).with(
        hash_including(system: solar_system.id))

      subject
    end

    it "returns an array of stars" do
      is_expected.to eq(stars_stub)
    end
  end

  describe "#get_planets" do
    subject(:get_planets) { solar_system.get_planets }
    let(:planet_stub) { [] }

    before do
      allow(Planet).to receive(:where).and_return(planet_stub)
    end

    it "calls Star.where with the correct args" do
      expect(Planet).to receive(:where).with(
        hash_including(system: solar_system.id)
      )

      subject
    end

    context "when Planet.where returns planets" do
      let(:planet_stub) { [double(Planet)] }

      it "returns a array of planets" do
        is_expected.to eq(planet_stub)
      end
    end
    context "when Planet.where retuns an empty array" do
      let(:planet_stub) { [] }

      it "returns an empty array" do
        is_expected.to eq(planet_stub)
      end
    end
  end

  describe "#has_planet?"  do
    subject(:has_planet) { solar_system.has_planet? }

    before do
      allow(Planet).to receive(:exists?)
    end

    it "calls Planet.exists? with the correct args" do
      expect(Planet).to receive(:exists?).with(
        hash_including(system: solar_system.id)
      )

      subject
    end

    context "when Planet.exists? is true" do
      before do
        allow(Planet).to receive(:exists?).and_return(true)
      end

      it "returns true" do
        is_expected.to eq(true)
      end
    end

    context "when Planet.exists? is false" do
      before do
        allow(Planet).to receive(:exists?).and_return(false)
      end

      it "returns false" do
        is_expected.to eq(false)
      end
    end
  end

  describe "#binary?" do
    subject(:binary?) { solar_system.binary? }

    before do
      allow(Star).to receive(:count)
    end

    it "calls Planet.count with the correct args" do
      expect(Star).to receive(:count).with(
        hash_including(system: solar_system.id))

      subject
    end

    context "when Star.count is 2" do
      before do
        allow(Star).to receive(:count).and_return(2)
      end

      it "returns true" do
        is_expected.to eq(true)
      end
    end

    context "when Star.count is not 2" do
      before do
        allow(Star).to receive(:count).and_return(1)
      end

      it "returns false" do
        is_expected.to eq(false)
      end
    end
  end

  describe "#trinary?" do
    subject(:trinary?) { solar_system.trinary? }

    before do
      allow(Star).to receive(:count)
    end

    it "calls Planet.count with the correct args" do
      expect(Star).to receive(:count).with(
        hash_including(system: solar_system.id))

      subject
    end

    context "when Star.count is 3" do
      before do
        allow(Star).to receive(:count).and_return(3)
      end

      it "returns true" do
        is_expected.to eq(true)
      end
    end

    context "when Star.count is not 2" do
      before do
        allow(Star).to receive(:count).and_return(2)
      end

      it "returns false" do
        is_expected.to eq(false)
      end
    end
  end

  describe "#get_composition" do
    subject(:get_composition) { solar_system.get_composition }
    let(:stars_composition) { [Faker::Lorem.word] }
    let(:planets_composition) { [Faker::Lorem.word] }

    before do
      allow(Star).to receive(:get_composition_for).and_return(stars_composition)
      allow(Planet).to receive(:get_composition_for).and_return(planets_composition)
    end

    it "calls Star.get_composition_for with the correct args" do
      expect(Star).to receive(:get_composition_for).with(
        hash_including(:system => solar_system))

      subject
    end
    it "calls Planet.get_composition_for with the correct args" do
      expect(Planet).to receive(:get_composition_for).with(
        hash_including(:system => solar_system))

      subject
    end
    it "returns the union of the star compositions and planet compositions" do
      union = planets_composition | stars_composition
      #TODO: Rewrite to be includes each element once
      union.each do |item|
        expect(subject).to include(item)
      end
    end
  end
end

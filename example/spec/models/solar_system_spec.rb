require 'rails_helper'

## Describe vs context
#
## Stubs vs Mocks
#
## FactoryGirl.build vs FactoryGirl.create
#
## Defining Subjects
#
# Consider "subjects" to be the test subject in an experiment. `subject` is an
# rspec keyword that references the top level describe object by default. In
# this case it is `SolarSystem`. One drawback here is that if we rely on this
# default assigment it makes it impossible for us to define a child subject and
# reference back to the original `SolarSystem` subject. A case where we would
# want to do this is when we test one of SolarSystem's methods, `get_stars` for
# instance. We'd want a `get_stars` subject to be defined in the corresponding
# `#get_stars` describe since it is the relevant # test subject, but wouldn't
# want to lose the reference to its parent subject. What we do to mitigate this
# issue is to use subject namespaces. We override the top level subject to
# include a namespace that we can reference in other subjects. It is also
# important to define a subject with namespece for each describe. It is also
# sometimes appropriate to define a subject for a context this gives us the most
# flexibility maintenance-wise and allows us to use RSpec's one line syntax
# wheere appropriate.
#
### One-line syntax
#
# Take advantage of RSpec's one liner syntax where possible. The one-line syntax
# depends on proper use of subjects. Simply put, `is_expected` aliases
# `expect(subject)`. RSpec automatically generates the english for the test,
# which has it's advantages and disadvantages. Advantages are that the
# documentation produced will always match what the test is testing for—it also
# reduces maintenance of having to updating test descriptions when a behavior of
# a test must change. One drawback however, is that the documentation
# automatically generated may not be intuitive or valueable. In this case it is
# still possible to use the `is_expected` alias within an `it` block which
# contains a description as demonstrated below.
#
# See: https://relishapp.com/rspec/rspec-core/docs/subject/one-liner-syntax
#
# Note that the RSpec one-line syntax does cover the work for matchers that
# require subject to be passed to expect as a block use. I have found, however,
# that you can still accomplish the same by writing, for example,
# ` it { expect { subject }.to change.from(false).to(true) }`
# which produces the english # documentation automatically.
#
#

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

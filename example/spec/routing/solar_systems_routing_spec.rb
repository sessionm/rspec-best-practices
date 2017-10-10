require "rails_helper"

RSpec.describe SolarSystemsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/solar_systems").to route_to("solar_systems#index")
    end

    it "routes to #new" do
      expect(:get => "/solar_systems/new").to route_to("solar_systems#new")
    end

    it "routes to #show" do
      expect(:get => "/solar_systems/1").to route_to("solar_systems#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/solar_systems/1/edit").to route_to("solar_systems#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/solar_systems").to route_to("solar_systems#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/solar_systems/1").to route_to("solar_systems#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/solar_systems/1").to route_to("solar_systems#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/solar_systems/1").to route_to("solar_systems#destroy", :id => "1")
    end

  end
end

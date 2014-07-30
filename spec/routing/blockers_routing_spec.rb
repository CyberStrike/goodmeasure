require "rails_helper"

RSpec.describe BlockersController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/blockers").to route_to("blockers#index")
    end

    it "routes to #new" do
      expect(:get => "/blockers/new").to route_to("blockers#new")
    end

    it "routes to #show" do
      expect(:get => "/blockers/1").to route_to("blockers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/blockers/1/edit").to route_to("blockers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/blockers").to route_to("blockers#create")
    end

    it "routes to #update" do
      expect(:put => "/blockers/1").to route_to("blockers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/blockers/1").to route_to("blockers#destroy", :id => "1")
    end

  end
end

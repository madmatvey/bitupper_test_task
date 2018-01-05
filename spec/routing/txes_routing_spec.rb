require "rails_helper"

RSpec.describe TxesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/txes").to route_to("txes#index")
    end

    it "routes to #new" do
      expect(:get => "/txes/new").to route_to("txes#new")
    end

    it "routes to #show" do
      expect(:get => "/txes/1").to route_to("txes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/txes/1/edit").to route_to("txes#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/txes").to route_to("txes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/txes/1").to route_to("txes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/txes/1").to route_to("txes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/txes/1").to route_to("txes#destroy", :id => "1")
    end

  end
end

require "spec_helper"

describe MessageeesController do
  describe "routing" do

    it "routes to #index" do
      get("/messageees").should route_to("messageees#index")
    end

    it "routes to #new" do
      get("/messageees/new").should route_to("messageees#new")
    end

    it "routes to #show" do
      get("/messageees/1").should route_to("messageees#show", :id => "1")
    end

    it "routes to #edit" do
      get("/messageees/1/edit").should route_to("messageees#edit", :id => "1")
    end

    it "routes to #create" do
      post("/messageees").should route_to("messageees#create")
    end

    it "routes to #update" do
      put("/messageees/1").should route_to("messageees#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/messageees/1").should route_to("messageees#destroy", :id => "1")
    end

  end
end

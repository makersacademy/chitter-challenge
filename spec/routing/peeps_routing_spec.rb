require "rails_helper"

RSpec.describe PeepsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/peeps").to route_to("peeps#index")
    end

    it "routes to #new" do
      expect(get: "/peeps/new").to route_to("peeps#new")
    end

    it "routes to #show" do
      expect(get: "/peeps/1").to route_to("peeps#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/peeps/1/edit").to route_to("peeps#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/peeps").to route_to("peeps#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/peeps/1").to route_to("peeps#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/peeps/1").to route_to("peeps#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/peeps/1").to route_to("peeps#destroy", id: "1")
    end
  end
end

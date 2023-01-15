require "spec_helper"
require "rack/test"
require_relative '../../app/controllers/application_controller'

describe ApplicationController do
  include Rack::Test::Methods

  let(:app) { ApplicationController.new }

  context "get /" do
    it "returns index view page" do
      response = get("/")

      expect(response.status).to eq(200)
      expect(response.body).to include("<h1>Welcome to Chitter!</h1>")
      expect(response.body).to include("<h3>Don't have an account?</h3>")
    end

    it "returns redirect_to_user_page view" do
      post("/sign_in", username: "abodian", password: "test")
      response = get("/")
    
      expect(response.status).to eq(200)
      expect(response.body).to include('<meta http-equiv="refresh" content="1; url = /user/abodian" />')
    end
  end
end

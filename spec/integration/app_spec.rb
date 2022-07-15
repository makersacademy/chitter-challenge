require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "GET to /check" do
    it "returns 200 OK only" do
      # Send a GET request to /
      # and returns a response object we can test.
      response = get("/check")

      # Assert the response status code and body.
      expect(response.status).to eq(200)
      expect(response.body).to include("This is test!")
    end
  end
end
require "spec_helper"
require "rack/test"
require_relative '../app'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }
  context "POST /message" do
    it "posts a message" do
      # Send a POST request to /submit
      # with some body parameters
      # and returns a response object we can test.
      response = post("/message", time: 2104, date: "11/04/2023", content: "words")

      # Assert the response status code and body.
      expect(response.status).to eq(200)
      expect(response.body).to eq('')
      response = get('/message')
      expect(response.body).to include('words')
    end
  end
  context "GET /message" do
    it "returns message" do
      # Send a GET request to /
      # and returns a response object we can test.
      response = get("/message")

      # Assert the response status code and body.
      expect(response.status).to eq(200)
      expect(response.body).to eq("Some response data")
    end
  end
end
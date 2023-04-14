require "spec_helper"
require "rack/test"
require_relative "../../app"

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
      response = post("/message", time: "21:04", date: "2023-04-11", content: "words")

      # Assert the response status code and body.
      expect(response.status).to eq(200)
      expect(response.body).to include("words")
    end
  end
  context "GET /message" do
    it "returns a message" do
      # Send a GET request to /
      # and returns a response object we can test.
      response = get("/message")

      # Assert the response status code and body.
      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Chitter</h1>')
      expect(response.body).to include("12:09:00")
      expect(response.body).to include("2023-04-13")
      expect(response.body).to include("Hello, world")
    end
  end
end
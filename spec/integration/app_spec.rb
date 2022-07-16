require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "GET to /" do
    it "returns 200 OK only" do
      # Send a GET request to /
      # and returns a response object we can test.
      response = get("/")

      # Assert the response status code and body.
      expect(response.status).to eq(200)
      expect(response.body).to include("Like twitter")
    end
  end

  context "GET/signup " do
    it "returns 200 OK and form data " do
      response = get("/signup")
      expect(response.status).to eq(200)
      expect(response.body).to include('<input type="text" name="username" />')
      expect(response.body).to include('<input type="text" name="password" />')
      expect(response.body).to include('<input type="submit" />')
    end
  end
  context "POST/signup " do
    it "validates a new user " do
      response = post("/signup", invalid_username: "", invalid_password: "123")
      expect(response.status).to eq(400)
    end
  end

  context "GET/login" do
    xit "" do
    end
  end
end

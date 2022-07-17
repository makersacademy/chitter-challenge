require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "GET to /" do
    it "returns 200 OK" do
      # Send a GET request to /
      # and returns a response object we can test.
      response = get("/")

      # Assert the response status code and body.
      expect(response.status).to eq(200)
      expect(response.body).to include("Like twitter")
    end

    it "contains the sign up link" do
      response = get("/")
      expect(response.body).to include('<a href = "/signup">Sign up here!</a>')
    end
    it "contains the write peep link" do
      response = get("/")
      expect(response.body).to include('<a href = "/peep">Write new peep!</a>')
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

  context "GET/peep" do
    it "returns 200 OK and the new peep form data" do
      response = get("/peep")
      expect(response.status).to eq(200)
      expect(response.body).to include('<input type="text" name="content" />')
    end 
  end
  
  context "GET/peepmade" do
    it "returns 200O OK and body" do
      response = get('/peepmade')
      expect(response.status).to eq (200)
      expect(response.body).to include("<div><head>Succesfully wrote a peep!</head></div>")
    end
  end

  # context "invalid signup" do
  #   it "returns 400 OK and message 'Username or password cannot be empty" do

  #   end
  end

end

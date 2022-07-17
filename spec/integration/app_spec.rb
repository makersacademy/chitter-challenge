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

  context "POST/signup invalid signup" do
    it "returns 400 OK and message 'Username or password cannot be empty' when empty username" do
      response = post("/signup", username: "", password:'1234')
      expect(response.status).to eq(400)
      expect(response.body).to include("Username or password cannot be empty")
    end

    it "returns 200 OK and posts succesfully when username and password are valid" do
      response = post("/signup", username: "John", password:'1234')
      expect(response.status).to eq(200)
      expect(response.body).to include("<div><head>Succesfully signed up!</head></div>")
    end

    it "returns Existing username, please choose another if Username exists" do
      existing_name_repo = post("/signup", username: "Mike", password:'1234')
      expect(existing_name_repo.status).to eq(200)
      repo = post("/signup", username: "Joe", password:'1234')
      expect(repo.body).to include ("Existing username, please choose another")
    end
  end

end

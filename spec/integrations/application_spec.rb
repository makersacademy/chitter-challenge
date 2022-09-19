require "spec_helper"
require "rack/test"
require_relative "../../app"
require "bcrypt"

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context "GET /" do
    it "returns home page with all peeps and sign in and signup links " do
      response = get("/")
      expect(response.status).to eq 200

      expect(response.body).to include(' <input type="submit" value="Join Chitter"/>')
      expect(response.body).to include('John\'s post')
      expect(response.body).to include(' <input type="submit" value="Sign in"/>')
    end
  end

  context "GET /sessions" do
    it "logs in and displays all peeps" do
      response = post("/sessions", email: "Bob@gmail.com", password: "test")

      response = get("/")
      expect(response.status).to eq 200
      expect(response.body).to include("Welcome, Bob123")
      expect(response.body).to include('John\'s post')
    end
    it "returns error message if login details are incorrect" do
      response = post("/sessions", email: "Bob@gmail.com", password: "test_00")
      expect(response.status).to eq 400
      expect(response.body).to eq "Incorrect!"
    end

    it "returns a login form" do
      response = get("/sessions/new")
      expect(response.status).to eq 200
      expect(response.body).to include '<form method="post" action="/sessions">'
    end
  end
  it "logs out" do
    response = post("/sessions", email: "Bob@gmail.com", password: "test")
    response = post("/logout")
    expect(response.status).to eq 200
    expect(response.body).to include(' <input type="submit" value="Sign in"/>')
  end

  context "POST /new_post" do
    it "creates a new peep" do
      user = post("/sessions", email: "Bob@gmail.com", password: "test")
      response = post("/new_post", post: "Another post")

      expect(response.status).to eq 302
      response = get("/")
      expect(response.status).to eq 200
      expect(response.body).to include("Another post")
    end
    it "returns an error if peep can not be created" do
      response = post("/new_post", posts: "Another post")
      expect(response.status).to eq 400
      expect(response.body).to include "failed to create a post!"
    end
  end

  context "POST /new_user" do
    it "creates a new user" do
      response = post("/new_user", email: "test@test.com", password_digest: BCrypt::Password.create("test"), first_name: "test", username: "test_user")
      expect(response.status).to eq 302
      expect(User.count).to eq 4
    end

    it "returns 400 and error message if user can not be created, in this case email already exists" do
      response = post("/new_user", email: "Bob@gmail.com", password_digest: "test", name: "test", username: "test_user")
      expect(response.status).to eq 400
      expect(response.body).to eq "failed to create a user!"
    end

    it "returns the registartion form" do
      response = get("/new_user")
      expect(response.status).to eq 200
      expect(response.body).to include '<form method="post" action="/new_user">'
      expect(response.body).to include '<input type="email" name="email"/>'
    end
  end
end

require "spec_helper"
require "rack/test"
require_relative "../../app"

describe Application do
  include Rack::Test::Methods
  let(:app) { Application.new }

  context "GET /" do
    it "returns homepage with 200" do
      response = get("/")
      expect(response.status).to eq 200
      expect(response.body).to include("<h1>Chitter</h1>")
    end

    it "returns list of tweets in reverse order with 200" do
      response = get("/")
      expect(response.status).to eq 200
      expect(response.body).to include("Time: 2023-01-12 07:29:56 UTC")
    end

    it "returns login and sign up forms" do
      response = get("/")
      expect(response.status).to eq 200
      expect(response.body).to include('<form action="/login" method="POST">')
      expect(response.body).to include('<input type="text" name="username" />')
      expect(response.body).to include('<input type="text" name="password" />')
    end

    it "returns view replies hyperlink" do
      response = get("/")
      expect(response.status).to eq 200
      expect(response.body).to include('<a href="/replies">View replies</a>')
    end
  end

  context "GET /account" do
    it "redirects to homepage when no session id" do
      response = get("/account")
      expect(response.status).to eq 302
    end

    it "if logged in sends to account page" do
    end
  end
  context "GET /sign-up" do
    it "returns sign up page forms with 200" do
      response = get("/sign-up")
      expect(response.status).to eq 200
      expect(response.body).to include ('<input type="text" name="first_name" />')
      expect(response.body).to include ('<input type="text" name="surname" />')
      expect(response.body).to include ('<input type="text" name="email" />')
      expect(response.body).to include ('<input type="text" name="username" />')
      expect(response.body).to include ('<input type="text" name="password" />')
    end
  end

  context "GET /replies" do
  end

  context "POST /reply" do
  end

  context "POST /sign-up" do
    it "sends sign up form" do
      response = post("/sign-up?first_name=testing&surname=testing&email=testing&username=testing&password=testing")
      expect(response.status).to eq 200
      expect(response.body).to include("<p>You're signed up to Chitter!</p>")
    end
  end

  context "POST /login" do
    it "logs in" do
      response = post("/login?username=testing&password=testing")
      expect(response.status).to eq 200
      expect(response.body).to include("<p>You're signed in to Chitter!</p>")
    end
  end

  context "POST /create-post" do
    xit "creates post" do
      t = post("/login?username=testing&password=testing")
      response = post("/create-post?content=testing")
      #expect(response.status).to eq 200
      #expect(response.body).to include("Username: orhankhan1 Chit: testing Time: 2023-01-13 06:29:38 UTC")
    end
  end

  context "POST /logout" do
    it "logs out returns to homepage" do
      response = post("/logout")
      expect(response.status).to eq 200
      expect(response.body).to include("<p>You're logged out!</p>")
    end
  end
end

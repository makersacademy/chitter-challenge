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
      expect(response.body).to include("Time: 2023-01-15 19:46:24 UTC")
    end

    it "returns login and sign up forms" do
      response = get("/")
      expect(response.status).to eq 200
      expect(response.body).to include('<form action="/login" method="POST">')
      expect(response.body).to include('<input type="text" name="username" />')
      expect(response.body).to include('<input type="password" name="password" />')
    end

    it "returns view replies hyperlink" do
      response = get("/")
      expect(response.status).to eq 200
      expect(response.body).to include('href="/replies/10&')
    end
  end

  context "GET /account" do
    it "redirects to homepage when no session id" do
      response = get("/account")
      expect(response.status).to eq 302
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
      expect(response.body).to include ('<input type="password" name="password" />')
    end
  end

  context "GET /replies" do
    it "returns list of replies for post 1" do
      response = get("/replies/10&chelsey_heathcote&Quantum%20cryptography%20does%20not%20work%20on%20Chuck%20Norris.%20When%20something%20is%20being%20observed%20by%20Chuck%20it%20stays%20in%20the%20same%20state%20until%20he's%20finished.&2023-01-15%2019:46:24%20UTC")
      expect(response.status).to eq 200
    end
  end

  context "POST /reply" do
    it "posts reply" do
      post("/login?username=testing&password=testing")
      response = post("/reply/10?content=testing2")
      expect(response.status).to eq 302
      test = get("/replies/10&chelsey_heathcote&Quantum%20cryptography%20does%20not%20work%20on%20Chuck%20Norris.%20When%20something%20is%20being%20observed%20by%20Chuck%20it%20stays%20in%20the%20same%20state%20until%20he's%20finished.&2023-01-15%2019:46:24%20UTC")
      expect(test.body).to include("testing2")
    end
  end

  context "POST /sign-up" do
    it "error if username or email already exists" do
      response = post("/sign-up?first_name=testing&surname=testing&email=testing&username=testing&password=testing")
      expect(response.status).to eq 200
      expect(response.body).to include("Email or username already exists")
    end

    it "returns error if all boxes aren't complete" do
      response = post("/sign-up?first_name=&surname=testing&email=testing&username=&password=testing")
      expect(response.status).to eq 200
      expect(response.inspect).to include "<h1>You have left one of the boxes empty</h1>"
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
    it "creates post" do
      post("/login?username=testing&password=testing")
      response = post("/create-post?user_id=6&content=orhan")
      test = get("/account")
      expect(test.status).to eq 302
      expect(test.inspect).to include("orhan")
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

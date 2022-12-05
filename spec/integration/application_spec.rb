require "spec_helper"
require "rack/test"
require_relative "../../app"

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  def reset_tables
    seed_sql = File.read("spec/seeds/chitter_seeds.sql")
    connection = PG.connect({ host: "127.0.0.1", dbname: "chitter_test" })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_tables
  end

  context "GET /" do
    it "returns a web page with a list of all peeps" do
      response = get("/")

      expect(response.status).to eq(200)
      expect(response.body).to include("<h1>Chitter</h1>")

      expect(response.body).to include("<div>@farmboy2 - 2022-11-11 21:00:00</div>")
      expect(response.body).to include("<div>Had a great dinner with my parents.</div>")
      expect(response.body).to include("<div>@dknight1 - 2022-11-03 17:30:00</div>")
      expect(response.body).to include("<div>I had a great day at the office!</div>")
    end
  end

  context "POST /login" do
    it "returns a logged in homepage with valid credentials" do
      post("/login", username: "dknight1", password: "123")
      response = get("/")
      expect(response.status).to eq(200)
      expect(response.body).to include("You are logged in as dknight1")
    end

    it "returns homepage with an error message when given invalid credentials" do
      post("/login", email: "bruce1@jlmail.com", password: "13")
      response = get("/")
      expect(response.status).to eq(200)
      expect(response.body).to include("Email or Password incorrect.")
    end
  end

  context "POST /logout" do
    it "returns a logged out version of homepage" do
      post("/logout")
      response = get("/")
      expect(response.status).to eq(200)
      expect(response.body).to include('Logged out successfully.')
    end
  end

  context "POST /create_peep" do
    it "creates a new peep" do
      post("/login", username: "dknight1", password: "123")
      post("/create_peep", content: "I bought the bank!")
      response = get("/")
      expect(response.status).to eq(200)
      expect(response.body).to include("I bought the bank!")
    end
  end

  context "GET /signup" do
    it "returns the sign up form web page" do
      response = get("/signup")

      expect(response.status).to eq(200)
      expect(response.body).to include('<form method="POST" action="/signup">')
    end
  end

  context "POST /signup" do
    it "returns a logged in homepage with a valid sign up" do
      post("/signup", name: "Hal Jordan", username: "speedster4", email: "hal4@jlmail.com", password: "123")
      response = get("/")
      expect(response.status).to eq(200)
      expect(response.body).to include("Sign up successful.")
    end

    it "returns the sign form page with error message when email exists" do
      post("/signup", name: "Hal Jordan", username: "speedster4", email: "bruce1@jlmail.com", password: "123")
      response = get("/signup")
      expect(response.status).to eq(200)
      expect(response.body).to include("Email already registered.")
    end

    it "returns the sign form page with error message when username exists" do
      post("/signup", name: "Hal Jordan", username: "farmboy2", email: "hal4@jlmail.com", password: "123")
      response = get("/signup")
      expect(response.status).to eq(200)
      expect(response.body).to include("Username already taken.")
    end

    it "returns the sign form with error message when and invalid username is given" do
      post("/signup", name: "Hal Jordan", username: "!£$%%^&", email: "hal4@jlmail.com", password: "123")
      response = get("/signup")
      expect(response.status).to eq(200)
      expect(response.body).to include("Invalid username, please use only numbers, letters and underscore.")
    end
  end
end

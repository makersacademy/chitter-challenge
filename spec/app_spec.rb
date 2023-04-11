require "spec_helper"
require "rack/test"
require_relative "../app"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  def reset_tables
    seed_sql = File.read('spec/seeds/chitter_seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_challenge_test' })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_tables
  end

  context "GET /" do
    it "displays a list of all peeps in reverse chronological order" do
      response = get("/")
      expect(response.status).to eq 200
      expect(response.body).to include 'Content: This is my first peep!'
      expect(response.body).to include 'Username: @mrbobby'
    end
  end

  context "GET /login" do
    it "displays the login page" do
      response = get("/login")
      expect(response.status).to eq 200
      expect(response.body).to include '<h1>Log in</h1>'
    end
  end

  context "POST /login" do
    it "logs in the user with their credentials" do # seeded users weren't created with bcrypt so don't pass this test
      response = post("/signup", name: 'Elton John', email: 'elton@john.com', username: 'rocketman', password: 'yellowbrickroad')
      expect(response.status).to eq 200
      expect(response.body).to include 'Sign up successful!'

      response = post("/login", email: 'elton@john.com', password: 'yellowbrickroad')
      expect(response.status).to eq 200
      expect(response.body).to include '<h1>Log in successful!</h1>' # add username to success page
    end

    it "tells the user they entered the wrong password" do
      response = post("/signup", name: 'Elton John', email: 'elton@john.com', username: 'rocketman', password: 'yellowbrickroad')
      expect(response.status).to eq 200
      expect(response.body).to include 'Sign up successful!'

      response = post("login", email: 'elton@john.com', password: 'stillstanding')
      expect(response.status).to eq 200
      expect(response.body).to include 'Wrong password.'
    end
  end

  context "GET /signup" do
    it "displays the signup page" do
      response = get("/signup")
      expect(response.status).to eq 200
      expect(response.body).to include '<form action="/signup" method="POST">'
    end
  end

  context "POST /signup" do
    it "creates a new user in the database" do
      response = post("/signup", name: 'Elton John', email: 'elton@john.com', username: 'rocketman', password: 'yellowbrickroad')
      expect(response.status).to eq 200
      expect(response.body).to include 'Sign up successful!' # add username to success page
    end
  end

end

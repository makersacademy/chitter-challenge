require "spec_helper"
require "rack/test"
require_relative "../../app"

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  def reset_users_table
    seed_sql = File.read("spec/seeds/seeds_users.sql")
    connection = PG.connect({ host: "127.0.0.1", dbname: "chitter_test" })
    connection.exec(seed_sql)
  end

  def reset_peeps_table
    seed_sql = File.read("spec/seeds/seeds_peeps.sql")
    connection = PG.connect({ host: "127.0.0.1", dbname: "chitter_test" })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_users_table
    reset_peeps_table
  end

  context "GET /" do
    it 'returns a list of peeps' do
      response = get("/")

      expect(response.status).to eq(200)
      expect(response.body).to include "<h1>Chitter</h1>"
      expect(response.body).to include "<h3>Latest peeps</h3>"
    end
  end

  context "GET /peeps/new" do
    it 'returns a form to create a new peep' do
      response = get("/peeps/new")

      expect(response.status).to eq(302)
    end
  end

  context "POST /peeps" do
    it "creates a new peep and returns 200 OK with success message" do
      response = post("/peeps", peep: "My new peep post", user_id: 1)
      expect(response.status).to eq 200
      expect(response.body).to include "<h3>Your new peep was posted!</h3>"
      expect(response.body).to include '<p><a href="/">View the latest peeps</a></p>'
    end
  end

  context "GET /signup" do
    it 'returns a sign up form' do
      response = get("/signup")

      expect(response.status).to eq(200)
      expect(response.body).to include "<h3>Sign up to Chitter!</h3>"
    end
  end

  context "POST /signup" do
    it "creates a new user and logs them in" do
      response = post("/signup", username: "Delboy123", name: "Delboy Trotter", email: "delboy123@gmail.com", password: "abc123abc123", confirm_password: "abc123abc123")
      expect(response.status).to eq 302
    end
  end

  context "GET /login" do
    it 'returns a login form' do
      response = get("/login")

      expect(response.status).to eq(200)
      expect(response.body).to include "<h3>Sign in</h3>"
    end
  end

  context "POST /login" do
    it "logs in the user and redirects to /" do
      response = post("/login", email: "joebloggs@gmail.com", password: "password")
      expect(response.status).to eq 302
    end
  end
end
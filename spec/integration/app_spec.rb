require "spec_helper"
require "rack/test"
require_relative "../../app"

def reset_users_table
  seed_sql = File.read("spec/seeds/users_seeds.sql")
  connection = PG.connect({ host: "127.0.0.1", dbname: "chitter_test" })
  connection.exec(seed_sql)
end

def reset_peeps_table
  seed_sql = File.read("spec/seeds/peeps_seeds.sql")
  connection = PG.connect({ host: "127.0.0.1", dbname: "chitter_test" })
  connection.exec(seed_sql)
end

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  before(:each) { reset_users_table }
  before(:each) { reset_peeps_table }

  context "GET /" do
    it "shows all the peeps" do
      response = get("/feed")
      expect(response.body).to include("Erykah Badu")
      expect(response.body).to include("BagLady")
      expect(response.body).to include("I pick my friends like I pick fruit")
      expect(response.body).to include("2023-01-08 04:05:06")
    end
  end

  describe "Creating a new user" do
    context "GET /sign_up" do
      it "should get the form to create a new user" do
        response = get("/sign_up")
        expect(response.status).to eq(200)
        expect(response.body).to include('<input type="text" name="name" autocomplete="off"/>')
        expect(response.body).to include('<input type="text" password="password" autocomplete="off"/>')
      end
    end

    context "POST /users" do
      it "creates new user" do
        response = post('/users', name: 'Solána Imani Rowe', username: 'sza', email: 'sza@gmail.com', password: 'killedmyex')
        expect(response.body).to include('<h1>Welcome to the chitter community!</h1>')
      end
    end
  end

  describe "Logging in to an account" do
    context "GET /login" do
      it "should get the form to login to account" do
        response = get("/login")
        expect(response.status).to eq(200)
        expect(response.body).to include('<input type="text" email="email" autocomplete="off"/>')
        expect(response.body).to include('<input type="password" password="password" autocomplete="off"/>')
      end
    end

    context "POST /home" do 
      it "logs in a user" do 
        response = post('/home', email: 'erykah@gmail.com', password: 'Baduizm99')
        expect(response.status).to eq(200)
        expect(response.body).to include('<h1>You are logged in!</h1>')
      end
    end
  end


  describe "Creating a new peep" do
    context "GET /" do
      xit "should get the form to add a new peep" do
        response = get("/")
        expect(response.status).to eq(200)
        expect(response.body).to include('<form method="POST" action="/peeps">')
        expect(response.body).to include(
          '<input type="text" name="user_id" placeholder="User id">',
        )
        expect(response.body).to include(
          '<input type="text" name="message" placeholder="Message">',
        )
      end
    end

    context "POST /" do
      xit "should add the new peep" do
        response = post('/peeps', message: 'hello', user_id: '1')
  
        expect(response.status).to eq(200)

      end
    end
  end
end

require_relative '../../app.rb'
require 'rack/test'

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  def reset_chitter_table
    seed_sql = File.read('spec/seeds.sql')
    connection = DatabaseConnection.connect
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_chitter_table()
  end

  describe "POST /signup" do
    context "with valid params" do
      it "creates a new user and redirects to home page" do
        post '/signup', username: 'John', email: 'john@gmail.com', password: 'testpassword'
        
        # last_response is a variable automatically created by Rack::MockResponse in the session
        # this expect checks if signup is indeed redirecting to the root '/'
        expect(last_response).to be_redirect

        # this command makes the last_response reflects the content in the redirected url,
        # which in this case would be the root '/'
        follow_redirect!
        expect(last_response.body).to include('Signup')
      end
    end
  end

  describe "POST /peeps" do
    context "when user is not logged in" do
      it "redirects to login page with error message" do
        post '/peeps', text: 'Test Peep'
        expect(last_response.body).to include('You need to be logged in to peep')
      end
    end

    context "when user is logged in" do
      it "creates a new peep" do
        user = User.create("John", "john@gmail.com", "testpassword")
        post '/login', email: user.email, password: user.password
        post '/peeps', text: 'Going out!'
        expect(last_response).to be_redirect
        follow_redirect!
        expect(last_request.path).to eq('/')
        expect(last_response.body).to include('Going out!')
      end
    end
  end

  describe "GET /login" do
    it "renders the login page" do
      get '/login'
      expect(last_response).to be_ok
      expect(last_response.body).to include('<h2>Login</h2>')
    end
  end

  describe "POST /login" do
    context "with valid credentials" do
      it "logs in the user and redirects to home page" do
        user = User.create("testuser", "testemail@example.com", "testpassword")
        post '/login', email: user.email, password: user.password
        expect(last_response).to be_redirect
        follow_redirect!
        expect(last_request.path).to eq('/')
        expect(last_response.body).to include('Logout')
      end
    end

    context "with invalid credentials" do
      it "returns an error message" do
        User.create("John", "john@gmail.com", "testpassword")
        post '/login', email: 'johnn@gmail.com', password: 'wrongpassword'
        expect(last_response).to be_ok
        expect(last_response.body).to include('Invalid email or password')
      end
    end
  end

  describe "POST /logout" do
    it "logs out the user and redirects to home page" do
      user = User.create("testuser", "testemail@example.com", "testpassword")
      post '/login', email: user.email, password: user.password
      post '/logout'
      expect(last_response).to be_redirect
      follow_redirect!
      expect(last_response.body).to include('Login')
    end
  end
end
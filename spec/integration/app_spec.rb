require "spec_helper"
require "rack/test"
require_relative '../../app'
  
describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context 'GET /' do
    it 'should get the homepage' do
      response = get('/')
      
      expect(response.status).to eq 200
      expect(response.body).to include "Welcome to Chitter"
      expect(response.body).to include "Sign Up"
      expect(response.body).to include "Log In"
      expect(response.body).to include "View Chitter Board"
    end
  end

  context 'GET /board' do
    it 'should get the chitter messaging board' do
      response = get('/board')
      
      expect(response.status).to eq 200
      expect(response.body).to include "message 1"
      expect(response.body).to include "2022-07-15 10:24:54"
      expect(response.body).to include "Return to Homepage"
    end
  end

  context 'GET /signup' do
    it 'should get the sign up page' do
      response = get('/signup')
      
      expect(response.status).to eq 200
      expect(response.body).to include "<h1>Join Chitter!</h1>"
    end
  end

  context 'POST /signup' do
    it 'should add new user and retutns confirmation page' do
      response = post("/signup", username: "user", email: "123@email.com")
      expect(response.status).to eq 200

      response = get('/signup_confirmation')
      expect(response.body).to include "please try logging in!"
    end

    it 'gets error page if username and email are already taken' do
      response = post("/signup", username: "username_1", email: "123@email.com")
      expect(response.status).to eq 200

      response = get('/signup_error')
      expect(response.body).to include "please try logging in!"
    end
  end

  context 'GET /login' do
    it 'gets the log in page' do
      response = get('/login')
      
      expect(response.status).to eq 200
      expect(response.body).to include "Please enter your login credentials"
    end
  end

  context 'POST /login' do
    it 'logs the user in if the attempt is successful' do
      response = post("/login", username: "username_1", password: "password123")
      expect(response.status).to eq 200
      expect(response.body).to include "<h2>The Most Recent Peeps:</h2>"
      expect(response.body).to include "Log out"
    end

    it 'takes user to error page uf the attempt fails' do
      response = post("/login", username: "hej", password: "123")
      expect(response.status).to eq 200
      expect(response.body).to include "<h2>Something went wrong!</h2>"
      expect(response.body).to include "Create an account"
    end
  end

  context 'GET /:username' do
    it "should display the user's account page" do
      response = get('/username_1')
      
      expect(response.status).to eq 200
      expect(response.body).to include "The Most Recent Peeps:"
    end
  end

  context 'POST /new_post' do
    it "adds now post to the Chitter Board" do
      response = post('/new_post', username: "username_1", message: "some fun message")
      
      expect(response.status).to eq 200
      expect(response.body).to include "some fun message"
    end
  end
end

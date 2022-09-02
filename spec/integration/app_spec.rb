require "spec_helper"
require "rack/test"
require_relative '../../app'
  
describe Application do
  include Rack::Test::Methods
  let(:app) { Application.new }

  context 'GET /' do
    it 'returns the homepage' do
      response = get('/')
      
      expect(response.status).to eq 200
      expect(response.body).to include "Welcome to Twitter"
      expect(response.body).to include "Sign up"
      expect(response.body).to include "Log in"
      expect(response.body).to include "View Tweets"
    end
  end

  context 'GET /tweets' do
    it 'shows all tweets' do
      response = get('/tweets')
      
      expect(response.status).to eq 200
      expect(response.body).to include "<h3>The man who passes the sentence should swing the sword.</h3>"
      expect(response.body).to include "<h4>2022-06-04 12:00:00</h4>"
      expect(response.body).to include "Log in"
    end
  end

  context 'GET /signup' do
    it 'shows the sign up page' do
      response = get('/signup')
      
      expect(response.status).to eq 200
      expect(response.body).to include "<title>Signup</title>"
    end
  end

  context 'POST /signup' do
    it 'shows signup successful page' do
      response = post("/signup", name: "wayne", username: "wayne", email: "wayne@email.com", password: 'wayne123' )
      expect(response.status).to eq 200
      expect(response.body).to include('<h1>Thank you for joining Twitter!</h1>')
    end

    it 'fails if email already exists' do
      response = post("/signup", name: "house", username: "house", email: "joeez@gmail.com", password: 'wayne123')
      expect(response.status).to eq 200
      expect(response.body).to include("<h3>The email you have entered already exists</h3>")
    end

    it 'fails if username already exists' do
      response = post("/signup", name: "house", username: "moeez", email: "house@gmail.com", password: 'wayne123')
      expect(response.status).to eq 200
      expect(response.body).to include("<h3>The username you have entered already exists</h3>")
    end
  end

  context 'GET /login' do
    it 'gets the log in page' do
      response = get('/login')
      
      expect(response.status).to eq 200
      expect(response.body).to include("<h3>Please enter your login details: </h3>")
    end
  end

  context 'POST /login' do
    it 'logs the user in when details match' do
      response = post("/login", username: "foeez", password: "wicked123")
      # p response.body
      expect(response.status).to eq 200
      expect(response.body).to include "@foeez"
      expect(response.body).to include('<a href="/">Log out</a>')
    end

    it 'fails if details dont match' do
      response = post("/login", username: "fade", password: "fade123")
      expect(response.status).to eq 200
      expect(response.body).to include "<h1>Something went wrong!</h1>"
      expect(response.body).to include "Create an account"
    end
  end

  context 'POST /tweet' do
    it "adds a new tweet to list of tweets" do
      response = post('/tweet', user_id: "1", message: "what's up guys?", tag: 'joeez')
      
      expect(response.status).to eq 200
      expect(response.body).to include("what's up guys?")
    end
  end
end
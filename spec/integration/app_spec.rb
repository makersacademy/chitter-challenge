require 'spec_helper'
require 'user_repository'
require 'peep_repository'
require 'rack/test'
require 'database_connection'
require_relative '../../app'

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "GET /home and user hasn't logged in" do
    it "returns homepage with posts" do
      response = get('/home')
      expect(response.status).to eq(200)
      expect(response.body).to include('<h1> Chitter </h1>')
      expect(response.body).to include('I am also the second post')
    end
  end

  context "POST /users" do
    it "adds new user details to db" do
      response = post('/users', username: 'Eduardo', password: 'secure', email: 'eduardo@makers.com')
      # expect(response.status).to eq(200)
      repo = UserRepository.new
      users = repo.all
      expect(users).to include(
        have_attributes(
          username: "Eduardo",
          password: "secure",
          email: "eduardo@makers.com"
        )
      )
    end
  end

  context "GET /signup" do
    it "displays the signup page" do
      response = get('/signup')
      expect(response.status).to eq(200)
      expect(response.body).to include('action="/users" method="POST"')
      expect(response.body).to include('<input type="submit" value="Create account">')
    end
  end

  context "GET /login" do
    it "displays the login page" do
      response = get('/login')
      expect(response.status).to eq(200)
      expect(response.body).to include('<form action="/login" method="POST">')
      expect(response.body).to include('<input type="submit" value="Login">')
    end
  end

  context "POST /login and user enters incorrect details" do
    it "Rejects login with error message" do
      response = post('/login', username: 'Gilberto', password: '987')
        expect(response.body). to include('Username or password is incorrect, please try again.')
    end
  end

  context "POST /login and user enters correct details" do
    it "Redirects user to home page and allows post" do
      response = post('/login', username: 'Edward', password: '12345')
        follow_redirect!
        expect(last_response.body).to include('Write a peep')
        expect(last_response.body).to include('<form action="/peep" method="POST">')
        expect(last_response.body).to include('<label for="message">Write your message</label>')
        expect(last_response.body).to include('<form action="/logout" method="POST">')
    end
  end

  context "POST /logout" do 
    it "resets session and refreshes homepage" do
      post('/logout')
      follow_redirect!
      expect(last_response.body).not_to include('<label for="message">Write your message</label>')
      expect(last_response.body).not_to include('<form action="/logout" method="POST">')
      expect(last_response.body).to include('<h1> Chitter </h1>')
    end
  end
end

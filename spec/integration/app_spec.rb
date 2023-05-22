require 'spec_helper'
require 'rack/test'
require_relative '../../app'

describe Chitter do
  include Rack::Test::Methods

  let(:app) { Chitter.new }

  # Homepage tests

  context 'GET /' do
    it 'should return the list of tweets in reverse chronological order' do
      response = get('/')

      expect(response.status).to eq(200)
      expect(response.body).to include('<p><h1 id="roundedcorners"> Welcome to Chitter!</h1></p>')
      expect(response.body).to include('<b>Alice Wood </b> (alice1) says...<br>')
      expect(response.body).to include('I am peeping too! How cool')
    end
  end

  # Add peep tests

  context 'GET /add_peep' do
    it 'shows a form to be completed to add a tweet to the homepage' do
      response = get('/add_peep')

      expect(response.status).to eq(200)
      expect(response.body).to include("<h2>What's your peep?</h2>")
      expect(response.body).to include('<form method="POST" action="/add_peep">')
    end
  end

  context 'POST /add_peep' do
    it 'should add a post to the database and return to homepage' do
      response = post('/add_peep')

      expect(response.status).to eq(200)
      expect(response.body).to include('<h2>Nice one, your peep has been posted!</h2>')
    end
  end

  # Sign up tests

  context 'GET /sign_up' do
    it 'shows you the sign up form' do
      response = get('/sign_up')

      expect(response.status).to eq(200)
      expect(response.body).to include("<h2>Please enter your details below</h2>")
      expect(response.body).to include('<input type="text" name="username" placeholder="JBloggs"/>')
    end
  end

  context 'POST /sign_up' do
    it 'adds the account details to the database and redirects to confirmation page' do
      response = post('/sign_up', 
        name: 'Leo Hetsch', 
        email_address: 'leo@example.com', 
        username: 'leo1', 
        password: 'test')

      expect(response.status).to eq(200)
      expect(response.body).to include("<h1>Welcome, your Chitter account has been created!</h1>")
    end

    it 'fails if the username and/or email are already in use' do
      response = post('/sign_up', 
        name: 'Alice Wood', 
        email_address: 'alice@example.com', 
        username: 'alice1', 
        password: 'test')

      expect(response.status).to eq(400)
      expect(response.body).to include("This username and/or email address is already in use, please try again!")
    end
  end
 
  #  Log in tests

  context 'GET /login' do
    it 'displays the empty log in form' do
      response = get('/login')

      expect(response.status).to eq(200)
      expect(response.body).to include('<h2>Please enter your login details</h2>')
      expect(response.body).to include('<input type="text" name="email_address" placeholder="joebloggs@example.com"/>')
    end
  end

  context 'POST /login' do
    it 'checks the login details against the database and successfully logs in' do
      response = post('/login', 
        name: 'Alice Wood', 
        email_address: 'alice@example.com', 
        username: 'alice1', 
        password: 'test123')

      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Welcome back!</h1>')
      expect(response.body).to include('<h2>Click below to see the latest peeps</h2>')
    end

    it 'checks the incorrect details against the database and gives login fail message' do
      response = post('/login', 
        name: 'Alice Wood', 
        email_address: 'incorrect@example.com', 
        username: 'alice1', 
        password: 'test123')

      expect(response.status).to eq(400)
      expect(response.body).to include('<h1>Sorry! Your details did not match, please click below to try again</h1>')
    end

    it 'returns the log in fail for incorrect passwords' do
      response = post('/login', 
        name: 'Alice Wood', 
        email_address: 'alice@example.com', 
        username: 'alice1', 
        password: 'incorrect')

      expect(response.status).to eq(400)
      expect(response.body).to include('<h1>Sorry! Your details did not match, please click below to try again</h1>')
    end
  end

#  Log out tests

  context 'POST /log_out' do
    it ' logs the user out and deletes the session info' do
      response = post('/log_out') 

      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>See ya! You have been logged out</h1>')
    end
  end
end

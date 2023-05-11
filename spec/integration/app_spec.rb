require 'spec_helper'
require 'rack/test'
require_relative '../../app'

describe Chitter do
  include Rack::Test::Methods

  let(:app) { Chitter.new }

  context 'GET /' do
    it 'should return the list of tweets in reverse chronological order' do
      response = get('/')

      expect(response.status).to eq(200)
      expect(response.body).to include('<p><h1 id="roundedcorners"> Welcome to Chitter!</h1></p>')
      expect(response.body).to include('<b>Alice Wood </b> (alice1) says...<br>')
      expect(response.body).to include('I am peeping too! How cool')
    end
  end

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

  context 'GET /sign_up' do
    it 'shows you the sign up form' do
      response = get('/sign_up')

      expect(response.status).to eq(200)
      expect(response.body).to include("<h2>Please enter your details below</h2>")
      expect(response.body).to include('<input type="text" name="name" placeholder="Joe Bloggs"/><br>')
    end
  end

  context 'POST /sign_up' do
    it 'adds the account details to the database and redirects to confirmation page' do
      response = post('/sign_up', name: 'Leo Hetsch', email_address: 'leo@example.com', username: 'leo1', password: 'test')

      expect(response.status).to eq(200)
      expect(response.body).to include("<h1>Welcome, your Chitter account has been created!</h1>")
    end

    it 'fails if the username and/or email are already in use' do
      response = post('/sign_up', name: 'Alice Wood', email_address: 'alice@example.com', username: 'alice1', password: 'test')

      expect(response.status).to eq(400)
      expect(response.body).to include("This username and/or email address are already in use, please try again!")
    end
  end
end

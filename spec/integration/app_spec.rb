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
      expect(response.body).to include('<h1>Welcome to Chitter!</h1>')
      expect(response.body).to include('<b>Alice Wood </b> (alice1) says... <br>')
      expect(response.body).to include('hello, this is the third peep!')
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
      expect(response.body).to include('Your peep has been posted!')
    end
  end

  context 'GET /sign_up' do
    it 'shows you the sign up form' do
      response = get('/sign_up')

      expect(response.status).to eq(200)
      expect(response.body).to include("input type='text' name='username'/><br>")
      expect(response.body).to include("<h2>Please enter your details below!</h2>")
    end
  end
end

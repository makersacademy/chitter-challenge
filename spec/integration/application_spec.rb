require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do

  before(:each) do 
    reset_all_tables
  end

  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context 'GET /' do
    it 'Lists all peeps in reverse chronological order' do
      response = get('/')

      expect(response.status).to eq(200)
      expect(response.body).to include('This is better than twitter')
      expect(response.body).to include('My very first peep!')
      expect(response.body).to include('<a href="/signup">')
    end
  end

  context 'GET /peeps/new' do
    it 'Displays form to post a new peep' do
      response = get('/peeps/new')

      expect(response.status).to eq(200)
      expect(response.body).to include('<form method="POST" action="/peeps">')
      expect(response.body).to include('<input type="text" name="content" ')
    end
  end

  context 'POST /peeps' do
    it 'Posts a new peep' do
      response = post('/peeps', content: 'Testing new peep')

      expect(response.status).to eq(200)
      expect(response.body).to include('Peep successfully posted!')
      expect(response.body).to include('<a href="/">')

      get = get('/')
      expect(get.body).to include('Testing new peep')
    end
  end

  context 'GET /signup' do
    it 'Displays sign up form' do
      response = get('/signup')

      expect(response.status).to eq(200)
      expect(response.body).to include('<form method="POST" action="/signup">')
      expect(response.body).to include('<input type="email" name="email" ')
      expect(response.body).to include('<input type="password" name="password" ')
      expect(response.body).to include('<input type="text" name="name" ')
      expect(response.body).to include('<input type="text" name="username" ')
    end
  end

  context 'POST /signup' do
    it 'Successfully creates a new unique account' do
      response = post('/signup', name: 'Toad', username: 'mushroomtoad', email: 'toad@makersacademy.com', password: 'mushroom123')

      expect(response.status).to eq(200)
      expect(response.body).to include('Chitter account successfully created!')
      expect(response.body).to include('<a href="/">')
    end

    it 'Fails if email or username already exists' do
      response = post('signup', name: 'Diddy Kong', username: 'dkong', email: 'dkong@makersacademy.com', password: 'PROBLEM')

      expect(response.status).to eq(400)
      expect(response.body).to include('Error: email or username already exists. Please go back and try again')
    end
  end

  context 'GET /peeps/:id' do
    it 'Opens a specific peep' do
      
    end
  end

end

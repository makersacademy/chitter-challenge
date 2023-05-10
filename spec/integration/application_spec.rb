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
      response = post('/peeps')

      expect(response.status).to eq(200)
      expect(response.body).to include('Peep successfully posted!')
      expect(response.body).to include('<a href="/">')
    end
  end

  context 'GET /signup' do
    xit 'Displays sign up form' do
      response = get('/signup')

      expect(response.status).to eq(200)
      expect(response.body).to include('<form method="POST" action="/signup">')
      expect(response.body).to include('<input type="text" name="email" ')
      expect(response.body).to include('<input type="text" name="password" ')
    end
  end

end

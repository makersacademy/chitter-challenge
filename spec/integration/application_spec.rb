require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Applcation
  # class so our tests work.
  let(:app) { Application.new }

  context 'GET /' do
    it 'should return the homepage with all posts' do 
      response = get('/')

      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Welcome to Chitter!</h1>')
      expect(response.body).to include('<h2>List of Peeps</h2>')
      expect(response.body).to include('Peep 1: If you want to know what a man’s like, take a good look at how he treats his inferiors, not his equals.')
    end
  end

  context 'GET /new_post' do
    it 'should return the form for user to add a post' do 
      response = get('/new_post')

      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Create a Peep</h1>')
      expect(response.body).to include('Message:')
    end
  end

  context "POST /new_post" do
    it 'should validate new post parameters' do
      response = post('/new_post', message: '')

      expect(response.status).to eq (400)
    end
  end

  context 'GET /signup' do
    it 'should return the form for user to sign up' do 
      response = get('/signup')

      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Join Chitter</h1>')
      expect(response.body).to include('Name:')
      expect(response.body).to include('Username:')
      expect(response.body).to include('Email Address:')
    end
  end

  context "POST /signup" do
    it 'should validate signup form parameters' do
      response = post('/new_post', name: '', username: '', email_address: '', password: '')

      expect(response.status).to eq (400)
    end
  end
end

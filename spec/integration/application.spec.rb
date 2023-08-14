require "spec_helper"
require "rack/test"
require_relative '../../app'
require 'reset_tables'
require 'user'
require 'post'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }
  before(:each) do
    reset = ResetTables.new
    reset.reset_posts_table
    reset.reset_users_table
  end

  context 'Get /' do
    it 'returns HTML page' do
      response = get('/')
      expect(response.status).to eq(200)
      expect(response.body).to include('Chitter')
    end
  end
  context 'Get /signup' do
    it 'returns signup page' do
      response = get('/signup')
      expect(response.status).to eq(200)
      expect(response.body).to include('username')
    end
  end
  context 'Get /sucess' do
    it 'returns successpage' do
      response = get('/success')
      expect(response.status).to eq(200)
      expect(response.body).to include('Success')
    end
  end
  context 'Post /account_page' do
    it 'adds peep to chitter' do
      post '/login', username: 'test_user', password: 'password' # Login the user and set the session
  
      post '/account_page', { message: 'Need to start working' }, 'rack.session' => { user_id: 2 }
  
      follow_redirect! # Follow the redirect to the new page
      expect(last_request.path).to eq('/account_page') # Ensure we are on the expected page
      expect(last_response.body).to include('Need to start working') # Check the content of the page
  
      expect(last_response.status).to eq(200) # Optionally check the status code
    end
  end
  
  context 'Post /signup' do
    it 'recognises that a username already exists, redirects to the signup page' do
      user = User.new
      response = post('/signup', { name: 'Need to start working', username: 'laurenhannis', email: 'jdjdhjsjksd', password: 'jdsjdnsjs' })
      User.create_user('Lauren Hannis', 'laurenhannis', 'jdjdhjsjksd', 'jdsjdnsjs')
  
      expect(response.status).to eq(302) # Assuming it redirects
      expect(response.headers['Location']).to include('/signup')
    end
  end
  context 'Post /login' do
    it 'logs into user account' do
      response = post('/login', { username: 'laurenhannis', password: 'passwordlauren' })
      User.sign_in('laurenhannis', 'passwordlauren')
  
      expect(response.status).to eq(302) # Assuming it redirects
      expect(response.headers['Location']).to include('/account_page')
    end
  end
  context 'GET /logout'
  it 'clears the session and redirects to the home page' do
    post '/login', { username: 'testuser', password: 'password' }

    get '/logout'
    
    expect(last_response.redirect?).to be true
    follow_redirect!

    expect(last_request.path).to eq('/')
    expect(rack_mock_session.cookie_jar['rack.session']).not_to include('user_id')
  end
end
  
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
  context 'Post /' do
    it 'adds peep to chitter' do
      response = post('/', message: 'Need to start working', user_id: 2)
      Post.create_post(Time.now, 'Need to start working', 2)

      expect(response.status).to eq(302)
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
end
  
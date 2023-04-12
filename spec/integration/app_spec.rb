require_relative '../../app'
require "spec_helper"
require "rack/test"

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  describe 'GET /signup' do
    it 'returns the signup page' do
      response = get('/signup')
      expect(response.status).to eq 200
      expect(response.body).to include '<input type="username" id="username" name="username" required>'
    end
  end
  describe 'POST /signup' do
      it 'creates a new user' do
        response = post(
          '/signup',
          username: 'user1',
          email: 'user1@gmail.com',
          password: '12345678'
        )
      expect(response.status).to eq(302) # 302 automatically redirects to another URL
      expect(UserRepository.new.find_by_email('user1@gmail.com').username).to eq 'user1'
    end
  end
  
  
end
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
    context 'when given valid user data' do
      it 'creates a new user' do
        response = post(
          'post/signup',
          username: 'user1',
          email: 'user1@gmail.com',
          password: '12345678'
        )
      expect(response.status).to eq(200)
      expect(response.body).to change { UserRepository.new.count }.by(1)
      end
    end
  end
  
  
end
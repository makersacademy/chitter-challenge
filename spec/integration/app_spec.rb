require "spec_helper"
require "rack/test"
require_relative '../../app'


describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context 'GET /' do
    it 'returns 200 OK and a form to sign in' do
      response = get('/')
      expect(response.status).to eq(200)
      expect(response.body).to include("<h1>Welcome to Chitter</h1>")
      expect(response.body).to include('<form action="/signup" method="POST">')
    end
  end

  context 'POST /signup' do
    it 'create a new user' do
      response = post('/signup')
      expect(response.status).to eq(200)
      expect(response.body).to include("Thank you for sign up!")
      repo = UserRepository.new
      all_users = repo.all
      expect(all_users.length).to eq 5
    end
  end
end
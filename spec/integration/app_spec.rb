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
    it 'should get the homepage' do
      response = get('/')
      
      expect(response.status).to eq 200
      expect(response.body).to include "Welcome to Chitter"
      expect(response.body).to include "Sign Up"
      expect(response.body).to include "Log In"
      expect(response.body).to include "View Chitter Board"
    end
  end

  context 'GET /board' do
    it 'should get the chitter messaging board' do
      response = get('/board')
      
      expect(response.status).to eq 200
      expect(response.body).to include "message 1"
      expect(response.body).to include "2022-07-15 10:24:54"
    end
  end
end

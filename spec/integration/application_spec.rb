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
    it 'should return the homepage with all posts' do 
      response = get('/')

      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Welcome to Chitter!</h1>')
      expect(response.body).to include('<h2>List of Peeps</h2>')
      expect(response.body).to include('Peep 1: If you want to know what a man’s like, take a good look at how he treats his inferiors, not his equals.')
    end
  end
end

require 'message_repository'
require 'rack/test'
require_relative '../../app'

describe Application do
  include Rack::Test::Methods
  let(:app) { Application.new }

  context 'GET /' do
    it 'returns 200 OK and displays timeline in reverse chronological order' do
      response = get('/')
      expect(response.status).to eq(200)
      # expect(response.body).to include("'dfdf")
      

    end
  end
end 
require 'spec_helper'
require 'rack/test'
require_relative '../../app'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context 'GET to /feed' do
    it 'returns a list of peeps as HTML' do
      response = get('/feed')
      expect(response.status).to eq 200

      expect(response.body).to include 'First peep on chitter!'
      expect(response.body).to include 'How do I use this thing?'
      expect(response.body).to include 'Here we go!'
    end
  end
end

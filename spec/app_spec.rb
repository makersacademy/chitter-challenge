require "spec_helper"
require "rack/test"
require './app'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context 'GET /peeps' do
    it "returns all the peeps" do
      response = get('/peeps')
      expect(response.status).to eq(200)
      expect(response.body).to include('ID: 1')
    end
  end

  context "POST /peeps" do
    it 'creates new peep' do
      response = post('/peeps',
        content: 'Lets go to shreaking shack',
        user_id: '3'
      )
      expect(response.status).to eq(200)
    end
  end
end

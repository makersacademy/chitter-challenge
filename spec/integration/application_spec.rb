require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context "GET /" do
    it "Lists all peeps in reverse chronological order" do
      response = get("/")

      expect(response.status).to eq(200)
      expect(response.body).to include('This is better than twitter')
      expect(response.body).to include('My very first peep!')
    end
  end

end
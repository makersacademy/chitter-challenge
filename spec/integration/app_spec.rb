require "spec_helper"
require "rack/test"
require_relative "../../app"


RSpec.describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context "GET /" do
    it 'returns an html view of the homepage' do
      response = get("/")

      expect(response.status).to eq 200

      expect(response.body).to include "<a href=\"/signup\"> Sign up </a>"
      expect(response.body).to include "<a href=\"/login\"> Log in </a>"
      # tests for peeps display (to be written)
      # expect(response.body).to include 
      # expect(response.body).to include 
    end
  end
end
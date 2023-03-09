require_relative "../spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context "GET /" do
    it "Displays list of peeps" do
      response = get('/')
      expect(response.status).to eq(200)
      expect(response.body).to include("<h1>Welcome to Chitter</h1>")
      expect(response.body).to include("<a href=\"/peeps/1\">A good day</a><br />\n")
      expect(response.body).to include("<a href=\"/peeps/2\">A bad day</a><br />\n")
      expect(response.body).to include("<a href=\"/peeps/3\">An ok day</a><br />\n")
    end
  end
end
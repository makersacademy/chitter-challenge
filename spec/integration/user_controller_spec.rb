# require "spec_helper"
# require "rack/test"
# require_relative '../../app'

# describe Application do
#   # This is so we can use rack-test helper methods.
#   include Rack::Test::Methods

#   # We need to declare the `app` value by instantiating the Application
#   # class so our tests work.
#   let(:app) { Application.new }

#   context "GET to /" do
#     it "returns 200 OK with the right content" do
#       # Send a GET request to /
#       # and returns a response object we can test.
#       response = get("/")

#       # Assert the response status code and body.
#       expect(response.status).to eq(200)
#       expect(response.body).to eq("Some response data")
#     end
#   end
# end
# file: spec/integration/application_spec.rb

require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context "GET to /" do
    it "returns 200 OK with the right content" do
      # Send a GET request to /
      # and returns a response object we can test.
      response = get("/")

      # Assert the response status code and body.
      expect(response.status).to eq(200)
      expect(response.body).to include("<h1>Welcome to Chitter!</h1>")
    end
  end

  context "GET /peeps/new" do
    it 'should return thet html form to create a new task' do
      response = get ('/peeps/new')

      expect(response.status).to eq(200)
      expect(response.body).to include('<form method="POST" action="/peeps">')
      expect(response.body).to include('<input type="text" name="title" />')
    end
  end

  context "POST to /peeps" do
    it 'should create a peep and return confirmation page' do
      # Send a POST request to /submit
      # with some body parameters
      # and returns a response object we can test.
      response = post('/peeps', title: 'Hello World!', content: 'This is my first Peep!')

      # Assert the response status code and body.
      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Your Peep has been posted! Title: Hello World! Content: This is my first Peep!</h1>')
    end

    it 'should create a peep and return confirmation page' do
      # Send a POST request to /submit
      # with some body parameters
      # and returns a response object we can test.
      response = post('/peeps', title: 'Hello Again!', content: 'This is my second Peep!')

      # Assert the response status code and body.
      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Your Peep has been posted! Title: Hello Again! Content: This is my second Peep!</h1>')
    end
  end
end
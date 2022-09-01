require "spec_helper"
require "rack/test"
require_relative "../../app"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "GET /" do
    it 'returns 200 OK' do
      response = get('/')

      expect(response.status).to eq(200)
      expect(response.body).to include '<h1>Welcome to Chitter!</h1>'
    end
  end

  context "GET /signup" do
    it 'returns the signup page' do
      response = get('/signup')

      expect(response.status).to eq 200
      expect(response.body).to include '<input type="submit" value="Sign up!">'
      expect(response.body).to include '<form action="/signup" method="POST"><br>'
    end
  end

  context "POST /signup" do
    it 'returns a success page' do
      response = post(
        '/signup',
        username: 'testuser453',
        name: 'Test User',
        email: 'test@user.com',
        password: 'test1!_-43'
      )

      expect(response.status).to eq 200
      expect(response.body).to include ('Congratulations on your successful account creation, welcome to Chitter!')
    end
    it 'responds with 400 status if username is blank' do
      response = post(
        '/signup',
        name: 'Test User',
        email: 'test@user.com',
        password: 'test1!_-43'
      )
      expect(response.status).to eq 400
    end
  end
end
require 'peep_repository'
require 'rack/test'
require_relative '../../app'


RSpec.describe Application do
  include Rack::Test::Methods
  let(:app) { Application.new }

  
  describe "GET /peeps" do
    it "shows all peeps" do
      request = get('/peeps')
      expect(request.body).to include 'Databases are done, yay!'
      expect(request.body).to include '2+2=5'
      expect(request.body).to include '@jj, indeep!'
    end
  end

  describe "GET /peeps/5" do
    it "shows fifth peep" do
      request = get('/peeps/5')
      expect(request.body).not_to include 'Databases are done, yay!'
      expect(request.body).to include '2+2=5'
    end
  end

  describe "GET /signup" do
    it "shows signup form" do
      request = get('/signup')
      expect(request.status).to eq 200
      expect(request.body).to include 'action="/signup" method="POST">'
    end
  end

  describe "POST /signup" do
    it "signs up a valid user" do
      request = post('/signup', email: 'four@gmail.com', password: 'temppass4',
      name: 'Ferro', username: 'ferro')
      expect(request.status).to eq 200
      expect(request.body).to include 'Signup successful! You can login now.'
    end
  end

  describe "POST /signup" do
    it "sfails to sign up invalid email" do
      request = post('/signup', email: '!!fourgmail.com', password: 'temppass4',
      name: 'Ferro', username: 'ferro')
      expect(request.status).to eq 200
      expect(request.body).to include 'Signup failed. Email is invalid.'
    end
  end
end

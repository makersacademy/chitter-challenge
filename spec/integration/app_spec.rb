require 'spec_helper'
require 'rack/test'
require 'database_connection'
require_relative '../../app'

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "GET /home" do
    it "returns homepage with posts" do
      response = get('/home')
      expect(response.status).to eq(200)
      expect(response.body).to include('<h1> Chitter </h1>')
      expect(response.body).to include('I am also the second post')
    end
  end

  context "POST /users" do
    it "returns new user details" do
      
    end
  end
end
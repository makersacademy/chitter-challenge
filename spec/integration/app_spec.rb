require 'spec_helper'
require 'user_repository'
require 'peep_repository'
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
    it "adds new user details to db" do
      response = post('/users', username: 'Eduardo', password: 'secure', email: 'eduardo@makers.com')
      # expect(response.status).to eq(200)
      repo = UserRepository.new
      users = repo.all
      expect(users).to include(
        have_attributes(
          username: "Eduardo",
          password: "secure",
          email: "eduardo@makers.com"
        )
      )
    end
  end
end
require_relative '../../app'
require 'rack/test'

def reset_tables
  sql = File.read("spec/seed.sql")
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(sql)
end

RSpec.describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  before(:each) do
    reset_tables
  end

  context "GET /" do
    it 'returns 200 OK' do
      
      response = get('/')

      expect(response.status).to eq(200)
      expect(response.body).to include("Peep ID#1")
      expect(response.body).to include("href='/signup'")
    end
  end

  context "GET /signup" do
    it 'returns 200 OK' do
      
      response = get('/signup')

      expect(response.status).to eq(200)
      expect(response.body).to include("<form")
      expect(response.body).to include('/signup')
      
    end
  end

  context "POST /signup" do
    it 'returns 200 OK' do
      
      response = post('/signup')

      expect(response.status).to eq(200)
      expect(response.body).to include("Account Created!")
      expect(response.body).to include("<html>")

    end
  end
  context "GET /login" do
    it 'returns 200 OK' do
      
      response = get('/login')

      expect(response.status).to eq(200)
      expect(response.body).to include("<form")
      expect(response.body).to include('/login')
      
    end
  end

  context "POST /login" do
    it 'when log in details match' do

      response = post('/login', params = { email: "parismonson@yahoo.com", password: "hash_password" })
      last_response.should be_redirect
      follow_redirect!
      last_request.url.should == "http://example.org/account/1"
    end
    it 'when log in details dont match' do

      response = post('/login', params = { email: "parismonson@yahoo.com", password: "password" })
      
      expect(response.status).to eq 200
      expect(response.body).to include("Try Again")
    end
  end
  context "GET /account/:id" do
    it 'returns 200 OK' do
      post("/login", params={ email: "parismonson@yahoo.com", password: "hash_password"})
      response = get('/account/1')

      expect(response.status).to eq(200)
      expect(response.body).to include("<div>")
      expect(response.body).to include("pmonson1")
      expect(response.body).to include("pmonson1")

    end
  end
  context "GET /account/:id" do
    it 'redirects to login' do
      
      response = get('/account/1')
      last_response.should be_redirect
      follow_redirect!
      last_request.url.should == "http://example.org/login"
    end
  end
  context "GET /logout" do
    it 'returns 200 OK' do
      response = get('/logout')

      expect(response.status).to eq(200)
      expect(response.body).to include("<title>Logged Out</title>")
    end
  end

  context "POST /peep" do
    it 'returns 200 OK' do
      post("/login", params={ email: "parismonson@yahoo.com", password: "hash_password"})
      response = post('/peep', params = { contents: "Test content" })

      last_response.should be_redirect
      follow_redirect!
      last_request.url.should == "http://example.org/account/1"
    end
  end
end

require '/Users/paris/Desktop/Projects/chitter-challenge/app'
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
end
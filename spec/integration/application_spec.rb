require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  include Rack::Test::Methods
  
  let(:app) { Application.new }

  context "Homepage to site /" do
    it "shows the welcome text on homepage with posts" do
      response = get('/')
    
      expect(response.status).to eq(200)
      expect(response.body).to include('<title>Welcome to Chitter Chatter!</title>')
      expect(response.body).to include('Here are the recent peeps')
      expect(response.body).to include('Here is my other post')
    end
  end

  context 'GET /register' do
    it "takes user to the register page to submit details" do
      response = get('/register')

      expect(response.status).to eq(200)
      expect(response.body).to include('<label>Enter a username:</label>')
      expect(response.body).to include('<form method="POST" action="/register">')
    end
  end

  context 'POST /register' do
    it 'validates user inputs' do
      response = post(
        '/register',
        email_address: '',
        user_name: 'sks',
        password: 12_345)
      expect(response.status).to eq 400
    end

    it "registers a new user" do
      response = post('/register',
      email_address: 'ricky@fake.com',
      username: 'ricky_fake',
      password: 'rickyfake1234')

      expect(response.status).to eq(302)
    end
  end

  context "GET /login" do
    it 'sends a user to the login page' do
      response = get('/login')

      expect(response.status).to eq(200)
      expect(response.body).to include('<form method="POST" action="/login">')
      expect(response.body).to include('<label>Enter your password:</label>')
    end
  end

  context "POST /login" do
    it 'validated a user is valid/existing' do
      response = post('/login',
      email_address: 'sidra@fake.com',
      username: 'sidra_123',
      password: '$2a$06$123')

      expect(response.status).to eq(404)
      expect(response.body).to include("Invalid input")
    end
  end
end

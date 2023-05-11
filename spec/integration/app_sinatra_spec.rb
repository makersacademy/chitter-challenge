require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  before(:each) do
    reset_tables
  end

  context 'GET /' do
    it 'shows peeps already made' do
      response = get('/')
      expect(response.status).to eq 200
      expect(response.body).to include('<p>Shrek @fionalover420&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp2008-11-11 13:23:44</p>')
    end
  end
  
  context 'POST /' do
    it 'redirects you to login page if you try to post' do
      response = post('/', peep: 'peep test')
      expect(response.status).to eq 200
      expect(response.body).to include("Username:<input type='text' name='username'>")
    end

    it 'posts a peep when logged in' do
      response = post('/login', username: 'fionalover420', password: 'I_Love_Fiona_69')
      response = post('/', peep: 'peep test')
      expect(response.status).to eq 200
      expect(response.body).to include('peep test')
      expect(response.body).to include('<form method="GET" action="/logout">')
    end
  end

  context 'GET /login' do
    it 'logs the user in with the correct username' do
      response = get('/login', username: 'fionalover420', password: 'I_Love_Fiona_69')
      expect(response.status).to eq 200
      expect(response.body).to include("Username:<input type='text' name='username'>")
    end
  end

  context 'POST /login' do
    it 'returns the login page if the password is incorrect' do
      response = post('/login', username: 'fionalover420', password: 'U_Love_Fiona_69')
      expect(response.status).to eq 200
      expect(response.body).to include("Username:<input type='text' name='username'>")
    end
  end

  context 'GET /logout' do
    it 'returns the home page with a login button and logs the user out' do
      response = get('/logout')
      expect(response.status).to eq 200
      expect(response.body).to include('<form method="GET" action="/login">')
    end
  end
  
  context 'GET /signup' do
    it 'returns the sign up page' do
      response = get('/signup')
      expect(response.status).to eq 200
      expect(response.body).to include("Email:<input type='text' name='email'><br>")
    end
  end

  context 'POST /signup' do
    it 'returns the login page if signed up and theres no conflicts' do
      response = post('/signup', username: 'singlemominyourarea', name: 'Fiona', password: 'newlysingle69', email: 'fiona@swamp.com')
      expect(response.status).to eq 200
      expect(response.body).to include("<form method='POST' action='/login'>")
    end

    it 'returns the signup page if trying to signup with a taken email' do
      response = post('/signup', username: 'singlemominyourarea', name: 'Fiona', password: 'newlysingle69', email: 'shrek@swamp.com')
      expect(response.status).to eq 200
      expect(response.body).to include("<form method='POST' action='/signup'>")
    end
  end
end

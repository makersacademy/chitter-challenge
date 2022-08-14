require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  include Rack::Test::Methods
  let(:app) { Application.new }

  before(:each) do 
    seed_sql = File.read('spec/seeds/seeds_mixed_tables.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
    connection.exec(seed_sql)
    ActiveRecord::Base.establish_connection(
      adapter:  'postgresql',
      database: 'chitter_test'
    )
  end

  context 'GET / with @user_id = nil and no params' do
    it 'returns 200' do
      response = get('/')
      expect(response.status).to eq 200
      expect(response.body).to include 'Login'
      expect(response.body).to include 'Sign up for Chitter!'    
      # Peeps
      expect(response.body).to include 'Marky Mark'
      expect(response.body).to include '@FunkyB'
      expect(response.body).to include 'Where are my tacos'
      expect(response.body).to include '08:15 PM Friday 12 August 2022'
      expect(response.body).to include 'John Isaac'
      expect(response.body).to include '@JI2022'
      expect(response.body).to include 'Have you guys seen the new Marvel movie?'
      expect(response.body).to include '04:47 PM Friday 12 August 2022'
    end
  end

  context 'GET / when @user_id = user_id' do
    it 'returns 200 with log off and post options' do
      post('/login', username: 'JI2022', password: 'password123')
      response = get('/')
      expect(response.status).to eq 200
      expect(response.body).to include '@JI2022'
      expect(response.body).to include 'Log off'
      expect(response.body).to include 'Post a new Peep'
    end
  end

  context 'GET /login with @user_id = nil and no params' do
    it 'returns 200' do
      response = get('/login')
      expect(response.status).to eq 200
      expect(response.body).to include 'Log on to Chitter'
      expect(response.body).to include 'Username:'
      expect(response.body).to include 'Password:'
      expect(response.body).to include 'Sign up to Chitter'
      expect(response.body).to include 'Back'
    end
  end

  context 'GET /login with @user_id = nil and password_error=true' do
    it 'returns 200 and password error' do
      response = get('/login', password_error: true)
      expect(response.status).to eq 200
      expect(response.body).to include 'Username:'
      expect(response.body).to include 'Password:'
      expect(response.body).to include 'Incorrect password'
    end
  end

 
  context 'GET /login with @user_id = nil and username_error=true' do
    it 'returns 200 and password error' do
      response = get('/login', username_error: true)
      expect(response.status).to eq 200
      expect(response.body).to include 'Username:'
      expect(response.body).to include 'Username does not exist'
      expect(response.body).to include 'Password:'
    end
  end

  context 'GET /login with @user_id = nil and sign_up=true' do
    it 'returns 200 with sign-up message' do
      response = get('/login', sign_up: true)
      expect(response.status).to eq 200
      expect(response.body).to include 'Sign in with your new account'
    end
  end

  context 'GET /login with @user_id = user_id' do
    it 'returns 302 and redirects to /' do
      post('/login', username: 'JI2022', password: 'password123')
      response = get('/login')
      expect(response.status).to eq 302
      expect(last_response).to be_redirect
      follow_redirect!
      expect(last_request.url).to include '/'
    end
  end

  context 'POST /login with @user_id = nil and username & password in db' do
    it 'returns 302 and redirects to /' do
      response = post('/login', username: 'JI2022', password: 'password123')
      expect(response.status).to eq 302
      expect(last_response).to be_redirect
      follow_redirect!
      expect(last_request.url).to include '/'
    end
  end

  context "POST /login with @user_id = nil and username in db but password doesn't match" do
    it 'returns 302 and redirects back to /login' do
      response = post('/login', username: 'JI2022', password: 'password456')
      expect(response.status).to eq 302
      expect(last_response).to be_redirect
      follow_redirect!
      expect(last_request.url).to include '/login&password_error=true'
    end
  end

  context "POST /login with @user_id = nil but username not in db" do
    it 'returns 302 and redirects to /login&username_error=true' do
      response = post('/login', username: 'username', password: 'password123')
      expect(response.status).to eq 302
      expect(last_response).to be_redirect
      follow_redirect!
      expect(last_request.url).to include '/login&username_error=true'
    end
  end

  context 'POST /login with @user_id = nil and username but no password' do
    it 'returns 400' do
      response = post('/login', username: 'username')
      expect(response.status).to eq 400
    end
  end

  context 'POST /login with @user_id = nil and password but no username' do
    it 'returns 400' do
      response = post('/login', password: 'password')
      expect(response.status).to eq 400
    end
  end

  context 'POST /login with @user_id = user_id and any params' do
    it 'returns 400' do
      post('/login', username: 'JI2022', password: 'password123')
      response = post('/login', username: 'JI2022', password: 'password123')
      expect(response.status).to eq 400
    end
  end

  context 'GET /sign-up/new with @user_id = nil' do
    it 'returns 200' do
      response = get('/sign-up/new')
      expect(response.status).to eq 200
      expect(response.body).to include 'Sign up to Chitter'
      expect(response.body).to include 'Name:'
      expect(response.body).to include 'Email:'
      expect(response.body).to include 'Username:'
      expect(response.body).to include 'Password:'
      expect(response.body).to include 'Back'
    end
  end

  context 'GET /sign-up/new with @user_id = nil and username_error and email_error' do
    it 'returns 200' do
      response = get('/sign-up/new', username_error: true, email_error: true)
      expect(response.status).to eq 200
      expect(response.body).to include 'Sign up to Chitter'
      expect(response.body).to include 'Name:'
      expect(response.body).to include 'Email:'
      expect(response.body).to include 'This email is already taken.'
      expect(response.body).to include 'Username:'
      expect(response.body).to include 'This username is already taken.'
      expect(response.body).to include 'Password:'
      expect(response.body).to include 'Back'
    end
  end
end

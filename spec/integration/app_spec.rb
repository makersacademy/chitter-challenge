require_relative '../../app'
require "rack/test"
require "spec_helper"

def reset_table
  seed_sql = File.read('spec/seeds/seeds_chitter.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter' })
  connection.exec(seed_sql)
end

def session_tracker
  last_request.env['rack.session']
end

describe Application do
  before(:each) do
    reset_table
  end

  after(:each) do
    if !session_tracker.nil?
      get '/sessions/logout'
    end
  end

  include Rack::Test::Methods


  let(:app) { Application.new }

  context  'GET /' do
    it 'should return all the peeps in reverse chronological order'do
      response = get('/')

      expect(response.status).to eq 200
      expect(response.body).to include 'Moses'
      expect(response.body).to include 'Mosho'
      expect(response.body).to include 'My first peep!'
    end
  end

  context 'GET /signup' do
    it 'should have a form to signup' do
      response = get('/signup')

      expect(response.status).to eq 200
      expect(response.body).to include('<label for="username">Username</label>')
      expect(response.body).to include('<input type="submit" value="Sign up">')
    end
  end

  context 'POST /signup' do
    it 'should create a new user' do
      response = post('/signup', 
        params = {username: 'test', 
                  name: 'tester',
                  email: 'test@test.com', 
                  password: 'test'})  
      repo = UserRepository.new
      result = repo.find_by_email('test@test.com')

      expect(result.name).to eq 'tester'
      expect(response.status).to eq 302
      response = get('/')
      expect(response.body).to include('<a href="/sessions/logout">Logout</a>')
    end

    it 'should be unavailable if logged in' do
      response = post('/signup', 
                params = {username: 'test', 
                          email: 'test@test.com', 
                          password: 'test'})
      repo = UserRepository.new
      users = repo.find_by_email('test@test.com')

      expect(response.status).to eq 302

    end
  end

  describe 'GET /sessions/login' do
    it 'should GET the login page' do
      response = get('/sessions/login')

      expect(response.status).to eq(200)
      expect(response.body).to include('<label for="email">Email</label>')
      expect(response.body).to include('<input type="submit" value="Login">')
    end

    it 'should not return login if logged in' do
      post('/sessions/login', 
            params = {email: 'mosho@live.co.uk', password: 'password'})

      response = get('/sessions/login')
      expect(response.status).to eq(302)
    end
  end

  describe 'POST /sessions/login' do
    it 'on successful login should POST to /sessions/login' do
      response = post('/sessions/login', 
                params = {email: 'mosho@live.co.uk', password: 'password'})
      expect(response.status).to eq 302
      response = get('/')
      expect(response.status).to eq 200
      expect(response.body).to include('<a href="/sessions/logout">Logout</a>')
      expect(session_tracker[:user_id]).to eq 1
    end

    it 'should send to login on wrong password' do
      response = post('/sessions/login', 
                params = {email: 'mosho@live.co.uk', password: 'password3'})
      expect(response.status).to eq 302
      response = get('/sessions/login')
      expect(response.status).to eq 200
      expect(response.body).to include('<a href="/signup">Signup</a>')
      expect(response.body).to include('<form action="/sessions/login"')
      expect(session_tracker[:user_id]).to eq nil
    end
  end

  context 'POST /' do
    it 'should display a new peep after a peep has been written' do
    post('/sessions/login', 
      params = {email: 'mosho@live.co.uk', password: 'password'})
      response = post('/', 
        params = {content: 'peep!', name: 'Moses', username: 'Mosho'})

      expect(response.status).to eq 302
      response = get('/')
      expect(response.body).to include 'peep!'
    end
  end
end
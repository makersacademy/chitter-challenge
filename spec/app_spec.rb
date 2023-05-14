require "spec_helper"
require "rack/test"
require_relative '../app'

RSpec.describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  def reset_table
    seed_sql = File.read('spec/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_challenge_test' })
    connection.exec(seed_sql)
  end
  

  describe Application do
    before(:each) do 
      reset_table
    end
  end

  context 'GET /' do
    it 'returns html homepage' do
        response = get('/')
        
        expect(response.status).to eq(200)
        expect(response.body).to include('<h1>Welcome to Chitter</h1>')
        expect(response.body).to include('<a href="/login">Login</a>')
        expect(response.body).to include('<a href="/signup">Signup</a><br>')
        expect(response.body).to include('<a href="/shoutybox">Shouty Box - see what people are peeping </a>')
    end
  end

  context 'GET /login' do
    it 'returns login page' do
        response = get('/login')

        expect(response.status).to eq(200)
        expect(response.body).to include('<h1>Login</h1>')
        expect(response.body).to include('<form action="/login" method="POST">')
        expect(response.body).to include('<input type="email" name="email">')
        expect(response.body).to include('<input type="password" name="password">')
    end
  end

  context 'POST /login' do
    xit 'if login in details correct it returns confirmation of login' do
      response = post('/login', email: 'js@gmail.com', password: 'passwordJS')

      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Welcome back</h1>')
      expect(response.body).to include('<a href="/shoutybox">Shouty Box - see what people are peeping</a>')

    end

    it 'if login details correct it returns confirmation of login' do
      response = post('/login', email: 'pl@gmail.com', password: 'password4')

      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Welcome back</h1>')
      expect(response.body).to include('<a href="/shoutybox">Shouty Box - see what people are peeping</a><br>')

    end

    it 'if incorrect login returns user to login error page' do
      response = post('/login', email: '', password: '')

      expect(response.status).to eq(400)
      expect(response.body).to include('<h1>Login Error please try again</h1>')
      expect(response.body).to include('<form action="/login" method="POST">')

    end
  end

  context 'GET /account_page' do
    # test for non-encrypted password
    xit 'lets user make a new peep if session in progress' do
      response = post('/login', email: 'js@gmail.com', password: 'passwordJS')
      response = get('/account_page')
     
      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Your account</h1>')
    end

    it 'lets user make a new peep if session in progress' do
      response = post('/login', email: 'pl@gmail.com', password: 'password4')
      response = get('/account_page')
     
      expect(response.status).to eq(200)
      expect(response.body).to include('<h2>my peeps</h2>')
    end
  end

  context 'GET /signup' do
    it 'returns signup page' do
        response = get('/signup')

        expect(response.status).to eq(200)
        expect(response.body).to include('<h1>Signup</h1>')
        expect(response.body).to include('<input type="text" name="name">')        
        expect(response.body).to include('<input type="text" name="username">')
        expect(response.body).to include('<input type="email" name="email">')
        expect(response.body).to include('<input type="password" name="password">')
    end
  end

  context 'POST /signup' do
    it 'creates a new user' do
        response = post('/signup', name: 'Pippa Long', username: 'Longstockings', email: 'piplong@gmail.com', password: 'password_test')

        expect(response.status).to eq(200)
        expect(response.body).to include('<h1>You have successfully signed up with Chitter</h1>')
        expect(response.body).to include('<a href="/shoutybox">Shouty Box<br>- see what people are peeping</a>')

    end

    it 'returns to singup page if wrong inputs' do
      response = post('/signup', name: '', username: '', email: 'piplong@gmail.com', password: 'password_test')

      expect(response.status).to eq(400)
      expect(response.body).to include('<h1>Signup</h1>')
      expect(response.body).to include('<input type="text" name="name">')        
      expect(response.body).to include('<input type="text" name="username">')
      expect(response.body).to include('<input type="text" name="email">')
      expect(response.body).to include('<input type="text" name="password">')
    end

    it 'returns to singup page if wrong inputs' do
      response = post('/signup', name: '<script>', username: '<script>', email: 'piplong@gmail.com', password: 'password_test')

      expect(response.status).to eq(400)
      expect(response.body).to include('<h1>Signup</h1>')
      expect(response.body).to include('<input type="text" name="name">')        
      expect(response.body).to include('<input type="text" name="username">')
      expect(response.body).to include('<input type="text" name="email">')
      expect(response.body).to include('<input type="text" name="password">')
    end
  end

  context 'GET /shoutybox' do
    it 'returns page with peeps in reverse chronological order' do
        response = get('/shoutybox')

        expect(response.status).to eq(200)
        expect(response.body).to include('<h1>SHOUTYBOX</h1>')

    end
  end

  context 'GET /peep/new' do
    it 'returns form to create a new peep' do
        response = get('/peep/new')
        expect(response.status).to eq(200)
        expect(response.body).to include('<h2>new peep</h2>')
        expect(response.body).to include('<label>peep</label>')
        expect(response.body).to include('<input type="text" name="peep">')
        # expect(response.body).to include('<input type="timestamp" name="time">')
        # expect(response.body).to include('<input type="int" name="user_id">')
    end
  end

  context 'POST /peep' do
    it 'posts a new peep' do
        response = post('/peep', peep: 'Hello World!', time:'2023-01-10 10:30:00', user_id: '3')
        expect(response.status).to eq(200)
        # expect(response.body).to include('<h1>You have successfully signed up with Chitter</h1>')
        # expect(response.body).to include('<a href="/shoutybox">Shouty Box<br>- see what people are peeping</a>')

    end

    it 'returns to post peep page if input not vaild' do
      response = post('/peep', peep:'', time:'2023-01-10 10:30:00', user_id: '3')

      expect(response.status).to eq(400)
      expect(response.body).to include('<h2>new peep</h2>')
      expect(response.body).to include('<label>peep</label>')
      expect(response.body).to include('<input type="text" name="peep">')
    end

    it 'returns to post peep page if input not vaild' do
      response = post('/peep', peep:'<script>', time:'2023-01-10 10:30:00', user_id: '3')

      expect(response.status).to eq(400)
      expect(response.body).to include('<h2>new peep</h2>')
      expect(response.body).to include('<label>peep</label>')
      expect(response.body).to include('<input type="text" name="peep">')
    end
  end

  context 'GET /logout' do
    it 'logs user out by ending session' do
      response = post('/login', email: 'pl@gmail.com', password: 'password4')
      response = get('/logout')

      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Welcome to Chitter</h1>')
    end
  end

end
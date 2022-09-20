require "spec_helper"
require "rack/test"
require_relative '../../app'
require 'json'

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }
  
  before(:each) do
    query = File.read('./spec/seeds/chitter.sql')
    connection = PG.connect({ host: "127.0.0.1", dbname: "chitter" })
    connection.exec(query)
  end

  context 'GET to /peeps' do
    it 'returns a list of all peeps' do
      response = get('/peeps')
      expect(response.status).to eq 200
      expect(response.body).to include('<ul>Hola - 2022-08-20 18:15:48')
      expect(response.body).to include('<ul>Shalom - 2022-09-15 11:37:22')
    end
  end

  context 'GET /peeps/new' do
    it 'returns form to enter new peep' do
      response = get('/peeps/new')
      expect(response.status).to eq 200
      expect(response.body).to include ('<h1>Please enter your peep here</h1>')
      expect(response.body).to include ('<form action="/peeps" method="POST">')
    end
  end

  context 'POST /peeps' do
    it 'returns a success message if peep has been posted and checks if peep has been added to all peeps' do
      post('/login', email: 'fake1@fake.com', password: 'PASSWORD1')
      post_response = post('/peeps', content: 'This is my first peep')
      expect(post_response.status).to eq 200
      expect(post_response.body).to include('Peep successfully posted!')
      get_response = get('/peeps')
      expect(get_response.status).to eq 200
      expect(get_response.body).to include('This is my first peep')
    end

    it 'returns 400 error if content is empty' do
      response = post('/peeps', content: '')
      expect(response.status).to eq 400
      expect(response.body).to include 'ERROR: Contents field must be filled'
    end

    it 'returns 400 error if not logged in' do
      response = post('/peeps', content: 'This is my first peep')
      expect(response.status).to eq 400
      expect(response.body).to include 'ERROR: Please log in to post a peep'
    end
  end

  context 'GET /signup' do
    it 'returns form to sign up for chitter' do
      response = get('/signup')
      expect(response.status).to eq 200
      expect(response.body).to include ('<h1>Welcome to Chitter!</h1>')
    end
  end

  context 'POST /signup' do
    it 'returns a success message if new user created, and checks if user has been created' do
      post_response = post('/signup', email: 'abc@def.com', password: 'PASSWORD', name: 'Paul Makers', username: 'PMK1968')
      expect(post_response.status).to eq 200
      expect(post_response.body).to include('<h1>User created successfully! Please click here to login:</h1>')
      repo = UserRepository.new
      users = repo.all
      expect(users.length).to eq 4
    end

    it 'returns 400 error if a field is empty' do
      response = post('/signup', email: '')
      expect(response.status).to eq 400
      expect(response.body).to include 'ERROR: One or more fields is empty'
    end
  end

  context 'GET /login' do
    it 'returns form to login to chitter' do
      response = get('/login')
      expect(response.status).to eq 200
      expect(response.body).to include ('<h1>Please log in</h1>')
    end
  end

  context 'POST /login' do
    it 'returns success message if password was correct' do
      response = post('/login', email: 'fake1@fake.com', password: 'PASSWORD1')
      expect(response.status).to eq 200
      expect(response.body).to include ('Logged in successfully!')
    end

    it 'returns an error if wrong password is inputted' do
      response = post('/login', email: 'fake1@fake.com', password: 'ASDF')
      expect(response.status).to eq 400
      expect(response.body).to include ('ERROR: Incorrect password')
    end
  end

  context 'GET /logout' do
    it 'returns success message for logging out' do
      response = get('/logout')
      expect(response.status).to eq 200
      expect(response.body).to include ('Logout Successful.')
    end
  end
end

require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  def reset_tables
    seed_sql = File.read('spec/seeds/test_seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
    connection.exec(seed_sql)
  end
  
  before(:each) do 
    reset_tables
  end

  context 'GET /' do
    it 'returns 200 OK and a form to sign up' do
      response = get('/')
      expect(response.status).to eq(200)
      expect(response.body).to include("<h1>Welcome to Chitter</h1>")
      expect(response.body).to include('<form action="/signup" method="POST">')
    end
  end

  context 'POST /signup' do
    it 'returns 200 OK when the user has no account' do
      response = post('/signup', name: 'Sam', username: 'Samy', email: 'samy@mail.com', password: 'samy123' )
      expect(response.status).to eq(200)
      expect(response.body).to include('<h2> Thank you for sign up! <h2>')
      expect(response.body).to include('<a href="/peeps"> View peeps </a>')
    end

    it 'returns 200 OK when the user has an account' do
      response = post('/signup', name: 'Tami', username: 'bigtami', email: 'tam@mail.com', password: '1234')
      expect(response.status).to eq(200)
      expect(response.body).to include('<h2> Chitter account already exists</h2>')
      expect(response.body).to include('Please login <a href="/login"> here </a>')
    end
  end

  context 'GET /login' do
    it 'return the form to login' do
      response = get('/login')
      expect(response.status).to eq(200)
      expect(response.body).to include('<form action="/login" method="POST">')
    end
  end

  context 'POST /login' do
    it 'login if it is the correct password' do
      response = post('/login', email: 'jam@mail.com', password: '0000')
      expect(response.status).to eq(200)
      expect(response.body).to include('Correct password!') # Hi username!
    end

    it 'go to error page if password is incorrect' do
      response = post('/login', email: 'jam@mail.com', password: '0001')
      expect(response.status).to eq(200)
      expect(response.body).to include('<h2> Email or Password incorrect</h2>')
      expect(response.body).to include('Please try again <a href="/login"> here </a>')
      expect(response.body).to include('<a href="/"> Create an account </a>')
    end

    it 'go to error page if email is not in the database' do
      response = post('/login', email: 'error@mail.com', password: '0000')
      expect(response.status).to eq(200)
      expect(response.body).to include('<h2> Email or Password incorrect</h2>')
      expect(response.body).to include('Please try again <a href="/login"> here </a>')
      expect(response.body).to include('<a href="/"> Create an account </a>')
    end
  end
       
end


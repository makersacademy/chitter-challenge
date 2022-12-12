require 'spec_helper'
require 'rack/test'
require_relative '../../app'
require 'json'

describe Application do
  include Rack::Test::Methods
  let(:app) { Application.new }

  before(:each) do
    query = File.read('./spec/seeds/peeps_seeds.sql')
    query = File.read('./spec/seeds/users_seeds.sql')
    connection = PG.connect({ host: "127.0.0.1", dbname: "chitter_test" })
    connection.exec(query)
  end
  
  context 'GET /peeps' do
    it 'returns 200 OK with the right content and returns all or specific peeps' do
      response = get('/peeps/4')
      response_2 = get('/peeps')
      expect(response.status).to eq(200)
      expect(response.body).to include("'Old time is still a-flyin'")
      expect(response_2.body).to include("'Tories suck'")

    end
  end

  context 'GET /' do
    it "returns 200 OK and returns the right content" do
      response = get('/')
      expect(response.status).to eq(200)
      expect(response.body).to include('See All Peeps')
      expect(response.body).to include('Sign Up To Chitter')
      expect(response.body).to include('Login And Post Your Own Peep')
    end
  end

  context 'GET /peeps/new' do
    it "returns 200 OK and box to post new peep" do
      response = get('/peeps/new')
      expect(response.status).to eq(200)
      expect(response.body).to include('<form action="/peeps" method="POST">')
      expect(response.body).to include('<input type="submit" value="HOME" />')
    end
  end

  context 'POST /peeps' do
    it 'should redirect to login page if not logged in' do
      response = post(
        '/peeps',
        email: nil
      )
      expect(response.body).to include('<form action="/login" method="POST">')
    end

    it 'should redirect to login page if content box is empty' do
      response = post(
        '/peeps',
        content: nil
      )
      expect(response.body).to include('<form action="/login" method="POST">')
    end
  end

  context 'POST /peeps/new' do
    it 'should create a new peep if user is logged in and content box is not empty' do
      post('/login', email: 'joeosborne77@gmail.com', password: 'Hello123!')
      post_response = post('/peeps', content: 'Hello! Testing 123')
      expect(post_response.status).to eq 200
      expect(post_response.body).to include('Peep posted!')
      get_response = get('/peeps')
      expect(get_response.status).to eq 200
      expect(get_response.body).to include('Hello! Testing 123')
    end
  end
  
  context 'POST /peeps/signup' do
    it 'returns 200 OK and creates a new user' do
      response = post('/signup', name: 'Rob Kuzik', email: 'robbyk@gmail.com', username: 'Robster92', password: 'Hello123!')
      expect(response.status).to eq(200)
      expect(response.body).to include('Sign up successful!')
      repo = UserRepository.new
      user = repo.all 
      expect(user.last.name).to eq("Rob Kuzik")
    end

    it 'returns 200 OK and redirect to sign up page if any boxes are empty' do
      response = post('/signup', name: '', email: 'robbyk@gmail.com', username: 'Robster92', password: 'Hello123!')
      expect(response.status).to eq(200)
      expect(response.body).to include('Please sign up below.')
    end

    it 'returns 200 OK and redirect to sign up page if any boxes are empty' do
      response = post('/signup', name: 'Rob Kuzik', email: '', username: 'Robster92', password: 'Hello123!')
      expect(response.status).to eq(200)
      expect(response.body).to include('Please sign up below.')
    end

    it 'returns 200 OK and redirect to sign up page if any boxes are empty' do
      response = post('/signup', name: 'Rob Kuzik', email: 'robbyk@gmail.com', username: '', password: 'Hello123!')
      expect(response.status).to eq(200)
      expect(response.body).to include('Please sign up below.')
    end

    it 'returns 200 OK and redirect to sign up page if any boxes are empty' do
      response = post('/signup', name: 'Rob Kuzik', email: 'robbyk@gmail.com', username: 'Robster92', password: '')
      expect(response.status).to eq(200)
      expect(response.body).to include('Please sign up below.')
    end

    it 'returns 200 OK and rejects any exisiting emails or usernames' do
      response = post('/signup', name: 'Joe Osborne', email: 'joeosborne77@gmail.com', username: 'Salted peanuts', password: '1234!')
      expect(response.status).to eq(200)
      expect(response.body).to include('Username or email already taken, please try again.')
    end

    it 'returns 200 OK and creates new user' do
      response = post('/signup', name: 'Johnty Peterson', email: 'flabby@gmail.com', username: 'TastyWheat', password: '1234!')
      expect(response.status).to eq(200)
      repo = UserRepository.new
      user = repo.all 
      expect(user.last.email).to eq('flabby@gmail.com')
    end
  end
end

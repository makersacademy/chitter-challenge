require "spec_helper"
require "rack/test"
require_relative "../../app"

def reset_users_table
  seed_sql = File.read('spec/chitter_test_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  before(:each) do 
    reset_users_table
  end

  context "GET /" do
    it 'returns 200 OK' do
      response = get('/')

      expect(response.status).to eq(200)
      expect(response.body).to include '<h1>Welcome to Chitter!</h1>'
    end
  end

  context "GET /signup" do
    it 'returns the signup page' do
      response = get('/signup')

      expect(response.status).to eq 200
      expect(response.body).to include '<input type="submit" value="Sign up!">'
      expect(response.body).to include '<form action="/signup" method="POST"><br>'
    end
  end

  context "POST /signup" do
    it 'returns a success page' do
      response = post(
        '/signup',
        username: 'testuser453',
        name: 'Test User',
        email: 'test@user.com',
        password: 'test1!_43'
      )

      expect(response.status).to eq 200
      expect(response.body).to include ('Congratulations on your successful account creation, welcome to Chitter!')
    end

    it 'responds with 400 status if username is blank' do
      response = post(
        '/signup',
        name: 'Test User',
        email: 'test@user.com',
        password: 'test1!_-43'
      )
      expect(response.status).to eq 400
    end
    it 'responds with 400 status if password contains invalid characters' do
      response = post(
        '/signup',
        username: 'testuser453',
        name: 'Test User',
        email: 'test@user.com',
        password: 'test1!_-43<&'
      )
      expect(response.status).to eq 400
    end
    it 'creates a new user if inputs are valid' do
      response = post(
        '/signup',
        username: 'testuser453',
        name: 'Test User',
        email: 'test@user.com',
        password: 'test1!_43'
      )
      repo = UserRepository.new

      all_users = repo.all

      expect(all_users.length).to eq 4
      expect(all_users.last.name).to eq 'Test User'
      expect(all_users.last.password).to eq 'test1!_43'
    end

  end

  context "GET /signupsuccess" do
    it 'returns the signupsuccess page' do
      response = get('/signupsuccess')

      expect(response.status).to eq 200

      expect(response.body).to include "<a href='/'>login page</a>"
    end
  end
end
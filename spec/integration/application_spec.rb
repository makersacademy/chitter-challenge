require "spec_helper"
require "rack/test"
require_relative '../../app'
require 'user_repository'

def reset_chitter_tables
  seed_sql = File.read('seeds/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  before(:each) do
    reset_chitter_tables
  end

  context "GET /" do
    it 'returns 200 OK' do
      response = get('/')

      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>David</h1>')
      expect(response.body).to include('<div>message3</div>')
      expect(response.body).to include('<div>2022-02-20 02:01:01</div>')
    end
  end

  context "GET /new" do
    it 'shows new post page if logged in' do
      post('/signup', name: 'name', username: 'username3', email: 'email', password: 'password3')
      post('/login', username: 'username3', password: 'password3')

      response = get('/new')

      expect(response.status).to eq(200)
      expect(response.body).to include('<input type="text" name="message" placeholder="Message">')
      expect(response.body).to include('<input type="submit" value="Submit">')
    end

    it "redirects to home if not logged in" do
      response = get('/new')
      expect(response.status).to eq(302)
    end
  end

  context "POST /new" do
    it 'returns 200 OK' do
      post('/signup', name: 'name', username: 'username3', email: 'email', password: 'password3')
      post('/login', username: 'username3', password: 'password3')

      response = post('/new', message: 'message4')
      expect(response.status).to eq(200)

      response = get('/')
      expect(response.status).to eq(200)
      expect(response.body).to include("message4")
      expect(response.body).to include("name")
    end
  end

  context "GET /signup" do
    it 'returns 200 OK' do
      response = get('/signup')

      expect(response.status).to eq(200)
      expect(response.body).to include('<input type="text" name ="name" placeholder="Name">')
      expect(response.body).to include('<input type="text" name ="email" placeholder="Email Address">')
      expect(response.body).to include('<input type="password" name ="password" placeholder="Password">')
    end
  end

  context "POST /signup" do
    it 'returns 200 OK' do
      response = post('/signup', name: 'Liv', username: 'username3', email: 'user.3@hotmail.com', password: 'password3')

      expect(response.status).to eq(200)
      
      repo = UserRepository.new
      expect(repo.find(3).name).to eq('Liv')
    end
  end

  context "GET /login" do
    it 'returns 200 OK' do
      response = get('/login')

      expect(response.status).to eq(200)
      expect(response.body).to include("<h1>Login</h1>")
      expect(response.body).to include('<input type="password" name="password" placeholder="Password">')
    end
  end

  context "POST /login" do
    it 'logs in correctly' do
      post('/signup', name: 'name', username: 'username3', email: 'email', password: 'password3')
      response = post('/login', username: 'username3', password: 'password3')

      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Logged in: name</h1>')
    end

    it 'fails to login correctly' do
      post('/signup', name: 'name', username: 'username3', email: 'email', password: 'password3')
      response = post('/login', username: 'username3', password: '123')

      expect(response.status).to eq(200)
      expect(response.body).to include("<h1>Login</h1>")
      expect(response.body).to include("<div>Username or password incorrect</div>")
      expect(response.body).to include('<input type="password" name="password" placeholder="Password">')
    end
  end

  context "GET /logout" do
    it "returns 200 OK" do
      post('/signup', name: 'name', username: 'username3', email: 'email', password: 'password3')
      post('/login', username: 'username3', password: 'password3')

      response = get('/')
      expect(response.body).to include "Log Out"
      expect(response.body).to include "name"

      response = get('/logout')
      expect(response.status).to eq(200)

      response = get('/')
      expect(response.body).to include "Login"
      expect(response.body).to include "Sign Up"
    end
  end
      
end

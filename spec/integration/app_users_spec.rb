require "spec_helper"
require "rack/test"
require_relative '../../app'
require_relative '../reset_database_tables'


describe Application do

# tests for status 404 responses - WIP

  before(:each) do
    ResetDatabaseTables.new.reset
  end

  include Rack::Test::Methods

  let(:app) { Application.new }

  context 'GET /users/signup' do
    it 'returns account signup page' do
      response = get('/users/signup')

      expect(response.status).to eq(200)
      expect(response.body).to include('Create a New Account!</h2>')
      expect(response.body).to include('<form action="/users/signup" method="POST">')
      expect(response.body).to include('<input type="text" name="email"')
      expect(response.body).to include('<input type="password" name="password"')
      expect(response.body).to include('<input type="text" name="f_name"')
      expect(response.body).to include('<input type="text" name="handle"')
      expect(response.body).to include('<input type="submit" value="Let\'s go!">')
    end
  end

  context "POST /users/signup" do
    it 'creates a new user' do
      # note that the date/time of the post is auto generated in the method
      response = post(
        '/users/signup',
        email: 'bob0@example.com',
        password: 'topsecret',
        f_name: 'Bob',
        handle: 'bob0',
      )

      expect(response.status).to eq(200) 

      response = get('/users/user-created')
      
      expect(response.body).to include('Account created!')
    end

    # next test/implementation: redirect to dedicated error page
    it 'redirects to error page if trying to create a new account with a pre-existing email address or username' do
      # note that the date/time of the post is auto generated in the method
      response = post(
        '/users/signup',
        email: 'wendy0@example.com',
        password: 'password123',
        f_name: 'Wendy',
        handle: 'wendy0',
      )

      expect(response.status).to eq(500)
    end
  end

  context "GET /sessions/login" do
    it 'returns account login page' do
      response = get('/sessions/login')
      
      expect(response.status).to eq(200)
      expect(response.body).to include('Log into your account!')
      expect(response.body).to include('<form action="/sessions" method="POST">')
      expect(response.body).to include('<input type="text" name="email"')
      expect(response.body).to include('<input type="password" name="password"')
      expect(response.body).to include('<input type="submit" value="Log in!">')
    end
  end

  context "GET /sessions/logout" do
    it 'returns to homepage after user logs out' do
      response = get('/sessions/logout')

      expect(response.body).to include('Chitter</a></h1>')
      expect(response.body).to include('peeps">See all Peeps!</a></h2>')
      expect(response.body).to include('new">Post a Peep!</a></h2>')
      expect(response.body).to include('>Sign up!</a></h2>')
    end
  end

  context "POST /sessions" do
    it 'returns error page after unsuccessful user login' do
            
      response = post(
        '/sessions',
        email: 'wrong',
        password:'credentials',
      )

      expect(response.body).to include("Login error - please try again!")
    end
      
    it 'returns welcome page after successful user login' do
      response = post(
        '/sessions',
        email: 'wendy0@example.com',
        password:'password123',
      )
      
      expect(response.status).to eq(200)
      expect(response.body).to include("Welcome")
    end
  end

end

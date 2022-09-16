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
    it 'returns homepage' do
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
end

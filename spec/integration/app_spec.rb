require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  
  include Rack::Test::Methods

  let(:app) { Application.new }

  before(:each) do
    reset_users_table
  end 
  
  context "GET to /" do
    it "returns 200 OK with the right content" do
      response = get("/")
      # Assert the response status code and body.
      expect(response.status).to eq(200)
      expect(response.body).to include('Welcome to Chitter')
    end
  end

  context "GET /peeps" do
    it "returns a list of all peeps" do
      response = get('/peeps')
      expect(response.body).to include('  <a href="/peeps/1">Do the solo chitter project</a><br />')
      expect(response.body).to include('  <a href="/peeps/2">Do the shop mamnager project</a><br />')
    end
  end

   context 'GET /peeps/:id' do
    it 'returns the time at which peep was made' do 
      response = get('/peeps/1')
      expect(response.status).to eq(200)
      expect(response.body).to include('Do the solo chitter project')
      expect(response.body).to include('2023-01-08 10:05:06')
    end
  end

  context 'GET /sign_up' do
    it 'should return a form to create a new user' do 
      response = get('/sign_up')
      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Create a new user</h1>')
      expect(response.body).to include('form action="/sign_up" method="POST">')
    end
  end

  context 'POST /sign_up' do
    it 'create a new user' do 
      response = post(
        '/sign_up',
        name: 'james',
        username: 'jamesmith',
        email: 'james@makers.com',
        password: 'password'
      )
      expect(response.status).to eq(200)
      expect(response.body).to include('You created a new user: jamesmith')
    end
  end
  
  context 'GET /log_in' do
    it 'should return a form to fill the log in information' do 
      response = get('/log_in')
      expect(response.status).to eq(200)
      expect(response.body).to include('<h1 id="login-header">Login</h1>')
      expect(response.body).to include('form action="/log_in" method="POST">')
    end
  end

  context 'POST /log_in' do
        
      it 'logs the user in and redirects to login_success page with valid credentials' do
        response = post(
          '/log_in',
          password: 'password1',
          email: 'david@makers.com'
        )
        expect(response.status).to eq(200)
        expect(response.body).to include('<h1>You are sucessuful login</h1>')
      end

      it 'returns login_error with invalid credentials' do
        response = post(
          '/log_in',
          password: 'password',
          email: 'james@makers.com'
        )
        expect(response.status).to eq(200)
        expect(response.body).to include("login_error")
      end
   
  end 

  context 'GET /log_out' do 
   it 'logs the user out and redirects to login page' do
    response = get('/log_out')
    expect(response.status).to eq(200)
    expect(response.body).to include('<h1 id="login-header">Login</h1>')
   end
  end


  context 'GET /new_peep' do
    it 'should return a form to create a new peep' do 
    response = get('/new_peep')
    expect(response.status).to eq(200)
    expect(response.body).to include("<h2>What's in your mind?</h2>")
    expect(response.body).to include('form action="/new_peep" method="POST">')
   end
  end

  context 'POST /new_peep' do
    it 'create a new peep' do 
      response = post(
        '/new_peep',
        content: 'what a sunny day',
        time: Time.now,
        user_id: 1
      )
      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>You created a new peep: what a sunny day</h1>')
    end
  end

end

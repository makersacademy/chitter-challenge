require 'spec_helper'
require 'rack/test'
require_relative '../../app'

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context 'GET to /' do
    it 'returns 200 OK with a list of peeps' do
      response = get('/')

      expect(response.status).to eq 200
      expect(response.body).to include('<h1>Chitter</h1>')
      expect(response.body).to include('<h2>Hello world</h2>')
    end
  end

  context 'GET to /peeps/new' do
    it 'returns 302 Redirect to / if user not logged in' do
      response = get('/peeps/new')
      expect(response.status).to eq 302
    end

    it 'returns 200 OK with a form to create new peep if logged in' do
      post(
        '/login',
        email: 'fred@gmail.com',
        password: '123'
      )
      response = get('/peeps/new')

      expect(response.status).to eq 200
      expect(response.body).to include('<h1>Create a new peep</h1>')
      expect(response.body).to include('<form action="/peeps" method="post">')
      expect(response.body).to include('<input id="message" type="text" name="message" />')
    end
  end

  context 'POST to /peeps' do
    it 'returns status 302 and redirects to / showing new peep' do
      post(
        '/login',
        email: 'fred@gmail.com',
        password: '123'
      )

      response = post(
        '/peeps',
        message: 'Testing 123',
        user_id: 2
        )

      expect(response.status).to eq 302

      peeps = get('/')
      expect(peeps.body).to include('<h2>Testing 123</h2>')
    end
  end

  context 'GET to /signup' do
    it 'returns 200 OK and the signup form' do
      response = get('/signup')

      expect(response.status).to eq 200
      expect(response.body).to include('<h1>Sign up to Chitter</h1>')
      expect(response.body).to include('<form action="/signup" method="post">')
      expect(response.body).to include('<input type="text" name="username" id="username" />')
      expect(response.body).to include('<input type="text" name="name" id="name" />')
      expect(response.body).to include('<input type="email" name="email" id="email" />')
      expect(response.body).to include('<input type="password" name="password" id="password" />')
    end
  end

  context 'POST to /signup' do
    it 'adds a new user' do
      response = post(
        '/signup',
        username: 'jimmy',
        name: 'Jim',
        email: 'jim@gmail.com',
        password: '123'
        )
      
      expect(response.status).to eq 200
      expect(response.body).to include('<p>You have successfully signed up for Chitter!</p>')
    end
  end

  context 'GET to /login' do
    it 'returns 200 OK and the login form' do
      response = get('/login')

      expect(response.status).to eq 200
      expect(response.body).to include('<h1>Log in to Chitter</h1>')
      expect(response.body).to include('<input type="email" name="email" id="email" />')
      expect(response.body).to include('<input type="password" name="password" id="password" />')
    end
  end

  context 'POST to /login' do
    it 'returns 200 OK and logs the user in' do
      response = post(
        '/login',
        email: 'fred@gmail.com',
        password: '123'
      )

      expect(response.status).to eq 200
    end
  end

  context 'GET to /logout' do
    it 'returns 302 Found redirect' do
      response = get('/logout')

      expect(response.status).to eq 302
    end
  end
end

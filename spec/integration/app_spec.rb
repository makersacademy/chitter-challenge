require 'spec_helper'
require_relative '../../app'
require 'capybara'

Capybara.app = Application

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context 'GET /' do
    it 'displays homepage' do
      response = get('/')

      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Welcome to Chitter</h1>')
      expect(response.body).to include('<h3><a href="peeps">Peeps</a></h3>')
      expect(response.body).to include('Beautiful day, 2022-10-09 13:00:48 UTC<br />')
      expect(response.body).to include('Hello, 2022-10-09 13:00:18 UTC<br />')
      expect(response.body).to include('<a href="signup">Sign Up</a><br />')
      expect(response.body).to include('<a href="signin">Sign In</a><br />')
    end
  end

  context 'GET /peeps' do
    it 'returns list of peeps with written time and username' do
      response = get('/peeps') 

      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Peeps</h1>')
      expect(response.body).to include('dolly<br />')
      expect(response.body).to include('Beautiful day, 2022-10-09 13:00:48 UTC<br />')
      expect(response.body).to include('kitty<br />')
      expect(response.body).to include('Hello, 2022-10-09 13:00:18 UTC<br />')
      expect(response.body).to include('<h3><a href="/">Home</a><br /></h3>')
    end
  end

  context 'GET /signup' do
    it 'gets signup form' do
      response = get('/signup')

      expect(response.status).to eq(200)
      expect(response.body).to include('<form action="/signup/new" method="POST">')
      expect(response.body).to include('<input type="string" name="email"><br />')
      expect(response.body).to include('<input type="string" name="username"><br />')
      expect(response.body).to include('<input type="string" name="password">')
      expect(response.body).to include('<input type="string" name="password_confirmation">')
      expect(response.body).to include('<input type="submit" value="Create">')
    end
  end

  context 'GET /signin' do
    it 'returns the login form' do
      response = get('/signin')
  
      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Sign in</h1>')
      expect(response.body).to include('<form action="/signin/account" method="POST">')
      expect(response.body).to include('<label>Username</label><br />')
      expect(response.body).to include('<input type="string" name="username"><br />')
      expect(response.body).to include('<label>Password</label><br />')
      expect(response.body).to include('<input type="string" name="password">')
      expect(response.body).to include('<input type="submit" value="Sign in">')
    end
  end

  context 'POST /signup/new' do
    it 'creates a new user with valid information' do
      response = post(
        '/signup/new',
        email: 'coder@cmail.com',
        username: 'coder',
        password: 'abcde12345',
        password_confirmation: 'abcde12345')

      expect(response.status).to eq(200)
      expect(response.body).to include('Thank you for joining us!')
      expect(response.body).to include('Go to sign in to make your first peep')
      expect(response.body).to include('<a href="/signin">Sign in</a>')
      expect(User.all).to include(
        have_attributes(
          email: 'coder@cmail.com',
          username: 'coder'
        )
      )
    end
  end

  context 'POST /signin/account' do
    it 'loads sign up page with unmatching input' do
      response = post(
        '/signin/account',
        username: 'dolly',
        password: 'abcde12'
      )
      user = User.find_by_username('dolly')
      validation = user.authenticate('abcde12')
      expect(validation).to eq(false)
    end
  end

  context 'POST /peep' do
    it "creates a new peep record" do
      response = post(
        '/peep',
        content: 'Hello world'
        )
      
      expect(Peep.last.content).to eq('Hello world')
    end
  end
end

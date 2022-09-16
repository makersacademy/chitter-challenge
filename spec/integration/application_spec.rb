require_relative '../../app'
require 'date'

RSpec.describe 'Application' do
  include Rack::Test::Methods

  let(:app) { Application.new }

  describe 'POST to /login' do
    it 'returns 400 with error message if wrong password' do
      response = post(
        '/login',
        email: 'barack@gmail.com',
        password: 'newyork1'
      )
      expect(response.status).to eq 401
      expect(response.body).to include 'Wrong password. Try again'
    end

    it 'returns 400 with error message if no user found' do
      response = post(
        '/login',
        email: 'joe@gmail.com',
        password: 'newyork1'
      )
      expect(response.status).to eq 401
      expect(response.body).to include 'Cannot find user with that email address.'
    end

    it 'logs in user and redirects to homepage' do
      response = login
      expect(response.status).to eq 200
      expect_all_peeps(response)
      logout
    end
  end

  describe 'POST /logout' do
    it 'logs user out' do
      login
      response = logout
      expect(response.status).to eq 200
    end
  end

  describe 'GET to /' do

    let(:response) {get('/')}

    it 'loads homepage with all tweets' do
      expect_all_peeps(response)
    end
      
    it 'loads form for tweet submission on homepage' do
      expect(response.status).to eq 200
      expect(response.body).to include '<form action="/peeps" method="POST">'
      expect(response.body).to include '<input type="text" name="content">'
      expect(response.body).to include '<input type="submit" value="peep">'
    end

    it 'includes sign up link' do
      expect(response.status).to eq 200
      expect(response.body).to include '<a href="/signup">Sign-up</a>'
    end

    it 'includes log in link' do
      expect(response.status).to eq 200
      expect(response.body).to include '<a href="/login">Log-in</a>'
    end
  end

  describe 'POST to /peeps' do
    it 'submits new tweet and refreshes homepage' do
      login
      response = post(
        '/peeps',
        content: 'Hello, World!'
      )
      expect(response.status).to eq 201
      expect(response.body).to include '<p> Hello, World! </p>'
      expect(response.body).to include '@barackobama (Barack Obama)'
      expect_all_peeps(response)
      logout
    end

    it 'returns 400 and error message if not signed in' do
      response = post(
        '/peeps',
        content: 'Hello, World!'
      )
      expect(response.status).to eq 401
      expect(response.body).to include '<a href="/login">Log-in</a> or <a href="/signup">sign-up</a> to post a peep!'
    end

    it 'returns 400 and error message if HTML input' do
      response = post(
        '/peeps',
        content: '<script> some { code } </script>'
      )
      expect(response.status).to eq 400
      expect(response.body).to include 'Invalid input.'
    end

    it 'returns 400 and error message if blank input' do
      response = post(
        '/peeps',
        content: ''
      )
      expect(response.status).to eq 400
      expect(response.body).to include 'Invalid input.'
    end
  end

  describe 'GET to /signup' do
    it 'loads sign-up form' do
      response = get '/signup'
      expect(response.status).to eq 200
      expect(response.body).to include '<form action="/users" method="POST">'
      expect(response.body).to include '<input type="text" name="name">'
      expect(response.body).to include '<input type="text" name="username">'
      expect(response.body).to include '<input type="text" name="email">'
      expect(response.body).to include '<input type="password" name="password">'
      expect(response.body).to include '<input type="submit" value="sign-up">'
    end
  end

  describe 'POST to /users' do
    it 'creates a user' do
      response = post(
        '/users',
        name: 'Serena Williams',
        username: 'serenawilliams',
        email: 'serena@gmail.com',
        password: 'tennis1'
      )
      expect(response.status).to eq 201
      expect(User.count).to eq 4
      expect(response.body).to include '<p> just setting up my twttr </p>'
      logout
    end

    it 'returns 400 and error message if blank input' do
      response = post(
        '/users',
        name: '',
        username: 'serenawilliams',
        email: 'serena@gmail.com',
        password: 'tennis1'
      )
        expect(response.status).to eq 400
        expect(User.count).to eq 3
        expect(response.body).to include 'Invalid input.'
    end

    it 'returns 400 and error message if HTML input' do
      response = post(
        '/users',
        name: 'Serena Williams',
        username: '<script> some { code } </script>',
        email: 'serena@gmail.com',
        password: 'tennis1'
      )
      expect(response.status).to eq 400
      expect(User.count).to eq 3
      expect(response.body).to include 'Invalid input.'
    end
  end

  describe 'GET to /login' do
    it 'returns log-in page' do 
      response = get '/login'
      expect(response.status).to eq 200
      expect(response.body).to include '<p> <form action="/login" method="POST"> <p>'
      expect(response.body).to include '<p> Email: <input type="text" name="email"> </p>'
      expect(response.body).to include '<p> Password: <input type="password" name="password"> </p>'
      expect(response.body).to include '<input type="submit" value="log-in">'
    end
  end

  def expect_all_peeps(response)
    expect(response.body).to include '<p> just setting up my twttr </p>'
    expect(response.body).to include "@jack (Jack Dorsay)"
    expect(response.body).to include '<p> No one is born hating another person because of the color of his skin or his background or his religion... </p>'
    expect(response.body).to include "@barackobama (Barack Obama)"
    expect(response.body).to include '<p> Next I\'m buying Coca-Cola to put the cocaine back in </p>'
    expect(response.body).to include "@elonmusk (Elon Musk)"
  end

  def login
    post(
      '/login',
      email: 'barack@gmail.com',
      password: 'america1'
    )
  end

  def logout
    post('/logout')
  end
end
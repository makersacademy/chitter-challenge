require_relative '../../app'
require 'date'

RSpec.describe 'Application' do
  include Rack::Test::Methods

  let(:app) { Application.new }

  describe 'GET to /' do

    let(:response) {get('/')}

    it 'loads homepage with all tweets' do
      expect(response.body).to include '<p> just setting up my twttr </p>'
      expect(response.body).to include "@jack (Jack Dorsay)"
      expect(response.body).to include '<p> No one is born hating another person because of the color of his skin or his background or his religion... </p>'
      expect(response.body).to include "@barackobama (Barack Obama)"
      expect(response.body).to include '<p> Next I\'m buying Coca-Cola to put the cocaine back in </p>'
      expect(response.body).to include "@elonmusk (Elon Musk)"
    end
      
    it 'loads form for tweet submission on homepage' do
      expect(response.status).to eq 200
      expect(response.body).to include '<form action="/peeps" method="POST">'
      expect(response.body).to include '<input type="text" name="content">'
      expect(response.body).to include '<input type="submit" value="peep">'
    end

    it 'includes sign up link' do
      expect(response.status).to eq 200
      expect(response.body).to include '<a href="/sign-up">sign-up</a>'
    end

    it 'includes log in link' do
      expect(response.status).to eq 200
      expect(response.body).to include '<a href="/log-in">log-in</a>'
    end
  end

  describe 'POST to /peeps' do
    it 'submits new tweet and refreshes homepage' do
      response = post(
        '/peeps',
        content: 'Hello, World!'
      )
      expect(response.status).to eq 200
      expect(response.body).to include '<p> Hello, World! </p>'
      expect(response.body).to include '<p> just setting up my twttr </p>'
      expect(response.body).to include '<p> No one is born hating another person because of the color of his skin or his background or his religion... </p>'
      expect(response.body).to include '<p> Next I\'m buying Coca-Cola to put the cocaine back in </p>'
    end

    it 'returns 400 and error message if invalid input' do
      response = post(
        '/peeps',
        content: '<script> some { code } </script>'
      )
      expect(response.status).to eq 400
      expect(response.body).to include '<p> Invalid input. </p>'
    end
  end

  describe 'GET to /sign-up' do
    it 'loads sign-up form' do
      response = get '/sign-up'
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
      expect(response.status).to eq 200
      expect(User.count).to eq 4
      expect(response.body).to include '<p> just setting up my twttr </p>'
    end
  end
end
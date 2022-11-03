require 'spec_helper'
require 'rack/test'
require_relative '../../app'

describe Application do
  include Rack::Test::Methods
  let(:app) { Application.new }

  context 'GET /feed' do
    it 'returns list of posts' do
      response = get('/feed')
      expect(response.status).to eq(200)
      expect(response.body).to include('<h2>Latest Cheeps</h2>')
      expect(response.body).to include('Hook @captain_hook')
      expect(response.body).to include('<p>I love music! x</p>')
      expect(response.body).to include('<p>2022-10-31 07:15</p>')
    end
  end

  context 'GET /users/:id' do
    it 'returns user with ID 2' do
      response = get('/users/2')
      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Batman</h1>')
      expect(response.body).to include('@batman')
      expect(response.body).to include('<h2>Cheeps</h2>')
      expect(response.body).to include('Fighting crime is more important than music! x')
      expect(response.body).to include('ignore my post from yesterday. need tunes for batmobile. x')
    end
  end

  context 'GET /users/new' do
    it 'returns new user sign up form' do
      response = get('/users/new')
      expect(response.status).to eq(200)
      expect(response.body).to include('<form method="POST" action="/users">')
      expect(response.body).to include('<input type="text" name="name" />')
      expect(response.body).to include('<input type="text" name="username" />')
      expect(response.body).to include('<input type="text" name="email" />')
      expect(response.body).to include('<input type="password" name="password" />')
    end
  end

  context 'POST /users' do
    it 'creates a new user' do
      response = post('/users', username: 'lion_king', password: 'circl30fl1f3', 
      email: 'simba@fake.com', name: 'Simba')
      expect(response.status).to eq(200)
      expect(response.body).to include('Welcome to Chitter, Simba')
    end
  end

  context 'GET /posts/new' do
    it 'returns new post form' do
      response = get('feed/new')
      expect(response.status).to eq(200)
      expect(response.body).to include('<form method="POST" action="/feed">')
      expect(response.body).to include('<input type="text" name="content" />')
    end
  end

  context 'POST /feed' do
    it 'creates a new post' do
      response = post('/feed', content: 'going to jump ship ttyl x', user_id: 3)
      expect(response.status).to eq(200)
      get_response = get('/feed')
      expect(get_response.body).to include('going to jump ship ttyl x')
    end
  end


end
require 'spec_helper'
require 'rack/test'
require_relative '../../app'
require 'bcrypt'

describe Application do
  include Rack::Test::Methods
  let(:app) { Application.new }

  context 'GET /feed' do
    it 'returns list of posts' do
      response = get('/feed')
      expect(response.status).to eq(200)
      expect(response.body).to include('<h2>Latest Cheeps</h2>')
      expect(response.body).to include('Hook <a href="/users/3">@captain_hook</a>')
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
      get_response = get('/feed')
      expect(get_response.body).to include('going to jump ship ttyl x')
    end
  end

  context 'GET /login' do
    it 'returns login page' do
      response = get('/login')
      expect(response.status).to eq(200)
      expect(response.body).to include('<form method="POST" action="/login">')
      expect(response.body).to include('<input type="text" name="email" />')
      expect(response.body).to include('<input type="password" name="password" />')
    end
  end

  context 'POST /login' do
    it 'logs user in' do
      response = post('/login', email: 'sia@fake.com', password: 'musicl0v3r')
      expect(response.status).to eq(302)
      feed = get('/feed')
      expected_body = '<p>Welcome to Chitter, Sia. Join the conversation. Peep something.</p>'
      expect(feed.body).to include(expected_body)
      expect(feed.body).to include('<li><a href="/logout">Log out</a></li>')
    end
  end

  context 'GET /logout' do
    it 'logs user out' do
      post('/login', email: 'sia@fake.com', password: 'musicl0v3r')
      response = get('/logout')
      expect(response.status).to eq(302)
      feed = get('/feed')
      expected_body = '<p>Welcome to Chitter. Log in or <a href="/users/new">sign up</a> to join the conversation.</p>'
      expect(feed.body).to include(expected_body)
      expect(feed.body).to include('<li><a href="/users/new">Sign up</a></li>')
    end
  end


end
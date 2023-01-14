require 'spec_helper'
require 'rack/test'
require_relative '../app'

def reset_table
  seed_sql = File.read('spec/test_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe App do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { App.new }
  before(:all) { reset_table }
  after(:each) { expect(@request.status).to eq 200 }

  context 'GET /' do
    it 'returns status 200 and index page' do
      @request = get('/')
      expect(@request.body).to include('Posts')
    end
  end

  context 'GET /login' do
    it 'returns a login form' do
      @request = get('/login')
      expect(@request.body).to include('Log in')
    end
  end

  context 'POST /login' do
    it 'returns a customised homepage' do
      @request = post('/login', username: 'username2', password: 'password2')
      expect(@request.body).to include('Hello name2')
    end
  end

  context 'POST /logout' do
    it 'logs out and returns to index' do
      @request = post('/logout/2')
      expect(@request.body).to include('Posts')
    end
  end

  context 'POST /create_user' do
    it 'adds a new user to the database' do
      @request = post('/create_user', name: 'test5', username: 'username5', email: 'email5', password: 'password5')
      expect(@request.body).to include("You're all signed up")
      reset_table
    end
  end

  context 'POST /create_user with duplicate email' do
    it 'returns an error page' do
      @request = post('/create_user', name: 'test5', username: 'username5', email: 'email1', password: 'password5')
      expect(@request.body).to include("username or email already exists")
      reset_table
    end
  end

  context 'POST /create_user with duplicate username' do
    it 'returns an error page' do
      @request = post('/create_user', name: 'test5', username: 'username2', email: 'email5', password: 'password5')
      expect(@request.body).to include("username or email already exists")
      reset_table
    end
  end

  context 'GET /register' do
    it 'returns register page' do
      @request = get('/register')
      expect(@request.body).to include('Sign up')
    end
  end

  context 'POST /create' do
    it 'adds a post to the database' do
      @request = post('/create', message: 'Test me out punk', user_id: '2')
      expect(@request.body).to include('Test me out punk')
    end
  end

  context 'POST /delete_post' do
    it 'deletes a post' do
      @request = post('/delete_post/1')
      posts = PostRepo.new
      expect(posts.all.length).to eq(2)
    end
  end

  context 'POST /delete_post' do
    it 'deletes a post' do
      @request = post('/delete_post/2')
      posts = PostRepo.new
      expect(posts.all.length).to eq(1)
    end
  end

  context 'POST /delete_user' do
    it 'deletes a user' do
      @request = post('/delete_user/1')
      users = UserRepo.new
      expect(users.all.length).to eq(1)
    end
  end
end

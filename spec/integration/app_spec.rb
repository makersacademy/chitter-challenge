require "spec_helper"
require "rack/test"
require_relative '../../app'


def reset_chitter_table
  seed_sql = File.read('spec/seeds.sql')
  if ENV["PG_password"] 
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test', password: ENV["PG_password"] })
  else
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test'})
  end
  connection.exec(seed_sql)
end


describe Application do
  before(:each) do 
    reset_chitter_table
  end
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context 'GET /' do
    it 'should return all post ' do
      response = get('/')

      expect(response.status).to eq(200)
      expect(response.body).to include('All Posts')
      expect(response.body).to include('Content: content01')
      expect(response.body).to include('Author: <a href="/user/2">Anna</a>')
    end
  end

  context 'GET /user/:user_id' do
    it 'should return all post from user Anna ' do
      response = get('/user/2')

      expect(response.status).to eq(200)
      expect(response.body).to include("Anna's Posts")
      expect(response.body).to include('Content: content02')
      expect(response.body).to include('Content: content03')
    end
  end

  context 'POST /users' do
    it 'should validate user parameters ' do
      response = post('/users', invalid_user_name: 'ha', another_invalid_thing: 123)

      expect(response.status).to eq(400)
    end
  end

  context 'POST /posts' do
    it 'should validate post parameters ' do
      response = post('/posts', invalid_user_title: 'title', another_invalid_thing: 123)

      expect(response.status).to eq(400)
    end
  end

  context 'GET /users/new' do
    it 'should return the form to add a new user' do
      response = get('/users/new')

      expect(response.status).to eq(200)
      expect(response.body).to include('<form method="POST" action="/users">')
      expect(response.body).to include('<input type="text" name="name" />')
      expect(response.body).to include('<input type="text" name="email" />')
      expect(response.body).to include('<input type="text" name="username" />')
    end
  end

  context 'GET /posts/new' do
    it 'should return the form to add a new post' do
      response = get('/posts/new')

      expect(response.status).to eq(200)
      expect(response.body).to include('<form method="POST" action="/posts">')
      expect(response.body).to include('<input type="text" name="title" />')
      expect(response.body).to include('<input type="text" name="content" />')
    end
  end
end
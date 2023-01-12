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

  # context 'GET /login' do
  #   it 'returns a login form' do
  #   end
  # end

  # context 'POST /create' do
  #   it '' do
  #   end
  # end

  context 'POST /delete_post' do
    it 'deletes a post' do
      @request = post('/delete_post/1')
      posts = PostRepo.new
      expect(posts.all.length).to eq(1)
    end
  end
  context 'POST /delete_post' do
    it 'deletes a post' do
      @request = post('/delete_post/2')
      posts = PostRepo.new
      expect(posts.all.length).to eq(0)
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

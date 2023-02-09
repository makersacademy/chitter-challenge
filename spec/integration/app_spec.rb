require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  def reset_tables
    seed_sql = File.read('seeds/test_seed.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'twitter_database_test' })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_tables
  end
  
  context 'GET to /posts' do
    it 'returns a list of all posts in HTML form' do
      response = get('/posts')

      expect(response.status).to eq 200
      expect(response.body).to include('<h1>Posts</h1>') 
      expect(response.body).to include('Title')
      expect(response.body).to include('Ryan Lai')
      expect(response.body).to include('Title 2')
      expect(response.body).to include('Ryan Lai')
    end
  end

  context 'GET to /posts/new' do
    it 'sends a POST request to /posts' do
      response = get('/posts/new')

      expect(response.status).to eq 200
      expect(response.body).to include('<form action="/posts" method="POST">')
    end
  end

  context 'fill in the new post form and submit' do
    it ' POST to /posts and returns no content, status is 200 OK' do
      title = 'I luv bread'
      contents = 'bread bread bread'

      response = post('/posts', title: title, contents: contents)
      expect(response.status).to eq 302

      response = get('/posts')
      expect(response.body).to include('<h2>I luv bread</h2>')
      expect(response.body).to include('<p>bread bread bread</p>')
    end
  end

  context 'GET to /users/sign-up' do
    it 'sends a POST request to /users' do
      response = get('/users/login')

      expect(response.status).to eq 200
      expect(response.body).to include('<form action="/users/login" method="POST">')
    end
  end

  # context 'POST to /artists' do
  #   it 'returns no content, status is 200 OK' do
  #     name = 'Teresa Teng'
  #     genre = 'Pop'

  #     response = post('/artists', name: name, genre: genre)
  #     expect(response.status).to eq 200

  #     response = get('/artists')
  #     expect(response.body).to include('Name: Teresa Teng')
  #   end
  # end

end

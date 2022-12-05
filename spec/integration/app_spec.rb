require "spec_helper"
require "rack/test"
require_relative '../../app'

def reset_users_peeps_table
  seed_sql = File.read('spec/users-peeps_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  before :each do
    reset_users_peeps_table
  end

  context 'GET /' do 
    it "returns homepage of peeps" do 
      response = get('/')

      expect(response.status).to eq 200 
      expect(response.body).to include 'Latest Peeps'
      expect(response.body).to include 'Message: COMING HOME!'
    end 
  end

  context 'GET /signup' do 
    it "returns signup page" do 
      response = get('/signup') 

      expect(response.status).to eq 200 
      expect(response.body). to include '<form action="/signup" method="POST">'
      expect(response.body). to include '<input type="text" name="email" />'
      expect(response.body). to include '<input type="text" name="password" />'
      expect(response.body). to include '<input type="text" name="name" />'
      expect(response.body). to include '<input type="text" name="username" />'
      expect(response.body). to include '<input type="submit">'
    end 
  end

  context 'POST /signup' do 
    it "makes new user through sign up form" do 
      response = post('/signup', email: 'testing@gmail.com', password: 'test123', name: 'Test', username: 'test')
      expect(response.status).to eq 200 
      expect(response.body).to include '<h2>Sign up Done! test</h2>'
      expect(response.body).to include '<a href="/">Homepage</a>'
    end 
  end

  context 'GET /peeps' do 
    it "gets full list of peeps on the homepage" do 
      response = get('/peeps')

      expect(response.status).to eq 200 
      expect(response.body).to include 'SCORE'
    end 
  end

  context 'POST /peeps' do 
    it "posts a peep" do 
      response = post('/peeps', message: 'Rashford needs to start!', time: '2022-12-04 13:50:00', user_id: 3)

      expect(response.status).to eq 200 
      expect(response.body).to include 'Rashford needs to start!'
    end 
  end 
end 

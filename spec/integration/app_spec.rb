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
    it "returns homepage of signup or login" do 
      response = get('/')

      expect(response.status).to eq 200 
      expect(response.body).to include ('<title>CHITTER</title>')
    end 
  end

  context 'POST /' do 
    it "creates new user and confirmation page" do 
      response = post('/', email: "", password: "", name: "", username: "" )

      expect(response.status).to eq 200 
      expect(response.body).to include ('<h2>Sign Up Successfully Complete!</h2>')
    end 
  end

  context 'GET /login' do 
    it "returns login page" do 
      response = get('/login') 

      expect(response.status).to eq 200 
      expect(response.body). to include '<form action="/login" method="POST">'
      expect(response.body). to include '<input type="text" name="password" minlength="8" maxlength="8" required><br /><br />'
      expect(response.body). to include '<input type="text" name="username" maxlength="100" required><br /><br />'
      expect(response.body). to include '<input type="submit" value="Login" class="button">'
    end 
  end

  context 'POST /login' do 
    it "logs new user in" do 
      response = post('/login', email: 'testing@gmail.com', password: 'test123', name: 'Test', username: 'test')
      expect(response.status).to eq 302 
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
      response = post('/peeps', message: 'SCORE', time: '2022-11-29 11:00:00', user_id: 2)

      expect(response.status).to eq 200
      expect(response.body).to include 'SCORE'
    end 
  end 
end 

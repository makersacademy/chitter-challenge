require "spec_helper"
require "rack/test"
require_relative '../../app'

def reset_table
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
  connection.exec(seed_sql)
end

RSpec.describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  before(:each) do 
    reset_table
  end

  context 'GET /' do
    it 'returns the homepage where a user can sign up or login' do
      response = get('/')

      expect(response.status).to eq 200
      expect(response.body).to include 'Chitter'
      expect(response.body).to include 'Sign up'

      expect(response.body).to include '<form action="/submit" method="POST">'
      expect(response.body).to include '<input type="text" name="email" placeholder="email">'
      expect(response.body).to include '<input type="text" name="password" placeholder="password">'
    end
  end

  context 'GET /signup' do
    xit 'returns the homepage where a user can sign up or login' do
      response = get('/signup')

      expect(response.status).to eq 200
      expect(response.body).to include 'Chitter'
      expect(response.body).to include '<form action="/submit" method="POST">'
      expect(response.body).to include '<input type="text" name="email">'
      expect(response.body).to include '<input type="text" name="password">'
      expect(response.body).to include '<input type="text" name="name">'
      expect(response.body).to include '<input type="text" name="username">'
    end
  end


  context 'POST /' do
    xit 'returns the login_success page with a list of peeps' do
      response = post('/', email: 'nschlosser@hotmail.com', password: 'ABCD')

      expect(response.status).to eq 200
      expect(response.body).to include 'Chitter'
      # expect(response).to include '<h2>Naomi Schlösser</h2>'
      # expect(response).to include '<h3>nschlosser</h3>'
      # expect(response.body).to include '10:46 10/08/2022'
      expect(response.body).to include 'Good morning everyone!'
    end

    xit 'returns an login_error page when given an incorrect email' do
      response = post('/', email: 'WRONG_EMAIL', password: 'ABCD')

      expect(response.status).to eq 400
      expect(response.body).to include '<h1>Incorrect email or password. <a href="/">Try again</a></h1>'
    end

    xit 'returns an login_error page when given an incorrect password' do
      response = post('/', email: 'nschlosser@hotmail.com', password: 'WRONG_PASSWORD')

      expect(response.status).to eq 400
      expect(response.body).to include '<h1>Incorrect email or password. <a href="/">Try again</a></h1>'
    end
  end
end
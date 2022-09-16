require "spec_helper"
require "rack/test"
require_relative '../../app'

def reset_tables
  seed_sql = File.read('spec/seeds/seeds_tests.sql')
  user = ENV['PGUSER1']
  password = ENV['PGPASSWORD']
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test', user: user, password: password })
  connection.exec(seed_sql)
end

describe Application do

# tests for status 404 responses - WIP

  before(:each) do
    reset_tables
  end

  include Rack::Test::Methods

  let(:app) { Application.new }

  context 'GET /users/signup' do
    it 'returns homepage' do
      response = get('/users/signup')

      expect(response.status).to eq(200)
      expect(response.body).to include('<h2>Create a New Account!</h2>')
      expect(response.body).to include('<form action="/users/signup" method="POST">')
      expect(response.body).to include('<input type="text" name="email"')
      expect(response.body).to include('<input type="password" name="password"')
      expect(response.body).to include('<input type="text" name="f_name"')
      expect(response.body).to include('<input type="text" name="handle"')
      expect(response.body).to include('<input type="submit" value="Sign up!">')
    end
  end
end
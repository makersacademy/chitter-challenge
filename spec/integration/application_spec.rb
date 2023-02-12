require 'spec_helper'
require 'rack/test'
require_relative '../../app'

RSpec.describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  before(:each) do
    peep_seeds_sql = File.read("spec/seeds/peeps_seeds.sql")
    user_seeds_sql = File.read("spec/seeds/users_seeds.sql")
    connection = PG.connect({ host: "127.0.0.1", dbname: "chitter_database_test" })
    connection.exec(peep_seeds_sql)
    connection.exec(user_seeds_sql)
  end

  context 'GET /' do
    it 'shows a list of peeps with usernames and time they were posted' do
      response = get('/')

      expect(response.status).to eq 200
      expect(response.body).to include 'loving chitter'
      expect(response.body).to include '<h1>Chitter</h1>'
    end
  end

  context 'GET /sign-up' do
    it 'provides an html form for the user to sign up to Chitter' do
      response = get('/sign-up')

      expect(response.status).to eq(200)
      expect(response.body).to include('<form action="/sign-up" method="POST">')
    end
  end

  context 'POST /sign-up' do
    it 'creates a new user in the database' do
      response = post('/sign-up',name:'user four', email:'user_four@gmail.com', pass_word:'password4', username:'user_four')
    
      expect(response.status).to eq(200)
      expect(response.body).to eq('')
    end
  end
end
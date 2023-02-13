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

  context 'GET /peep' do
    it 'provides an html form for the user to post a peep' do
      response = get('/peep')

      expect(response.status).to eq(200)
      expect(response.body).to include('<form action="/peep" method="post">')
    end
  end

  context 'POST /peep' do

    it 'returns an error message if given a username that does not exist' do
      response = post('/peep', message: 'Test', username: 'nonexistent_user')

      expect(response.status).to eq(200)
      expect(last_response.body).to include('No user found with username: nonexistent_user')
    end

    it 'creates a new peep and adds it to the database' do
      response = post('/peep', message:'testing testing', time_posted: Time.now.strftime("%H:%M:%S"), user_id: 3)
      
      expect(response.status).to eq(200)
      
      peep_repo = PeepRepository.new
      all_peeps = peep_repo.all
      expect(all_peeps.length).to eq 6
      
    end
  end
end
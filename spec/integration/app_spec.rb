require 'spec_helper'
require 'rack/test'
require_relative '../../app'

def reset_tables
  seed_sql = File.read('spec/chitter_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_challenge_test' })
  connection.exec(seed_sql)
end

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  before(:each) do
    reset_tables
  end
  
  after(:each) do
    reset_tables
  end

  context 'GET to /feed' do
    it 'returns a list of peeps as HTML' do
      response = get('/feed')
      expect(response.status).to eq 200

      expect(response.body).to include 'First peep on chitter!'
      expect(response.body).to include 'How do I use this thing?'
      expect(response.body).to include 'Here we go!'
    end
  end

  context 'POST to /feed' do
    it 'adds a peep to the database' do
      response = post('/feed', content: 'Posting for the first time!', 
timestamp: '2023-01-11 13:40:00', user_id: 3)
      expect(response.status).to eq 200
      repo = PeepRepository.new
      peeps = repo.all
      expect(peeps.first.content).to eq 'Posting for the first time!'
    end
  end

end

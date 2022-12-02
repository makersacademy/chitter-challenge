require_relative '../../app'
require "spec_helper"
require "rack/test"

def reset_tables
  seed_sql = File.read('spec/seeds/chitter_test_db.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  before(:each) do 
    reset_tables
  end

  context 'GET /' do 
    it 'returns the homepage' do 
      response = get('/')

      expect(response.status).to eq(200)
      expect(response.body).to include('My third post')
      expect(response.body).to include('I am a transformer')
      expect(response.body).to include('My first post')
    end
  end
end
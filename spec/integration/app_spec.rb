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
    it 'returns the homepage with a list of peeps' do
      response = get('/')

      expect(response.status).to eq 200
      expect(response.body).to include 'Chitter'
      # expect(response).to include '<h2>Naomi Schlösser</h2>'
      # expect(response).to include '<h3>nschlosser</h3>'
      # expect(response.body).to include '10:46 10/08/2022'
      expect(response.body).to include 'Good morning everyone!'
    end
  end
end
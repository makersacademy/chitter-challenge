require "spec_helper"
require "rack/test"
require_relative '../../app'
def reset_tables
  peeps_seed_sql = File.read('spec/seeds/peeps_seeds.sql')
  makers_seed_sql = File.read('spec/seeds/makers_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(peeps_seed_sql)
  connection.exec(makers_seed_sql)
end

describe Application do
before(:each) do 
  reset_tables
  reset_tables
end
  
include Rack::Test::Methods
let(:app) { Application.new }

  context 'GET to /' do
    it 'returns 200 OK showing title' do
      response = get('/')

      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Chitter</h1>')
    end

    it 'returns list of peeps in reverse order' do
      response = get('/')
      
      maker_2_index = response.body.index('Maker: 2')
      maker_1_index = response.body.index('Maker: 1')
      
      expect(response.status).to eq(200)
      expect(maker_2_index < maker_1_index).to eq(true)
    end

    xit 'includes Maker namne and username' do
      response = get('/')

      expect(response.status).to eq(200)
      expect(response.body).to include('Chris')
      expect(response.body).to include('cast')

    end

  end

end

require 'spec_helper'
require 'rack/test'
require_relative '../../app'

def reset_tables
  seed_sql = File.read('spec//seeds/app_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_site_test' })
  connection.exec(seed_sql)
end

DatabaseConnection.connect('chitter_site_test')

RSpec.describe Application do
  before(:each) do
    reset_tables
  end

  include Rack::Test::Methods

  let(:app) { Application.new }

  context 'GET /' do
    it 'lists all peeps with names' do
      response = get('/')

      expect(response.status).to eq 200
      expect(response.body).to include('<h1>Chitter</h1>')
      expect(response.body).to include('Louis (lpc) says:')
      expect(response.body).to include('First post')
      expect(response.body).to include('- 12:00:00')
      expect(response.body).to include('Louis (lpc) says:')
      expect(response.body).to include('Second post')
      expect(response.body).to include('- 13:00:00')
    end
  end

  context "POST /peep" do
    it 'returns 200 OK with valid username' do
      # Assuming the username already exisis
      response = post(
        '/peep',
        content: "New peep posted",
        username: "lpc"
      )

      expect(response.status).to eq(200)
      expect(response.body).to include('New peep posted')
    end

    it 'returns 400 with invalid username' do
      response = post(
        '/peep',
        content: "New peep posted",
        username: "unknown"
      )

      expect(response.status).to eq 400
      expect(response.body).to include('<div>This user (unknown) does not exist...</div>')
      expect(response.body).to include('<div>Please sign up first</div>')
    end
  end
end

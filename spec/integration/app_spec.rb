require 'spec_helper'
require 'rack/test'
require_relative '../../app'

def reset_users_table
  seed_sql = File.read('spec/seeds/users_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

def reset_peeps_table
  seed_sql = File.read('spec/seeds/peeps_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe Application do
  before(:each) do
    reset_peeps_table
    reset_users_table
  end

  include Rack::Test::Methods

  let(:app) { Application.new }

  context 'GET /' do
    it 'returns 200 OK' do
      response = get('/')
      expect(response.status).to eq(200)
    end

    it 'returns the homepage' do
      response = get('/')
      expect(response.status).to eq(200)
      expect(response.body).to include("<h1>Chitter 1.0.0</h1>")
      expect(response.body).to include('<h2>We might be in <span style="color: #0ABAB5;">BETA</span>, but we are all <span style="color: #0ABAB5;">ALPHA</span>s!</h2>')
      expect(response.body).to include("<h3>Recent peeps: </h3>")
    end

    it 'returns the recent peeps' do
      response = get('/')
      expect(response.body).to include("Content:")
      expect(response.body).to include("2023-03-04 12:01:49")
      expect(response.body).to include("Likes: 0")
      expect(response.body).to include("Author: Konrad")
      expect(response.body).to include("Username: <b>kdun</b>")
    end
  end

end
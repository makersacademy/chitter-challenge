require "spec_helper"
require "rack/test"
require_relative '../app'

def reset_chitter_db
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe Application do
  before(:each) do 
    reset_chitter_db
  end
  
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods
  let(:app) { Application.new }
  
  context "GET /" do
    it 'shows the Feed' do
      response = get('/')
      expect(response.status).to eq(200)
      expect(response.body).to include("<h1>Chitter</h1>")
      expect(response.body).to include("Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
    end
  end
  
  context "GET /peep/:id" do
    it "returns a specific Peep" do
      response = get('/peep/4')
      expect(response.status).to eq(200)
      expect(response.body).to include("Labore et dolore magna aliqua.")
    end
  end
end

require "spec_helper"
require "rack/test"
require_relative '../../app'

def reset_tables
  seed_sql = File.read('spec/seeds/seeds_chitter.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe Application do
  include Rack::Test::Methods
  let(:app) { Application.new }
  before(:each) { reset_tables }

  context "get '/' route " do
    it "returns 200 OK and a list of peeps" do
      response = get('/')
      expect(response.status).to eq 200
      expect(response.body).to include()
    end
  end

  context "get '/new route" do
    it "returns 200 OK and the form for a new peep" do
      response = get('/new')
      expect(response.status).to eq 200
    end
  end
end

require "spec_helper"
require "rack/test"
require_relative '../../app'

def reset_users_peeps_tables
  seed_sql = File.read('spec/seeds_users_peeps.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  before(:each) do 
    reset_users_peeps_tables
  end
  
  context "GET /" do
    it "returns homepage" do
      response = get('/')

      expect(response.status).to eq 200
      expect(response.body).to include '<h1>Welcome to Chitter</h1>'
    end
  end

  context "GET /peeps" do
    it "returns all peeps in reverse chronological order" do
      response = get('/peeps')

      expect(response.status).to eq 200
      expect(response.body).to include '<h1>Peep Board</h1>'
    end
  end

end
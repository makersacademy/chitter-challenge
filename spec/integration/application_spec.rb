# file: spec/integration/application_spec.rb

require "spec_helper"
require "rack/test"
require_relative '../../app'

def reset_accounts_table
  seed_sql = File.read('spec/seeds/seeds_accounts.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_network_test' })
  connection.exec(seed_sql)
end

def reset_peeps_table
  seed_sql = File.read('spec/seeds/seeds_peeps.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_network_test' })
  connection.exec(seed_sql)
end


describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  before(:each) do 
    reset_accounts_table
    reset_peeps_table
  end

  context "GET /" do
    it "returns the homepage" do
      # Send a GET request to /
      # and returns a response object we can test.
      response = get("/")

      # Assert the response status code and body.
      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Welcome to Chitter!</h1>')
      expect(response.body).to include('<form action="/peeps" method="GET"/>')
      expect(response.body).to include('<label>Username</label>')
      expect(response.body).to include('<label>Password</label>')
    end
  end

  context "GET /peeps" do
    it 'returns looped list of peeps' do
      # Assuming the post with id 1 exists.
      response = get('/peeps')

      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Peeps</h1>')
      expect(response.body).to include('User ID: 1')
      expect(response.body).to include('User ID: 3')
      expect(response.body).to include('Time: 09:15:00')
      expect(response.body).to include('Time: 11:30:00')
      expect(response.body).to include('Today will be a good day')
      expect(response.body).to include('I am bored who is out?')
    end
  end
end

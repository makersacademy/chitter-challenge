require_relative "../spec_helper"
require "rack/test"
require_relative '../../app'

def reset_items_table
  seed_sql = File.read('spec/chitter_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe Application do
  before(:each) do 
    reset_items_table
  end
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context "GET /peeps" do
    it "Displays list of peeps" do
      response = get('/peeps')
      expect(response.status).to eq(200)
      expect(response.body).to include("<h1>Welcome to Chitter</h1>")
      expect(response.body).to include("<a href=\"/peeps/1\">A good day</a><br />\n")
      expect(response.body).to include("<a href=\"/peeps/2\">A bad day</a><br />\n")
      expect(response.body).to include("<a href=\"/peeps/3\">An ok day</a><br />\n")
    end
  end

  context "GET /peeps/:id" do
    it "returns content for album two'" do
      response = get('/peeps/2')
      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Chit: A bad day</h1>')
      expect(response.body).to include('Username: amy_pates')
      expect(response.body).to include('Time of post: 2023-03-08')
    end
  end
end
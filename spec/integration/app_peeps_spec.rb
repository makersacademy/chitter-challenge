require "spec_helper"
require "rack/test"
require_relative '../../app'

def reset_tables
  seed_sql = File.read('spec/seeds/seeds_tests.sql')
  user = ENV['PGUSER1']
  password = ENV['PGPASSWORD']
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test', user: user, password: password })
  connection.exec(seed_sql)
end

describe Application do

# tests for status 404 responses - WIP

  before(:each) do
    reset_tables
  end

  include Rack::Test::Methods

  let(:app) { Application.new }

  context 'GET /peeps' do
    it 'returns all peeps - latest peeps first' do
      response = get('/peeps')

      expect(response.status).to eq(200)
      expect(response.body).to include("<h1>Chitter - All Peeps!</h1>")
      # extra spacing in next test to account for the spacing in peeps.erb
      expect(response.body).to include("Latest peep is from:\n      @monica0")
      expect(response.body).to include("Peep 8")
      expect(response.body).to include("Monica")
      expect(response.body).to include("monica0")     
      expect(response.body).to include("Peep 1")
      expect(response.body).to include("Wendy")
      expect(response.body).to include("wendy0")
    end
  end

  context "GET /peeps/new" do
    it "returns a form to add a new peep" do
      response = get("/peeps/new")
      
      expect(response.status).to eq(200)
      expect(response.body).to include('<form action="/peeps" method="POST">')
      expect(response.body).to include('What do you want to say?')      
      expect(response.body).to include('<input type="text" name="content">')
      # how do we insert the current time in same SQL format...?
      expect(response.body).to include('<input type="text" name="user_f_name">')
      expect(response.body).to include('<input type="text" name="user_handle">')
      expect(response.body).to include('<input type="submit" value="Peep!">')
    end
  end
  
end

require "spec_helper"
# require "rack/test"
require_relative '../../chitter_app'

describe ChitterApp do
  include Rack::Test::Methods

  let(:app) { ChitterApp.new }

  def reset_tables
    seed_sql = File.read('spec/seeds/chitter_seed.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_tables
  end

  describe "GET /peeps" do
    it "displays a list of peeps in reverse chronological order" do
      get "/peeps"

      #last_response is a method from Rack::Test which is better than using the response variable
      #instead of .status).to eq 200, we can use .be_ok which is a method from Rack::Test
  
      expect(last_response).to be_ok
      expect(last_response.body).to include("Going to the beach tomorrow")
      expect(last_response.body).to include("Can't wait for the weekend")
      expect(last_response.body).to include("Just finished a long day at work")
    end
  end
end
  

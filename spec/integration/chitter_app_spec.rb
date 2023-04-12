require "spec_helper"
require "rack/test"
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

  # describe "GET /peeps" do
  #   it "displays a list of peeps in reverse chronological order" do
  #     response = get "/peeps"

  #     # last_response is a method from Rack::Test which is better than using the response variable
  #     # instead of .status).to eq 200, we can use .be_ok which is a method from Rack::Test

  #     expect(response.status).to eq 200
  #     expect(response)
  #     expect(response.body).to include("Going to the beach tomorrow")
  #     expect(response.body).to include("Can't wait for the weekend")
  #     expect(response.body).to include("Just finished a long day at work")
  #   end
  # end

  describe "GET /peeps" do
    it "displays a list of peeps in reverse chronological order" do
      response = get "/peeps"
      expect(response.status).to eq 200
  
      expected_peeps = [
        "Going to the beach tomorrow",
        "Can't wait for the weekend",
        "Just finished a long day at work",
        "I love Chitter!",
        "This is a test peep",
        "Hello, world!"
      ]
  
      actual_peeps = response.body.scan(/<p class="peep__content">(.+)<\/p>/).flatten
      expect(actual_peeps).to eq(expected_peeps)
    end

    it "displays the username of peeper" do
      response = get "/peeps"
      expect(response.status).to eq 200
    
      expected_username = "orangeman"
      actual_username = response.body.scan(/<p class="peep__username">(.+)<\/p>/).flatten.first
    
      expect(actual_username).to eq(expected_username)
    end
  end  
end
  

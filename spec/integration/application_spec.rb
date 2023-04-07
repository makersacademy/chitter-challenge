require "spec_helper"
require "rack/test"
require_relative '../../app'
require 'peep_repository'
require 'user_repository'

def reset_tables
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods
  
  before(:each) do 
    reset_tables
  end

  let(:app) { Application.new }

  context "homepage" do
    it "displays a list of existing peeps" do
      response = get('/')
      expect(response.status).to eq 200
    #   expect(response.body).to include "<h1>Welcome to Chitter</h1>"
    #   expect(response.body).to include "Today I coded"
    #   expect(response.body).to include "Today I relaxed"
    end
  end

end
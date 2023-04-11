require "spec_helper"
require "rack/test"
require_relative "../app"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  def reset_tables
    seed_sql = File.read('spec/seeds/chitter_seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_challenge_test' })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_tables
  end

  context "GET /" do
    it "displays a list of all peeps in reverse chronological order" do
      response = get("/")
      expect(response.status).to eq 200
      expect(response.body).to include 'Content: This is my first peep!'
      expect(response.body).to include 'Username: @mrbobby'
    end
  end

end

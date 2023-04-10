require "spec_helper"
require "rack/test"
require_relative "../../app"

def reset_tables
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect(host: '127.0.0.1', dbname: 'chitter_test')
  connection.exec(seed_sql)
end

describe Application do
  before :each do
    reset_tables
  end

  describe "Homepage" do
    # This is so we can use rack-test helper methods.
    include Rack::Test::Methods

    let(:app) { Application.new }

    it "displays all peeps in reverse chronological order" do
      response = get('/')
      expect(response.status).to eq(200)
      expect(response.body).to match(/Big Brother is watching you @wsmith[\s\S]*@wsmith & @smhanna - this is jam hot, this is jam hot[\s\S]*We shall meet in the place where there is no darkness/)
    end
    xit "Displays the peep author's name and username" do
      response = get('/')
      expect(response.body).to include("Author: @tcarmichael - Tom Carmichael-Mhanna")
      expect(response.body).to include("Author: @smhanna - Sarwah Mhanna")
    end

    context "When the user is logged in" do
      xit "Displays the form to post a new peep" do
      end
    end
  end
end
require "spec_helper"
require "rack/test"
require_relative '../../app'

def reset_tables
  sql_seed = File.read('spec/seeds/seeds_peeps.sql')
  connection = DatabaseConnection.connect
  connection.exec(sql_seed)
end

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  before(:each) do
    reset_tables
  end

  context "GET /peeps" do
    it "Returns an HTML view with all peeps in reverse chronological order" do
      get_response = get("/peeps")

      expect(get_response.status).to eq 200
      expect(get_response.body).to include(
        '<h1>Chitter</h1>',
        '<h3>TSeleiro</h3>',
        '<p>My third peep</p>',
        '<p>2022-11-03 07:13:49</p>'
      )
      # We check that the most recent entry is followed by the second most recent
      expect(get_response.body).to match(
        /<p>2022-11-03 07:13:49<\/p>\s*?<\/div>\s*?<div>\s*?<h3>RKirkbride<\/h3>/
      )
    end
  end

  context "POST /peeps" do
    it "Sends error status when wrong / no body parameters are given" do
      post_response = post("/peeps",
        fake_param_1: "aksdjh",
        fake_param_2: "ldsjfl"
      )
      expect(post_response.status).to eq 400
      expect(post_response.body).to include(
        '<h1>ArgumentError:</h1>',
        '<p>Cannot have empty fields in the peep form</p>',
        '<a href="/peeps"><h3>Return to Peeps</h3></a>'
      )

      post_response = post("/peeps")
      expect(post_response.status).to eq 400
      expect(post_response.body).to include(
        '<h1>ArgumentError:</h1>',
        '<p>Cannot have empty fields in the peep form</p>',
        '<a href="/peeps"><h3>Return to Peeps</h3></a>'
      )
    end
  end
end

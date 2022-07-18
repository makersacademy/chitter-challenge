require "spec_helper"
require "rack/test"
require_relative "../../app"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  def reset_tables
    seed_sql = File.read("schemas/chitter_test.sql")
    connection = PG.connect({ host: "127.0.0.1", dbname: "chitter_test" })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_tables
  end

  context "GET /" do
    it "returns the home page" do
      response = get("/")

      expect(response.body).to include ("<h1>Chitter</h1>")
      expect(response.body).to include ("<h2>Here are all the latest peeps!</h2>")
    end
  end
end

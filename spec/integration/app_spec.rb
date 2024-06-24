require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  def reset_tables
    seed_sql = File.read('spec/seeds/chitter_seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_data' })
    connection.exec(seed_sql)
  end
  
  before(:each) do 
    reset_tables
  end
  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context "GET /" do
    it "displays the homepage" do
      response = get("/")

      expect(response.status).to eq 200
      expect(response.body).to include("<title>Chitter</title>")
      expect(response.body).to include("<h1>Chitter</h1>")
      expect(response.body).to include('<form method="POST" action="/send">')
      expect(response.body).to include('<input class="text-field" type="text" name="content" placeholder="Peep something..." required><br>')
      expect(response.body).to include('<input class="button" type="submit" value="Send">')
    end
  end

  context "POST /new" do
    it "sends a new peep" do
      response = post("/send", content: "Hello, I'm new!")

      expect(response.status).to eq 200

      response = get("/")
      expect(response.status).to eq 200
      expect(response.body).to include("Hello, I'm new!")
    end
  end
end
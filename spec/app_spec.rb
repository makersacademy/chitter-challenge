require "spec_helper"
require "rack/test"
require_relative "../app"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  def reset_tables
    seed_sql = File.read("spec/seeds/test_seeds.sql")
    connection = PG.connect({ host: "127.0.0.1", dbname: "chitter_test" })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_tables
  end

#your tests go here
  context "GET to /" do
    it "returns all peeps" do
      response = get("/")

      expect(response.status).to eq 200
      expect(response.body).to include("<h1>CHITTER</h1>")
      expect(response.body).to include("content1")
      expect(response.body).to include("2022-07-15 11:31:00")
    end

      it "contains link to signup page" do
        response = get("/")

        expect(response.status).to eq 200
        expect(response.body).to include('<a href="/signup">SIGN UP</a>')
      end
  end

    context "GET to /signup" do
      it "returns an HTML form to sign-up" do
        response = get("/signup")

        expect(response.status).to eq 200
        expect(response.body).to include('<form method="POST" action="/new_user">')
        expect(response.body).to include('<input type="text" name="name"')
        expect(response.body).to include('<input type="text" name="email"')
        expect(response.body).to include('<input type="text" name="username"')
        expect(response.body).to include('<input type="password" name="password"')
      end
    end

  

end

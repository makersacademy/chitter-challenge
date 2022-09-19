require "spec_helper"
require "rack/test"
require_relative "../../app"

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context "GET /" do
    it "returns home page with all peeps and sign in and signup links " do
      response = get("/")
      expect(response.status).to eq 200

      expect(response.body).to include(' <input type="submit" value="Join Chitter"/>')
      expect(response.body).to include('John\'s post')
      expect(response.body).to include(' <input type="submit" value="Sign in"/>')
    end
  end

  context "POST / new_post/" do
    it "adds a post" do
      response = post("/new_post/1", post: "Another post", user_id: 1)
      expect(response.status).to eq 200
      expect(response.body).to include("Another post")
    end
  end
end

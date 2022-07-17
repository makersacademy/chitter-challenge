require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context 'GET to' do
    it "returns 200 and all the peeps with the name and username of their creators" do
      response = get('/')
      expect(response.status).to eq(200)
      expect(response.body).to include("<head><h1>CHITTER</h1></head>")
      expect(response.body).to include("<head><h2>maker's chit chat</h2></head>")
      expect(response.body).to include("<a href='/signup'> SIGN UP </a><br/>")
      expect(response.body).to include("<a href='/login'> LOG IN </a><br/><br/>")
      expect(response.body).to include("<p>Anna @anna123 at 2004-10-19 10:23:54</p>")
      expect(response.body).to include("<p>I love sunshine</p>")
      expect(response.body).to include("<p>John @john123 at 2004-10-19 10:00:54</p>")
      expect(response.body).to include("<p>I like cats</p>")
      expect(response.body).to include("<div>","</div>")
    end
  end
end
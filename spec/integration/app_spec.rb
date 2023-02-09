require "spec_helper"
require "rack/test"
require_relative "../../app"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "GET /" do
    before do
      @res = get("/")
    end

    it "displays title and logo" do
      expect(@res.body).to include("h1")
      expect(@res.body).to include("Chitter")
    end

    it "display a list of peeps" do
      expect(@res.body).to include("<h3>It’s a lovely day today!</h3>")
      expect(@res.body).to include("<h3>I got a bad news this morning ;(</h3>")
    end
  end
end

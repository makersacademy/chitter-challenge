require "rack/test"

describe ChitterApp do
  include Rack::Test::Methods

  def app
    ChitterApp
  end

  describe "get /" do
    it "displays the home page" do
      get "/"
      expect(last_response).to be_ok
    end
  end

end

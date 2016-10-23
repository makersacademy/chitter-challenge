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

  describe "get /peeps/new" do
    it "displays the create new post page" do
      get "/peeps/new"
      expect(last_response).to be_ok
      expect(last_response.body).to include "New peep"
    end
  end

  # describe "post /peeps" do
  #   it "redirects to index page" do
  #     post "/peeps"
  #
  #     expect(last_response.redirect?).to be_true
  #     follow_redirect!
  #     expect(last_request.path).to eq("/")
  #
  #   end
  # end

end

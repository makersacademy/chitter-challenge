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

  describe "get /users/new_user" do
    it "displays the new user sign up page" do
      get "/users/new"
      expect(last_response).to be_ok
      expect(last_response.body).to include "Create account"
    end
  end

  describe "post /users" do
    def post_new_user
      post "/users", name: "Bob", user_name: "bob", email: "bob@example.com", password: "123"
    end

    it "creates a new user" do
      post_new_user
      user = User.first(user_name: "bob")
      expect(user.user_name).to eq "bob"
      expect(user.name).to eq "Bob"
      expect(user.email).to eq "bob@example.com"
    end

    it "sets a user id in the session" do
      post_new_user
      user = User.first(user_name: "bob")

      expect(last_request.session[:user_id]).to eq user.id
    end

    it "redirects to index page" do
      post_new_user
      expect(last_response.redirect?).to be true
      follow_redirect!
      expect(last_request.path).to eq("/")
    end
  end

  describe "get /peeps/new_peep" do
    xit "displays the create new post page if logged in" do
      get "/peeps/new"
      expect(last_response).to be_ok
      expect(last_response.body).to include "New Peep"
    end
    it "redirects to index if not logged in" do
      get "/peeps/new"

      expect(last_response.redirect?).to be true
      follow_redirect!
      expect(last_request.path).to eq("/")
    end
  end

  describe "post /peeps" do
    it "redirects to index page" do
      post "/peeps"

      expect(last_response.redirect?).to be true
      follow_redirect!
      expect(last_request.path).to eq("/")
    end
  end

end

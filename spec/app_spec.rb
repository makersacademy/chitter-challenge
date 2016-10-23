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

  describe "get /sessions/new" do
    it "displays the login page" do
      get "/sessions/new"
      expect(last_response).to be_ok
      expect(last_response.body).to include "Log in"
    end
  end

  describe "post /sessions" do
    def create_user
      user = User.create(name: "Bob", user_name: "bob1", email: "bob@bob.com", password: "123")
    end
    def login_valid
      post "/sessions", email: "bob@bob.com", password: "123"
    end
    def login_invalid
      post "/sessions", email: "bob@bob.com", password: "456"
    end
    it "sets a user id in the session when the login is authenticated" do
      create_user
      login_valid
      user = User.first(user_name: "bob1")

      expect(last_request.session[:user_id]).to eq user.id
    end

    it "shows error if email and password do not match" do
      create_user
      login_invalid

      expect(last_request.session[:user_id]).to eq nil
      expect(last_response.redirect?).to be true
      follow_redirect!
      expect(last_request.path).to eq("/sessions/new")
      expect(last_response.body).to include "Invalid email address or password."
    end

    it "redirects to index page" do
      create_user
      login_valid

      expect(last_response.redirect?).to be true
      follow_redirect!
      expect(last_request.path).to eq("/")
    end
  end

  describe "get /peeps/new_peep" do
    it "displays the create new post page if logged in" do
      user = User.create(id: 1, name: "Bob", user_name: "bob1", email: "bob@bob.com", password: "123")
      get "/peeps/new", {}, "rack.session" => { user_id: user.id }
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

  describe "post sessions/logout" do
    it "redirects to index page" do
      #tbd
    end
    it "clears session user_id" do
      #tbd
    end
  end

end

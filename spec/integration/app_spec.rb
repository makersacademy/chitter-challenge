require "spec_helper"
require "rack/test"
require "shared_context_spec"
require_relative "../../app"

describe Application do

  include Rack::Test::Methods
  
  let(:app) { Application.new }
  
  include_context "doubles setup"
  before { reset_users_table }
  before { reset_peeps_table }

  describe "GET /" do
    it "should return 200 OK" do
      response = get '/'
      expect(response.status).to eq 200
    end
    it "should return a message when there is no peeps in the table" do
      allow_any_instance_of(PeepRepository).to receive(:all) { [] }
      response = get '/'
      expect(response.body).to include("It looks like there is no peeps around")
    end
    it "should return all peeps from repository in a reverse chonological orders" do
      response = get '/'
      newest = '<p>@jdoe @changwynn guys, Have you watched the game yesterday?</p>'
      oldest = '<p>How are you guys doing, today? @jdoe @mrbike</p>'
      regexp = /.*#{Regexp.escape(newest)}.*#{Regexp.escape(oldest)}.*/m
      expect(last_response.body).to include(newest)
      expect(last_response.body).to match(regexp)
    end
  end

  describe "POST /find_user" do
    context "search for a user by username" do
      it "should redirect to the public page of a user given a username" do
        response = post '/find_user', search: "changwynn"
        follow_redirect!
        expect(last_response.status).to eq 200
        expect(last_request.path).to eq "/user/changwynn"
        expect(last_response.body).to include "<h1>changwynn</h1>"
      end
    end
    context "search for a user by email" do
      it "should redirect to the public page of a user given an email adress" do
        response = post '/find_user', search: "mike.bike@live.com"
        follow_redirect!
        expect(last_response.status).to eq 200
        expect(last_request.path).to eq "/user/mrbike"
        expect(last_response.body).to include "<h1>mrbike</h1>"
      end
    end
    context "when the user can not be found" do
      it "should display a message 'user not found'" do
        response = post '/find_user', search: "austinpower"
        follow_redirect!
        expect(last_response.status).to eq 200
        expect(last_request.path).to eq "/"
        expect(last_response.body).to include "<p>user not found</p>"
      end
    end
  end

  describe "POST /signup" do
    it "should send signup form to the database" do
      response = post "/signup", { 
        fullname: "Mariah Carey", 
        username: "caroush", 
        email: "mariah-caroush@gmail.com", 
        password: "Mariah*Caroush123"
      }
      follow_redirect!
      expect(last_response.status).to eq 200
      expect(last_request.path).to eq "/"
    end
    it "should print a message if the user already exist" do
      response = post "/signup", fullname: "Chang Huynh", username: "changwynn", email: "huynhchang@gmail.com", password: "chang*123"
      follow_redirect!
      expect(last_response.status).to eq 200
      expect(last_request.path).to eq "/signup"
      expect(last_response.body).to include '<p>This user already exist. Please login.</p>'
    end
  end

  describe "POST /login" do

    before(:each) do 
      post "/signup", {
        fullname: "Mariah Carey", 
        username: "caroush", 
        email: "mariah-caroush@gmail.com", 
        password: "Mariah*Caroush123"
      }
    end

    context "when the user successfully login" do
      it "should redirect to personalized home page" do
        post "/login", { 
          email: "mariah-caroush@gmail.com", 
          password: "Mariah*Caroush123"
        }
        follow_redirect!
        expect(last_response.status).to eq 200
        expect(last_request.path).to eq "/"
        expect(last_response.body).to include '<p>Hi, caroush!</p>'
      end
    end
    context "when the user input an incorrect password" do
      it "should display the message 'password is incorrect'" do
        post "/login", { 
          email: "mariah-caroush@gmail.com", 
          password: "Mariah*Caroush"
        }
        follow_redirect!
        expect(last_response.status).to eq 200
        expect(last_request.path).to eq "/login"
        expect(last_response.body).to include "<p>Password incorrect</p>"
      end
    end
    context "when the user is not registered" do
      it "should display an invite to signup" do
        post "/login", { 
          email: "john_wicked@gmail.com", 
          password: "JohnWicked123"
        }
        follow_redirect!
        expect(last_response.status).to eq 200
        expect(last_request.path).to eq "/login"
        expect(last_response.body).to include "<p>This email address does not exist. Please sign up.</p>"
      end
      it "should let the user out" do
        post "/login", email: "mariah-caroush@gmail.com", password: "Mariah*Caroush123"

        response = get "/logout"
        expect(last_response.status).to eq 200
        expect(last_response.body).to include '<a href="/login">Log in</a>'
        expect(last_response.body).to include '<a href="/signup">Create account</a>'
      end
    end
  end
end
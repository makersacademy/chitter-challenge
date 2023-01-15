require "spec_helper"
require_relative "../../app/helpers/session_helper"
require "rack/test"
require_relative '../../app/controllers/user_controller'
include SessionHelper

def sign_out
  get("/sign_out")
end

describe UserController do
  include Rack::Test::Methods
  let(:app) { UserController.new }

  before(:each) do
    sign_out
  end

  context "get /sign_in" do
    it "returns sign_in view page" do
      response = get("/sign_in")

      expect(response.status).to eq(200)
      expect(response.body).to include('<form action="/sign_in" method="POST">')
      expect(response.body).to include('<input name="username" placeholder="Username" />')
    end

    it "returns redirect_to_user_page view" do
      post("/sign_in", username: "abodian", password: "test")
      response = get("/sign_in")

      expect(response.status).to eq(200)
      expect(response.body).to include('<meta http-equiv="refresh" content="1; url = /user/abodian" />')
    end
  end

  context "post /sign_in" do
    it "login correct so returns redirect_to_user_page view" do
      response = post("/sign_in", username: "abodian", password: "test")

      expect(response.status).to eq(200)
      expect(response.body).to include('<meta http-equiv="refresh" content="1; url = /user/abodian" />')
    end

    it "login missing details so returns sign_in_blank view" do
      response = post("/sign_in", username: "abodian", password: "")

      expect(response.status).to eq(200)
      expect(response.body).to include('You cannot leave either the username or password blank, please try again')
    end
  end

  context "get /sign_out" do
    it "clears session and returns redirect_to_index view" do
      response = get("/sign_out")
      expect(response.body).to include('  <meta http-equiv="refresh" content="1; url = /" />')
    end
  end

  context "get /user" do
    it "returns redirect_to_index page" do
      response = get("/user")
      expect(response.status).to eq(200)
      expect(response.body).to include('  <meta http-equiv="refresh" content="1; url = /" />')
    end
  end

  context "get /user/:username" do
    it "not logged in so returns redirect_to_index view page" do
      response = get("user/abodian")
      expect(response.status).to eq(200)
      expect(response.body).to include('  <meta http-equiv="refresh" content="1; url = /" />')
    end

    it "logged in so returns user_home view" do
      post("/sign_in", username: "abodian", password: "test")
      response = get("/user/abodian")

      expect(response.status).to eq(200)
      expect(response.body).to include('<form action="/create_peep" method="GET">')
      expect(response.body).to include('<form action="/sign_out" method="GET">')
    end

    it "logged in but wrong user url so returns redirect_to_user_page view" do
      post("/sign_in", username: "abodian", password: "test")
      response = get("/user/jsmith")

      expect(response.status).to eq(200)
      expect(response.body).to include('<meta http-equiv="refresh" content="1; url = /user/abodian" />')
    end
  end

  context "get /signup" do
    it "returns a signup page" do
      response = get("/signup")

      expect(response.body).to include('<h1>Sign Up - Create a new Chitter Account</h1>')
    end

    it "logged in so returns a redirect_to_user_page view" do
      post("/sign_in", username: "abodian", password: "test")
      response = get("/signup")

      expect(response.body).to include('<meta http-equiv="refresh" content="1; url = /user/abodian" />')
    end
  end

  context "post /signup" do
    it "returns the user_created view" do
      response = post("/signup", username: "test3", email: "test@email.com", password: "test", password_verification: "test", first_name: "test", last_name: "test")

      expect(response.body).to include('<h3>Welcome to Chitter, test!</h3>')
      user = User.find_by(username: "test3")
      user.destroy
    end

    it "returns the sign_up_blank view if a field is missing" do
      response = post("/signup", username: "", email: "test@email.com", password: "test", password_verification: "test", first_name: "test", last_name: "test")

      expect(response.body).to include('You cannot leave either any of the fields blank, please try again...')
    end
  end

  context "get /create_peep" do
    it "returns create_peep view" do
      response = get("/create_peep")

      expect(response.status).to eq(200)
      expect(response.body).to include('<form action="/create_peep" method="POST">')
    end
  end

  context "post /create_peep" do
    include Mail::Matchers

    before(:each) do
      Mail::TestMailer.deliveries.clear
    end

    it "returns peep_created_redirect view" do
      post("/sign_in", username: "abodian", password: "test")
      response = post("/create_peep", content: "Test content")

      expect(response.status).to eq(200)
      expect(response.body).to include("<p>Your peep has been posted! Taking you back to your homepage...</p>")
    end

    it "sends an email when a user is tagged in a peep" do
      post("/sign_in", username: "abodian", password: "test")
      response = post("/create_peep", content: "Test content tagging in Alex Smith")
      send_tag_email("You have been tagged in an post!", "abodian@email.com", "Test content tagging in Alex Smith") { is_expected.to have_sent_email }
      expect(response.status).to eq(200)
      expect(response.body).to include("<p>Your peep has been posted! Taking you back to your homepage...</p>")
    end
  end

  context "get /create_reply/:peep_id" do
    it "create reply view" do
      response = get("create_reply/3")

      expect(response.status).to eq(200)
      expect(response.body).to include('    <input name="content" placeholder="Write your reply here:" />')
    end
  end

  context "post /create_reply/:peep_id" do
    it "returns the reply created redirect view" do
      post("/sign_in", username: "abodian", password: "test")
      response = post("/create_reply/3", content: "Test", time: Time.now.to_s, user_id: "1", peep_id: "3")

      expect(response.status).to eq(200)
      expect(response.body).to include('  <p>Your reply has been added to the post! Taking you back to your homepage...</p>')
    end
  end
end

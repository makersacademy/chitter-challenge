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

  let(:create_new_user) do
    post "/signup", {
      fullname: "Mariah Carey", 
      username: "caroush", 
      email: "mariah-caroush@gmail.com", 
      password: "Mariah*Caroush123"
    }
  end

  describe "GET /" do
    it "should return 200 OK" do
      response = get '/'
      expect(response.status).to eq 200
    end
    it "should return a message when there is no peeps in the table" do
      allow_any_instance_of(PeepRepository).to receive(:all) { [] }
      response = get '/'
      expect(response.status).to eq 200
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
    context "if the user can not be found" do
      it "should display a message 'user not found'" do
        response = post '/find_user', search: "austinpower"
        follow_redirect!
        expect(last_response.status).to eq 200
        expect(last_request.path).to eq "/"
        expect(last_response.body).to include "<p>user not found</p>"
      end
    end
    context "search by username" do
      it "should redirect to the search result public page" do
        response = post '/find_user', search: "changwynn"
        follow_redirect!
        expect(last_response.status).to eq 200
        expect(last_request.path).to eq "/user/changwynn"
        expect(last_response.body).to include "<h2><em>changwynn</em></h2>"
      end
    end
    context "search by email" do
      it "should redirect to the search result public page" do
        response = post '/find_user', search: "mike.bike@live.com"
        follow_redirect!
        expect(last_response.status).to eq 200
        expect(last_request.path).to eq "/user/mrbike"
        expect(last_response.body).to include "<h2><em>mrbike</em></h2>"
      end
    end
    context "if search is successful, redirect to the search result public page" do
      it "show a list of peeps the search result has written with date" do
        response = post '/find_user', search: "mike.bike@live.com"
        follow_redirect!
        expect(last_response.status).to eq 200
        expect(last_request.path).to eq "/user/mrbike"
        expect(last_response.body).to include "<h2><em>mrbike</em></h2>"
        expect(last_response.body).to include "<p>@jdoe @changwynn guys, Have you watched the game yesterday?</p>"
      end
    end
  end

  describe "POST /signup" do
    it "should send signup form to the database" do
      create_new_user
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
    context "when the user successfully login" do
      it "should redirect to personalized home page" do
        create_new_user
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
        create_new_user
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
    end
    context "when the user has successfully logged in" do
      it "should display a log out option" do
        create_new_user
        post "/login", email: "mariah-caroush@gmail.com", password: "Mariah*Caroush123"
        follow_redirect!
        expect(last_response.status).to eq 200
        expect(last_request.path).to eq "/"
        expect(last_response.body).to include '<p>Hi, caroush!</p>'
        get "/logout"
        follow_redirect!
        expect(last_response.status).to eq 200
        expect(last_response.body).to include '<a href="/login">Log in</a>'
        expect(last_response.body).to include '<a href="/signup">Create account</a>'
        expect(last_response.body).not_to include '<p>Hi, caroush!</p>'
      end
    end
  end

  describe "THE USER WANTS TO CREATE, EDIT OR DELETE A PEEP" do

    describe "POST to /new_peep" do
      context "should add a new peep in the database" do
        it "should add a new peep to home page" do
          create_new_user
          response = post "/new_peep", { 
            time: '2023-03-12 11:49:54.912033',
            content: 'Happy sunday everyone!',
            user_id: 2
          }
          follow_redirect!
          expect(last_response.status).to eq 200
          expect(last_request.path).to eq "/"
          expect(last_response.body).to include '<p>Happy sunday everyone!</p>'
        end
      end
    end

    describe "GET to /edit_peep" do
      it "should open the edit peep page " do
        create_new_user
        post "/new_peep", { 
          time: '2023-03-12 11:49:54.912033',
          content: 'Happy sunday everyone!',
          user_id: 4
        }
        response = get "/edit_peep/4"
        expect(response.status).to eq 200
        expect(response.body).to include 'value="Happy sunday everyone!">'
      end
    end
  
    describe "POST to /edit_peep" do
      it "should update a peep content only" do
        create_new_user
        post "/new_peep", { 
          time: '2023-03-12 11:49:54.912033',
          content: 'Happy sunday everyone!',
          user_id: 4
        }
        post "/edit_peep/4", content: 'Good afternoon everyone!'
        follow_redirect!
        expect(last_response.status).to eq 200
        expect(last_request.path).to eq "/"
        expect(last_response.body).to include '<p>Good afternoon everyone!</p>'
      end
    end

    describe "GET to /delete_peep/:id" do
      it "should redirect the user to a confirmation page" do
        response = get "/delete_peep/1"
        expect(response.status).to eq 200
        expect(response.body).to include '<h1>Delete peep</h1>'
      end
    end
    describe "POST to /delete_peep/:id" do
      it "should delete the peep and redirect the main page" do
        response = post "/delete_peep/1", delete_peep: "Yes"
        expect(response.status).to eq 302
        follow_redirect!
        expect(last_response.status).to eq 200
        expect(last_request.path).to eq "/"
        expect(last_response.body).not_to include '<p>How are you guys doing, today? @jdoe @mrbike</p>'
      end
    end
  end

  describe "THE USER VISIT ITS PRIVATE PROFILE" do

    context "GET to /:username" do
      it "should display the private main page of the user" do
        response = get "/changwynn"
        expect(response.status).to eq 200
        expect(response.body).to include '<h1>Chang Huynh</h1>'
        expect(response.body).to include '<h2><em>changwynn</em></h2>'
      end
    end
    context "GET to /:username/edit_profile" do
      it "should display the user personal information page" do
        response = get "/changwynn/edit_profile"
        expect(response.status).to eq 200
        expect(response.body).to include '<h1>Edit your profile</h1>'
        expect(response.body).to include "<h4>Chang Huynh</h4>"
        expect(response.body).to include "<h4>changwynn</h4>"
        expect(response.body).to include "<h4>huynhchang@gmail.com</h4>"
      end
    end
  end

  describe "THE USER WANT TO CHANGE ITS USERNAME OR EMAIL" do

    context "POST to /:username/edit_profile/:attribute" do
      it "should prompt the user for new username and redirect to the personal information page" do
        create_new_user
        post "/caroush/edit_profile/username", params = { new_value: "carwash", username: "caroush" }
        follow_redirect!
        expect(last_response.status).to eq 200
        expect(last_request.path).to eq "/carwash/edit_profile"
        expect(last_response.body).to include "<h4>carwash</h4>"
      end
      it "should prompt the user for new email and redirect to the personal information page" do
        create_new_user
        post "/caroush/edit_profile/email", params = { new_value: "mama@live.com", username: "caroush" }
        follow_redirect!
        expect(last_response.status).to eq 200
        expect(last_request.path).to eq "/caroush/edit_profile"
        expect(last_response.body).to include "<h4>mama@live.com</h4>"
      end
      it "should return a message if the new username is not available" do
        create_new_user
        post "/caroush/edit_profile/username", params = { new_value: "mrbike", username: "caroush" }
        follow_redirect!
        expect(last_response.status).to eq 200
        expect(last_request.path).to eq "/caroush/edit_profile/username"
        expect(last_response.body).to include "<p>This username is not available</p>"
      end
      it "should return a message if new email is not available" do
        create_new_user
        post "/caroush/edit_profile/email", params = { new_value: "mike.bike@live.com", username: "caroush" }
        follow_redirect!
        expect(last_response.status).to eq 200
        expect(last_request.path).to eq "/caroush/edit_profile/email"
        expect(last_response.body).to include "<p>This email is not available</p>"
      end
    end
  end

  describe "THE USER WANT TO CHANGE ITS PASSWORD" do

    context "GET to /:username/password" do
      it "should redirect the user to the change password page" do
        response = get "/changwynn/new_password"
        expect(response.status).to eq 200
        expect(response.body).to include "<h1>Change your password</h1>"
      end
    end
    context "POST to /:username/password" do
      it "should print a message if the current password doesn't match with the database" do
        create_new_user
        response = post "/caroush/new_password", current_password: "Mariah*Caroush12", new_password: "Mariah*"
        follow_redirect!
        expect(last_response.status).to eq 200
        expect(last_response.body).to include "<h1>Change your password</h1>"
        expect(last_request.path).to eq "/caroush/new_password"
      end
      it "should redirect to the edit profile page with a successfull update message" do
        create_new_user
        response = post "/caroush/new_password", current_password: "Mariah*Caroush123", new_password: "Mariah*"
        follow_redirect!
        expect(last_response.status).to eq 200
        expect(last_response.body).to include "<p>Password successfully updated</p>"
        expect(last_request.path).to eq "/caroush/edit_profile"
      end
    end
  end

  describe "THE USER WANT TO DELETE ITS ACCOUNT" do

    context "GET to /:username/delete_account" do
      it "should redirect the user to the delete account page" do
        response = get "/changwynn/delete_account"
        expect(response.status).to eq 200
        expect(response.body).to include "<h1>Delete account</h1>"
      end
    end
    context "POST to /:username/delete_account" do
      it "should redirect the user to the delete account page" do
        create_new_user
        response = post "/caroush/delete_account", confirmation: "confirm delete account", password: "Mariah*Caroush123"
        follow_redirect!
        expect(last_response.status).to eq 200
        expect(last_request.path).to eq "/"
        response = post "/login", username: "caroush", password: "Mariah*Caroush123"
        follow_redirect!
        expect(last_response.status).to eq 200
        expect(last_request.path).to eq "/login"
        expect(last_response.body).to include "<p>This email address does not exist. Please sign up.</p>"
      end
      it "should print a message when the user enters an incorrect input" do
        create_new_user
        response = post "/caroush/delete_account", confirmation: "onfirm delete account", password: "Mariah*Caroush123"
        follow_redirect!
        expect(last_response.status).to eq 200
        expect(last_request.path).to eq "/caroush/delete_account"
        expect(last_response.body).to include "<p>Sorry, something went wrong.</p>"
      end
    end
  end
end

# <p><%= @user_repo.find_by_id(peep.user_id).username %></p>
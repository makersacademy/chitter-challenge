require "spec_helper"
require "rack/test"
require_relative "../../app"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "GET /" do
    before do
      @res = get "/"
    end

    it "displays title and logo" do
      expect(@res.body).to include("h1")
      expect(@res.body).to include("Chitter")
    end

    it "displays a list of peeps" do
      expect(@res.body).to include("<h3>It’s a lovely day today!</h3>")
      expect(@res.body).to include("<h3>I got a bad news this morning ;(</h3>")
    end

    it "displays a log in button when no user_id is found" do
      expect(@res.body).to include("<a href=\"/login\">")
      expect(@res.body).to include("<div role=\"button\" class=\"blue-button\">Log in</div>")
    end

    it "displays a log out button and the user's name when user_id is found" do
      res = get "/", {}, { "rack.session" => { user_id: 1 } }
      expect(res.body).to include("<a href=\"/logout\">")
      expect(res.body).to include("Log in as: Terry Cheng")
    end
  end

  context "GET /new-peep" do
    it "redirects back to /login with a message when the user doesn't login" do
      get "/new-peep"
      follow_redirect!
      expect(last_response.body).to include("<h1 style=\"margin-bottom: 2rem\">Welcome to Chitter</h1>")
      expect(last_response.body).to include("You have to log in to leave a peep.")
    end

    it "displays a textarea and a submit button when the user have already logged in" do
      get "/new-peep", {}, { "rack.session" => { user_id: 1 } }
      expect(last_response.body).to include("<h1 style=\"flex: 3;\">New Peep</h1>")
    end
  end

  context "POST /new-peep" do
    it "redirects the user to /login if they haven't logged in" do
      post "/new-peep"
      follow_redirect!
      expect(last_response.body).to include "You have to log in to leave a peep."
      expect(last_response.body).to include "Welcome to Chitter"
    end

    it "displays an error message and redirects to /new-peep if an empty content is submitted" do
      post "/new-peep", {}, { "rack.session" => { user_id: 1 } }
      follow_redirect!
      expect(last_response.body).to include "New Peep"
      expect(last_response.body).to include "Content: can't be blank"
    end

    it "displays a message and redirects to / if a peep has been created" do
      post "/new-peep", { content: "This is a test tweet." }, { "rack.session" => { user_id: 1 } }
      follow_redirect!
      expect(last_response.body).to include "<h1>Chitter</h1>"
      expect(last_response.body).to include "This is a test tweet."
    end
  end

  context "GET /login" do
    it "redirects to / if the user has logged in" do
      get "/login", {}, { "rack.session" => { user_id: 1 } }
      follow_redirect!
      expect(last_response.body).to include "<h1>Chitter</h1>"
    end

    it "displays a log-in form correctly" do
      get "/login"
      expect(last_response.body).to include "Welcome to Chitter"
      expect(last_response.body).to include "form action=\"/login\" method=\"post\""
      expect(last_response.body).to include '<input type="email" name="email" id="email" placeholder="Email" />'
      expect(last_response.body).to include '<input type="password" name="password" id="password" placeholder="Password" />'
      expect(last_response.body).to include "Log in"
      expect(last_response.body).to include "<a href=\"/signup\">"
    end
  end

  context "POST /login" do
    it "displays an error message if the user enters empty inputs" do
      post "/login", { email: "", password: "" }
      follow_redirect!
      expect(last_response.body).to include "Email or password can't be empty."
    end

    it "displays an error message if the user enters an invalid email" do
      post "/login", { email: "terry@gmail.com", password: "2345" }
      follow_redirect!
      expect(last_response.body).to include "Invalid email or password. Please try again."
    end

    it "displays an error message if the user enters an invalid password" do
      post "/login", { email: "terryhycheng@gmail.com", password: "1111" }
      follow_redirect!
      expect(last_response.body).to include "Invalid email or password. Please try again."
    end

    it "redirects the user to / if successfully logged in" do
      post "/login", { email: "terryhycheng@gmail.com", password: "2345" }
      follow_redirect!
      expect(last_response.body).to include "Chitter"
      expect(last_response.body).to include "Log in as: Terry Cheng"
    end
  end

  context "GET /signup" do
    it "displays a sign up form correctly" do
      get "/signup"
      expect(last_response.body).to include "<a href=\"/\">"
      expect(last_response.body).to include "Register an account"
    end
  end

  context "POST /signup" do
    it "displays a welcome message and redirects to / if the user sccessfully registered" do
      post "/signup", {
        name: "Ken Chan",
        email: "kenchan@gmail.com",
        password: "123",
        password_confirmation: "123",
        username: "kenchan",
      }
      follow_redirect!
      expect(last_response.body).to include "You have successfully registered! Welcome to Chitter."
      expect(last_response.body).to include "Log in as: Ken Chan"
    end

    it "displays an error message if all fields are blank" do
      post "/signup"
      follow_redirect!
      expect(last_response.body).to include "Password: can't be blank"
      expect(last_response.body).to include "Email: can't be blankis invalid"
      expect(last_response.body).to include "Username: can't be blank"
      expect(last_response.body).to include "Name: can't be blank"
    end

    it "displays an error message if password doesn't match with confirmation password" do
      post "/signup", {
        name: "Ken Chan",
        email: "kenchan@gmail.com",
        password: "123",
        password_confirmation: "1234",
        username: "kenchan",
      }
      follow_redirect!
      expect(last_response.body).to include "Password_confirmation: doesn't match Password"
    end

    it "displays an error message if username has already been taken" do
      post "/signup", {
        name: "Ken Chan",
        email: "terryhycheng@gmail.com",
        password: "123",
        password_confirmation: "123",
        username: "kenchan",
      }
      follow_redirect!
      expect(last_response.body).to include "Email: has already been taken"
    end

    it "displays an error message if email has already been taken" do
      post "/signup", {
        name: "Ken Chan",
        email: "kenchan@gmail.com",
        password: "123",
        password_confirmation: "123",
        username: "terryhycheng",
      }
      follow_redirect!
      expect(last_response.body).to include "Username: has already been taken"
    end
  end

  context "GET /logout" do
    it "removes session[:user_id] and redirects to /" do
      get "/logout", {}, { "rack.session" => { user_id: 1 } }
      follow_redirect!
      expect(last_response.body).not_to include "Log in as: Terry Cheng"
      expect(last_response.body).to include "Chitter"
    end
  end
end

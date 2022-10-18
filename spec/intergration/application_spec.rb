require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "GET sign_up" do
    it "returns 200 OK and sign up form" do
      response = get("sign_up")

      expect(response.status).to eq 200
      expect(response.body).to include "<h1>Sign Up</h1>"
      expect(response.body).to include '<form action="/users" method="POST">'
      expect(response.body).to include '<input type="text" name="username">'
      expect(response.body).to include '<input type="text" name="name">'
      expect(response.body).to include '<input type="text" name="email">'
      expect(response.body).to include '<input type="text" name="password">'
    end
  end

  context "POST /users" do
    it "returns 200 OK and sign up success message" do
      response = post("/users", username: 'olivia_rodrigo', name: 'Olivia Rodrigo', email: 'olivia_rodrigo@email.com', password: "butterflies")

      expect(response.status).to eq 200
      expect(response.body).to include "<p>You have successfully signed up!</p>"
    end

    it "returns 400 if parameters are incorrect (email)" do
      response = post("/users", username: 'harry_styles', name: 'Harry Styles', email: 'harry_styles@email.co.uk', password: "cherry")

      expect(response.status).to eq 400
    end

    it "returns 400 if parameters are incorrect (username)" do
      response = post("/users", username: 'harry_styles', name: 'Harry Styles', email: 'harry_styles@email.com', password: "cherry")

      expect(response.status).to eq 400
    end

    it "returns 400 if parameters are nil" do
      response = post("/users")

      expect(response.status).to eq 400
    end
  end

  context "GET /login" do
    it "returns 200 OK and login form" do
      response = get("/login")

      expect(response.status).to eq 200
      expect(response.body).to include "<h1>Log In</h1>"
      expect(response.body).to include '<form action="/login" method="POST">'
    end
  end

  context "POST /login" do
    it "returns 200 OK and logs in" do
      response = post("/login", email: 'olivia_rodrigo@email.com', password: "butterflies")

      expect(response.body).to include "<p>You have successfully logged in!</p>"
    end

    it "returns fails" do
      response = post("/login", email: 'olivia_rodrigo@email.com', password: "butterfly")

      expect(response.body).to include '<p>Log in failed please <a href="/login">try again</a></p>'
    end
  end

  context "POST /logout" do
    it "logs the user out of the session returns 200 OK" do
      response = post("/logout")

      expect(response.status).to eq 302

      response = get("/login")

      expect(response.body).to include "<h1>Log In</h1>"
      expect(response.body).to include '<form action="/login" method="POST">'
    end
  end

  context "GET /posts" do
    it "returns all posts" do
      response = get("/posts")

      expect(response.status).to eq 200
      expect(response.body).to include "<h1>Peeps</h1>"
      expect(response.body).to include "harry_styles"
      expect(response.body).to include "watermelon sugar"
      expect(response.body).to include "billie_eillish"
      expect(response.body).to include "i just wanna watch tv"
      expect(response.body).to include "taylor_swift"
      expect(response.body).to include "tear drops on my guitar"
      expect(response.body).to include "you really know how to make me cry"
    end
  end

  context "GET /posts/new" do
    it "if logged in returns 200 OK and form page" do
      post("/login", email: 'olivia_rodrigo@email.com', password: "butterflies")

      response = get("/posts/new")

      expect(session[:user_id]).to eq 5
      expect(response.status).to eq 200
      expect(response.body).to include "<h1>Post a Peep</h1>"
      expect(response.body).to include '<form action="/posts" method="POST">'
      expect(response.body).to include '<input type="text" name="content">'
    end

    it "if not logged in redirects to login page" do
      response = get("/posts/new")

      expect(response.status).to eq 302

      response = get("/login")

      expect(response.body).to include "<h1>Log In</h1>"
      expect(response.body).to include '<form action="/login" method="POST">'
    end
  end

  context "POST /posts" do
    it "returns 200 OK and creates a new post" do
      post("/login", email: 'olivia_rodrigo@email.com', password: "butterflies")

      response = post("/posts", content: "drivers license")

      expect(response.status).to eq 200
      expect(response.body).to include "<p>Peep successfully posted!</p>"
    end

    it "returns a 400 if parameters are incorrect" do
      response = post("/posts")

      expect(response.status).to eq 400
    end
  end
end

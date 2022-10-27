require "spec_helper"
require "rack/test"
require_relative '../../app'

def reset_application_table
  seed_sql = File.read('spec/seeds/posts_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_challenge_test' })
  connection.exec(seed_sql)
end

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }
  Pony.override_options = { :via => :test }

  before(:each) do
    reset_application_table
  end

  context "root home page" do
    it "returns 200 OK and links not logged in" do
      response = get("/")

      expect(response.status).to eq 200
      expect(response.body).to include '<a href="/login">Log In</a>'
      expect(response.body).to include '<a href="/sign_up">Sign Up</a>'
      expect(response.body).to include '<a href="/posts">Peep Board</a>'
    end
  end

  context "root home page" do
    it "returns 200 OK and links logged in" do
      post("/users", username: 'olivia_rodrigo', name: 'Olivia Rodrigo', email: 'olivia_rodrigo@email.com', password: "butterflies")
      post("/login", email: 'olivia_rodrigo@email.com', password: "butterflies")

      response = get("/")

      expect(session[:user_id]).to eq 4
      expect(response.status).to eq 200
      expect(response.body).to include '<input type="submit" value="Logout" class="logout_button">'
      expect(response.body).to include '<a href="/posts">Peep Board</a>'
    end
  end

  context "GET sign_up when not logged in" do
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

    it "redirects to an error page when email has already been used" do
      response = post("/users", username: 'harry_styles', name: 'Harry Styles', email: 'harry_styles@email.co.uk', password: "cherry")

      expect(response.status).to eq 200
      expect(response.body).to include "<p>Sign up failed, this email address has already been signed up.</p>"
      expect(response.body).to include '<p>Please <a href="/sign_up">try again</a> with a different email address.</p>'
      expect(response.body).to include '<p>Or <a href="/login">log in</a>.</p>'
    end

    it "redirects to an error page when username has already been used" do
      response = post("/users", username: 'harry_styles', name: 'Harry Styles', email: 'harry_styles@email.com', password: "cherry")

      expect(response.status).to eq 200
      expect(response.body).to include "<p>Sign up failed, this username has already been used.</p>"
      expect(response.body).to include '<p>Please <a href="/sign_up">try again</a> with a different username.</p>'
      expect(response.body).to include '<p>Or <a href="/login">log in</a>.</p>'
    end

    it "redirects to an error page when fields have been left empty" do
      response = post("/users")

      expect(response.status).to eq 200
      expect(response.body).to include "<p>Sign up failed, you cannot leave any fields empty.</p>"
      expect(response.body).to include '<p>Please <a href="/sign_up">try again</a>.</p>'
    end

    it "redirects to an error page when email is invalid" do
      response = post("/users", username: 'miley_cyrus', name: 'Miley Cyrus', email: 'miley_cyrus@emailcom', password: "climb")

      expect(response.status).to eq 200
      expect(response.body).to include "<p>Sign up failed, invalid email address.</p>"
      expect(response.body).to include '<p>Please <a href="/sign_up">try again</a> with a different email address.</p>'
    end
  end

  context "GET sign_up when logged in" do
    it "redirects to the posts page" do
      post("/users", username: 'olivia_rodrigo', name: 'Olivia Rodrigo', email: 'olivia_rodrigo@email.com', password: "butterflies")
      post("/login", email: 'olivia_rodrigo@email.com', password: "butterflies")

      response = get("/sign_up")

      expect(session[:user_id]).to eq 4
      expect(response.status).to eq 302
    end
  end

  context "GET /login" do
    it "returns 200 OK and login form when not logged in" do
      response = get("/login")

      expect(response.status).to eq 200
      expect(response.body).to include "<h1>Log In</h1>"
      expect(response.body).to include '<form action="/login" method="POST">'
    end

    it "redirects to successful login page if logged in" do
      post("/users", username: 'olivia_rodrigo', name: 'Olivia Rodrigo', email: 'olivia_rodrigo@email.com', password: "butterflies")
      post("/login", email: 'olivia_rodrigo@email.com', password: "butterflies")

      response = get("/login")

      expect(session[:user_id]).to eq 4
      expect(response.status).to eq 200
      expect(response.body).to include '<p>You have successfully logged in!</p>'
    end
  end

  context "POST /login" do
    it "returns 200 OK and logs in" do
      post("/users", username: 'olivia_rodrigo', name: 'Olivia Rodrigo', email: 'olivia_rodrigo@email.com', password: "butterflies")
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
      expect(response.body).to include "<h1>Peep Board</h1>"
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
      post("/users", username: 'olivia_rodrigo', name: 'Olivia Rodrigo', email: 'olivia_rodrigo@email.com', password: "butterflies")
      post("/login", email: 'olivia_rodrigo@email.com', password: "butterflies")

      response = get("/posts/new")

      expect(session[:user_id]).to eq 4
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
      post("/users", username: 'olivia_rodrigo', name: 'Olivia Rodrigo', email: 'olivia_rodrigo@email.com', password: "butterflies")
      post("/login", email: 'olivia_rodrigo@email.com', password: "butterflies")

      response = post("/posts", content: "drivers license")

      expect(session[:user_id]).to eq 4
      expect(response.status).to eq 200
      expect(response.body).to include "<p>Peep successfully posted!</p>"
    end

    it "returns an error page if parameters are incorrect" do
      response = post("/posts")

      expect(response.status).to eq 200
      expect(response.body).to include '<p>Post cannot be posted if content is empty.</p>'
      expect(response.body).to include '<p>Please <a href="/posts/new">try again</a>.</p>'
    end
  end

  context "sends email" do
    it "sends an email to a user if they are mentioned in a peep" do
      post("/users", username: 'olivia_rodrigo', name: 'Olivia Rodrigo', email: 'olivia_rodrigo@email.com', password: "butterflies")
      post("/login", email: 'olivia_rodrigo@email.com', password: "butterflies")

      response = post("/posts", content: "hi @harry_styles")

      expect(response.status).to eq 200
      expect(Mail::TestMailer.deliveries.length).to eq 1
    end

    it "sends an email to all users who are mentioned in a peep" do
      post("/users", username: 'olivia_rodrigo', name: 'Olivia Rodrigo', email: 'olivia_rodrigo@email.com', password: "butterflies")
      post("/login", email: 'olivia_rodrigo@email.com', password: "butterflies")

      response = post("/posts", content: "hi @harry_styles and @taylor_swift")
      expect(response.status).to eq 200
      expect(Mail::TestMailer.deliveries.length).to eq 3
    end

    it "sends an email to me if I'm mentioned in a peep" do
      post("/users", username: 'olivia_rodrigo', name: 'Olivia Rodrigo', email: 'olivia_rodrigo@email.com', password: "butterflies")
      post("/users", username: 'ella', name: 'Ella', email: 'ellaskolnick@me.com', password: "123")
      post("/login", email: 'olivia_rodrigo@email.com', password: "butterflies")

      response = post("/posts", content: "hi @ella")
      expect(response.status).to eq 200
      expect(Mail::TestMailer.deliveries.length).to eq 4
    end
  end

  context "GET /reply/:id" do
    it "returns 200 OK and takes you to a form" do
      post("/users", username: 'olivia_rodrigo', name: 'Olivia Rodrigo', email: 'olivia_rodrigo@email.com', password: "butterflies")
      post("/login", email: 'olivia_rodrigo@email.com', password: "butterflies")

      response = get("reply/1")
      expect(response.status).to eq 200
      expect(response.body).to include '<h1>Reply to the Peep:</h1>'
      expect(response.body).to include '<form action="/reply/1" method="POST">'
      expect(response.body).to include "<h3>'watermelon sugar'</h3>"
      expect(response.body).to include "<p>- Harry Styles, @harry_styles</p>"
    end

    it "if not logged in redirects to login page" do
      response = get("reply/1")

      expect(response.status).to eq 302

      response = get("/login")

      expect(response.body).to include "<h1>Log In</h1>"
      expect(response.body).to include '<form action="/login" method="POST">'
    end
  end

  context "POST /reply/:id" do
    it "returns 200 OK and posts your reply" do
      post("/users", username: 'olivia_rodrigo', name: 'Olivia Rodrigo', email: 'olivia_rodrigo@email.com', password: "butterflies")
      post("/login", email: 'olivia_rodrigo@email.com', password: "butterflies")

      response = post("/reply/1", content: "@harry_styles hi")

      expect(response.status).to eq 200
      expect(response.body).to include "<p>Peep successfully posted!</p>"
    end

    it "returns an error page if parameters are incorrect" do
      response = post("/reply/1")

      expect(response.status).to eq 200
      expect(response.body).to include '<p>Post cannot be posted if content is empty.</p>'
      expect(response.body).to include '<p>Please <a href="/posts/new">try again</a>.</p>'
    end
  end

  context "GET /post/:id" do
    it "returns 200 OK  and displays the peep with it's replies" do
      post("/users", username: 'olivia_rodrigo', name: 'Olivia Rodrigo', email: 'olivia_rodrigo@email.com', password: "butterflies")
      post("/login", email: 'olivia_rodrigo@email.com', password: "butterflies")
      post("/reply/1", content: "@harry_styles hi")

      response = get("/post/1")

      expect(response.status).to eq 200
      expect(response.body).to include '<div class="card" id="1">'
      expect(response.body).to include "<h3>'watermelon sugar'</h3>"
      expect(response.body).to include "<h3>'@harry_styles @harry_styles hi'</h3>"
      expect(response.body).to include "<p>- Olivia Rodrigo, @olivia_rodrigo</p>"
    end
  end
end

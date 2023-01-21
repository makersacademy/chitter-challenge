require "spec_helper"
require "rack/test"
require_relative "../../app"

def reset_tables
  seed_sql = File.read('spec/seeds_chitter.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

RSpec.describe Application do

  include Rack::Test::Methods

  let(:app) { Application.new }

  before(:each) do 
    reset_tables
  end


  describe "get /" do
    context "when not logged in" do
      it "returns non-logged in homepage content" do
        response = get("/")

        expect(response.status).to eq (200)
        expect(response.body).to include('<h1><a href="/">Chitter</a></h1>')
        expect(response.body).to include('<a href="/">Home</a> |')
        expect(response.body).to include('<a href="/login">Log in</a> |')
        expect(response.body).to include('<a href="/signup">Sign up</a>')
        expect(response.body).to include('<p class="login-reminder"> You need to log in if you want to peep! </p>')
        expect(response.body).to include('<h2>Chitter feed</h2>')
        expect(response.body).to include('Sarah Jacobs')
        expect(response.body).to include('@JazzySaz')
        expect(response.body).to include('2022-11-30 12:05:06')
        expect(response.body).to include('My first peep!!!')
        expect(response.body).to include('view comments')
        expect(response.body).to include('<footer>Chitter © 2022</footer>')
      end
    end

    context "when logged in (also tests post '/')" do
      it "returns logged in homepage content" do
        response = post("/login",
          email_address: "lewisjandrews@outlook.com",
          password: "Norfolk?91")

        expect(response.status).to eq (302)

        response = get("/")

        expect(response.status).to eq (200)
        expect(response.body).to include('<h1><a href="/">Chitter</a></h1>')
        expect(response.body).to include('<a href="/">Home</a> |')
        expect(response.body).to include('Logged in as')
        expect(response.body).to include('@Luigi_100')
        expect(response.body).to include('<a href="/logout">Log out</a>')
        expect(response.body).to include('<div class="post-peep-container">')
        expect(response.body).to include('<form class="post-peep-form" action="/" method="post">')
        expect(response.body).to include(`<input type="textarea" name="content" placeholder="What's on your mind?" required>`)
        expect(response.body).to include('<input type="submit" value="Post peep">')
        expect(response.body).to include('</form>')
        expect(response.body).to include('</div>')
        expect(response.body).to include('Sarah Jacobs')
        expect(response.body).to include('@JazzySaz')
        expect(response.body).to include('2022-11-30 12:05:06')
        expect(response.body).to include('My first peep!!!')
        expect(response.body).to include('view comments')
        expect(response.body).to include('<footer>Chitter © 2022</footer>')
      end
    end
  end

  describe "get /login" do
    it "returns login page" do
      response = get("/login")

      expect(response.status).to eq (200)
      expect(response.body).to include('<h1><a href="/">Chitter</a></h1>')
      expect(response.body).to include('<nav class="login-signup-nav">')
      expect(response.body).to include('<a href="/">Home</a> | &nbsp')
      expect(response.body).to include('<a href="/signup">Sign up</a>')
      expect(response.body).to include('<h4 class="login-signup-heading">Log into Chitter</h4>')
      expect(response.body).to include('<form action="/login" method="post">')
      expect(response.body).to include('<label>Email address: </label>')
      expect(response.body).to include('<input type="text" name="email_address" required>&nbsp')
      expect(response.body).to include('<label>Password: </label>')
      expect(response.body).to include('<input type="password" name="password" required>&nbsp')
      expect(response.body).to include('<input type="submit" value="Log in">')
      expect(response.body).to include('</form>')

    end
  end

  describe "get /login_error" do
    it "returns login_error page" do
      response = get("/login_error")

      expect(response.status).to eq (200)
      expect(response.body).to include('<header>')
      expect(response.body).to include('<h1><a href="/">Chitter</a></h1>')
      expect(response.body).to include('<nav>')
      expect(response.body).to include('<a href="/">Home</a> | &nbsp')
      expect(response.body).to include('<a href="/login">Log in</a> | &nbsp')
      expect(response.body).to include('<a href="/signup">Sign up</a>')
      expect(response.body).to include('</nav>')
      expect(response.body).to include('</header>')
      expect(response.body).to include('<h4 class="login-signup-heading">Invalid login details</h4>')
      expect(response.body).to include('<form action="/login" class="button-container">')
      expect(response.body).to include('<input type="submit" class="login-signup-try-again-button" value="Try again" />')
      expect(response.body).to include('</form>')
    end
  end

  describe "get /signup" do
    it "returns signup page" do
      response = get("/signup")

      expect(response.status).to eq (200)
      expect(response.body).to include('<header>')
      expect(response.body).to include('<h1><a href="/">Chitter</a></h1>')
      expect(response.body).to include('<nav class="login-signup-nav">')
      expect(response.body).to include('<a href="/">Home</a> | &nbsp')
      expect(response.body).to include('<a href="/login">Log in</a>')
      expect(response.body).to include('</nav>')
      expect(response.body).to include('</header>')
      expect(response.body).to include('<h4 class="login-signup-heading">Sign up to Chitter</h4>')
      expect(response.body).to include('<form action="/signup" method="POST">')
      expect(response.body).to include('<label>Full name: </label>')
      expect(response.body).to include('<input type="text" name="name" required>&nbsp')
      expect(response.body).to include('<label>Username: </label>')
      expect(response.body).to include('<input type="text" name="username" required>&nbsp')
      expect(response.body).to include('<label>Email address: </label>')
      expect(response.body).to include('<input type="text" name="email_address" required>&nbsp')
      expect(response.body).to include('<label>Password: </label>')
      expect(response.body).to include('<input type="password" name="password" required>&nbsp')
      expect(response.body).to include('<input type="submit" value="Sign up">')
      expect(response.body).to include('</form>')
    end
  end

  describe "post /signup with valid credentials" do
    it "returns logged-in version of homepage after successful login" do
      response = post("/signup",
        email_address: "newemail@gmail.com",
        password: "passssss",
        name: "New account",
        username: "NewTestAccount")

      expect(response.status).to eq (302)

      response = get("/")

      expect(response.status).to eq (200)
      expect(response.body).to include('<h1><a href="/">Chitter</a></h1>')
      expect(response.body).to include('<a href="/">Home</a> |')
      expect(response.body).to include('Logged in as')
      expect(response.body).to include('@NewTestAccount')
      expect(response.body).to include('<a href="/logout">Log out</a>')
      expect(response.body).to include('<div class="post-peep-container">')
      expect(response.body).to include('<form class="post-peep-form" action="/" method="post">')
      expect(response.body).to include(`<input type="textarea" name="content" placeholder="What's on your mind?" required>`)
      expect(response.body).to include('<input type="submit" value="Post peep">')
      expect(response.body).to include('</form>')
      expect(response.body).to include('</div>')
      expect(response.body).to include('Sarah Jacobs')
      expect(response.body).to include('@JazzySaz')
      expect(response.body).to include('2022-11-30 12:05:06')
      expect(response.body).to include('My first peep!!!')
      expect(response.body).to include('view comments')
      expect(response.body).to include('<footer>Chitter © 2022</footer>')
    end
  end

  describe "get /signup_error and post /signup with invalid credentials" do
    context "when entering invalid email address" do
      it "returns invalid email address message" do
        response = post("/signup",
          email_address: "asdfasdf",
          password: "dfgasdfg",
          name: "test name",
          username: "testname")

        expect(response.status).to eq (200)
        expect(response.body).to include('<header>')
        expect(response.body).to include('<h1><a href="/">Chitter</a></h1>')
        expect(response.body).to include('<nav>')
        expect(response.body).to include('<a href="/">Home</a> | &nbsp')
        expect(response.body).to include('<a href="/login">Log in</a> | &nbsp')
        expect(response.body).to include('<a href="/signup">Sign up</a>')
        expect(response.body).to include('</nav>')
        expect(response.body).to include('</header>')
        expect(response.body).to include('<h4 class="login-signup-heading">Invalid email address</h4>')
        expect(response.body).to include('<form action="/signup" class="button-container">')
        expect(response.body).to include('<input type="submit" class="login-signup-try-again-button" value="Try again" />')
        expect(response.body).to include('</form>')
      end
    end

    context "when entering entering email address that's already taken" do
      it "returns message saying email address already taken" do
        response = post("/signup",
          email_address: "sarahjacobs@gmail.com",
          password: "afsdfasd",
          name: "Sarah Taylor",
          username: "SarahTaylor")

        expect(response.status).to eq (200)
        expect(response.body).to include('<header>')
        expect(response.body).to include('<h1><a href="/">Chitter</a></h1>')
        expect(response.body).to include('<nav>')
        expect(response.body).to include('<a href="/">Home</a> | &nbsp')
        expect(response.body).to include('<a href="/login">Log in</a> | &nbsp')
        expect(response.body).to include('<a href="/signup">Sign up</a>')
        expect(response.body).to include('</nav>')
        expect(response.body).to include('</header>')
        expect(response.body).to include('<h4 class="login-signup-heading">Email address already in use</h4>')
        expect(response.body).to include('<form action="/signup" class="button-container">')
        expect(response.body).to include('<input type="submit" class="login-signup-try-again-button" value="Try again" />')
        expect(response.body).to include('</form>')
      end
    end

    context "when entering entering username that's already taken" do
      it "returns message saying username already taken" do
        response = post("/signup",
          email_address: "newemail@gmail.com",
          password: "passssss",
          name: "New account",
          username: "JJ22")

        expect(response.body).to include('<header>')
        expect(response.body).to include('<h1><a href="/">Chitter</a></h1>')
        expect(response.body).to include('<nav>')
        expect(response.body).to include('<a href="/">Home</a> | &nbsp')
        expect(response.body).to include('<a href="/login">Log in</a> | &nbsp')
        expect(response.body).to include('<a href="/signup">Sign up</a>')
        expect(response.body).to include('</nav>')
        expect(response.body).to include('</header>')
        expect(response.body).to include('<h4 class="login-signup-heading">Username already in use</h4>')
        expect(response.body).to include('<form action="/signup" class="button-container">')
        expect(response.body).to include('<input type="submit" class="login-signup-try-again-button" value="Try again" />')
        expect(response.body).to include('</form>')
      end
    end

    context "when entering entering email address and username that are both already taken" do
      it "returns message saying email address and username both already taken" do
        response = post("/signup",
          email_address: "sarahjacobs@gmail.com",
          password: "PassWord",
          name: "Sazza J",
          username: "JazzySaz")

        expect(response.status).to eq (200)
        expect(response.body).to include('<header>')
        expect(response.body).to include('<h1><a href="/">Chitter</a></h1>')
        expect(response.body).to include('<nav>')
        expect(response.body).to include('<a href="/">Home</a> | &nbsp')
        expect(response.body).to include('<a href="/login">Log in</a> | &nbsp')
        expect(response.body).to include('<a href="/signup">Sign up</a>')
        expect(response.body).to include('</nav>')
        expect(response.body).to include('</header>')
        expect(response.body).to include('<h4 class="login-signup-heading">Email address and username both already in use</h4>')
        expect(response.body).to include('<form action="/signup" class="button-container">')
        expect(response.body).to include('<input type="submit" class="login-signup-try-again-button" value="Try again" />')
        expect(response.body).to include('</form>')
      end
    end
  end

  describe "get '/:user_id' (view a user's profile)" do
    context "when not logged in" do
      it "returns profile and peeps of user with given user_id" do
        response = get("/3")

        expect(response.status).to eq (200)
        expect(response.body).to include('<h1><a href="/">Chitter</a></h1>')
        expect(response.body).to include('<a href="/">Home</a> |')
        expect(response.body).to include('<a href="/login">Log in</a> |')
        expect(response.body).to include('<a href="/signup">Sign up</a>')
        expect(response.body).to include('<p class="login-reminder"> You need to log in if you want to peep or comment! </p>')
        expect(response.body).to include("Luigi_100")
        expect(response.body).to include('Lewis Andrews')
        expect(response.body).to include('2022-12-01 11:22:34')
        expect(response.body).to include('Bronze medal for me lololol')
        expect(response.body).to include('view comments')
      end
    end

    context "when logged in and visiting someone else's page" do
      it "returns profile and peeps of user with given user_id" do
        response = post("/login",
          email_address: "lewisjandrews@outlook.com",
          password: "Norfolk?91")

        expect(response.status).to eq (302)

        response = get("/2")

        expect(response.status).to eq (200)
        expect(response.body).to include('<h1><a href="/">Chitter</a></h1>')
        expect(response.body).to include('<a href="/">Home</a> |')
        expect(response.body).to include('Logged in as')
        expect(response.body).to include('Luigi_100')
        expect(response.body).to include('<a href="/logout">Log out</a>')
        expect(response.body).to include("JJ22")
        expect(response.body).to include('Johnny James')
        expect(response.body).to include('2022-12-01 18:11:55')
        expect(response.body).to include('Has anyone seen my rubber duck?')
        expect(response.body).to include('view comments')
      end
    end

    context "when logged in and visiting own page" do
      it "returns user's own profile and peeps" do
        response = post("/login",
          email_address: "lewisjandrews@outlook.com",
          password: "Norfolk?91")

        expect(response.status).to eq (302)
        
        response = get("/3")

        expect(response.status).to eq (200)
        expect(response.body).to include('<h1><a href="/">Chitter</a></h1>')
        expect(response.body).to include('<a href="/">Home</a> |')
        expect(response.body).to include('Logged in as')
        expect(response.body).to include('Luigi_100')
        expect(response.body).to include('<a href="/logout">Log out</a>')
        expect(response.body).to include('<h2> Your peeps </h2>')
        expect(response.body).to include('<div class="post-peep-container">')
        expect(response.body).to include('<form class="post-peep-form" action="/" method="post">')
        expect(response.body).to include(`<input type="textarea" name="content" placeholder="What's on your mind?" required>`)
        expect(response.body).to include('<input type="submit" value="Post peep">')
        expect(response.body).to include('</form>')
        expect(response.body).to include('</div>')
        expect(response.body).to include('Lewis Andrews')
        expect(response.body).to include("Luigi_100")
        expect(response.body).to include('2022-12-01 11:22:34')
        expect(response.body).to include('Bronze medal for me lololol')
        expect(response.body).to include('view comments')
      end
    end
  end

  describe "post peep at / and /:user_id:" do
    context "post /" do
      it "shows the new peep on the homepage" do
        response = post("/login",
          email_address: "lewisjandrews@outlook.com",
          password: "Norfolk?91")

        expect(response.status).to eq (302)

        response = post("/",
          content: "Test peep")

        expect(response.status).to eq (302)

        response = get("/")

        expect(response.body).to include ("Test peep")
      end
    end

    context "post peep at /:user_id (on user's own profile)" do
      it "shows the new peep on the user's profile" do
        response = post("/login",
          email_address: "lewisjandrews@outlook.com",
          password: "Norfolk?91")

        expect(response.status).to eq (302)

        response = post("/3",
          content: "Test peep")

        expect(response.status).to eq (302)

        response = get("/3")

        expect(response.body).to include ("Test peep")
      end
    end
  end

  describe "get '/peep/:peep_id' (view comments)" do
    context "when not logged in" do
      it "returns the page without a post comment function" do
        response = get("/peep/5")

        expect(response.status).to eq (200)
        expect(response.body).to include('<h1><a href="/">Chitter</a></h1>')
        expect(response.body).to include('<a href="/">Home</a> |')
        expect(response.body).to include('<a href="/login">Log in</a> |')
        expect(response.body).to include('<a href="/signup">Sign up</a>')
        expect(response.body).to include('<p class="login-reminder"> You need to log in if you want to peep or comment! </p>')
        expect(response.body).to include('Peep by')
        expect(response.body).to include('JJ22')
        expect(response.body).to include('Johnny James')
        expect(response.body).to include('2022-12-01 18:11:55')
        expect(response.body).to include('Has anyone seen my rubber duck?')
        expect(response.body).to include('Lewis Andrews')
        expect(response.body).to include('Luigi_100')
        expect(response.body).to include('2022-12-01 19:34:54')
        expect(response.body).to include('Did you leave it in the bath again??')
      end
    end

    context "when logged in" do
      it "returns the page with a post comment function" do
        response = post("/login",
          email_address: "lewisjandrews@outlook.com",
          password: "Norfolk?91")

        expect(response.status).to eq (302)
        
        response = get("/peep/5")

        expect(response.status).to eq (200)
        expect(response.body).to include('Logged in as')
        expect(response.body).to include('Luigi_100')
        expect(response.body).to include('<a href="/logout">Log out</a>')
        expect(response.body).to include('Peep by')
        expect(response.body).to include('JJ22')
        expect(response.body).to include('Johnny James')
        expect(response.body).to include('2022-12-01 18:11:55')
        expect(response.body).to include('Has anyone seen my rubber duck?')
        expect(response.body).to include('<div class="post-comment-container">')
        expect(response.body).to include('<form class="post-comment-form" action="/peep/5" method="post">')
        expect(response.body).to include('<input type="textarea" name="content" required>')
        expect(response.body).to include('<input type="submit" value="Post comment">')
        expect(response.body).to include('</form>')
        expect(response.body).to include('</div>')
        expect(response.body).to include('Lewis Andrews')
        expect(response.body).to include('Luigi_100')
        expect(response.body).to include('2022-12-01 19:34:54')
        expect(response.body).to include('Did you leave it in the bath again??')
      end
    end
  end

  describe "post '/peep/:peep_id' (post a comment)" do
    it "returns the page with the new comment" do
      response = post("/login",
        email_address: "lewisjandrews@outlook.com",
        password: "Norfolk?91")

      expect(response.status).to eq (302)
      
      response = get("/peep/5")

      response = post("/peep/5",
        content: "Test comment")

      expect(response.status).to eq (302)
    
      response = get("/peep/5")
      
      expect(response.status).to eq (200)
      expect(response.body).to include('Logged in as')
      expect(response.body).to include('Luigi_100')
      expect(response.body).to include('<a href="/logout">Log out</a>')
      expect(response.body).to include('Peep by')
      expect(response.body).to include('JJ22')
      expect(response.body).to include('Johnny James')
      expect(response.body).to include('2022-12-01 18:11:55')
      expect(response.body).to include('Has anyone seen my rubber duck?')
      expect(response.body).to include('<div class="post-comment-container">')
      expect(response.body).to include('<form class="post-comment-form" action="/peep/5" method="post">')
      expect(response.body).to include('<input type="textarea" name="content" required>')
      expect(response.body).to include('<input type="submit" value="Post comment">')
      expect(response.body).to include('</form>')
      expect(response.body).to include('</div>')
      expect(response.body).to include('Lewis Andrews')
      expect(response.body).to include('Luigi_100')
      expect(response.body).to include('2022-12-01 19:34:54')
      expect(response.body).to include('Did you leave it in the bath again??')
      expect(response.body).to include('Test comment')
    end
  end
end

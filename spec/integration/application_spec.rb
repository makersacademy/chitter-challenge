require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  before(:each) do
    seed_sql = File.read('spec/seeds/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_challenge_test' })
    connection.exec(seed_sql)
  end

  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context "GET /" do
    it "returns a website with a list of all peeps" do
      response = get('/')
      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>chitter</h1>')

      expect(response.body).to include('<div class="peep_header">Phil 2022-09-15 11:03:56</div>')
      expect(response.body).to include('I am currently working on my solo project.')

      expect(response.body).to include('<div class="peep_header">Jonas 2022-09-15 09:31:40</div>')
      expect(response.body).to include('I have just started designing the chitter challenge.')

      expect(response.body).to include('<div class="peep_header">Anna 2022-09-13 14:54:45</div>')
      expect(response.body).to include('Pairing was really fun today.')

      expect(response.body).to include('<div class="peep_header">Jonas 2022-09-12 16:17:00</div>')
      expect(response.body).to include('What a grey day!')

      expect(response.body).to include('<div class="peep_header">Jonas 2022-09-10 14:15:00</div>')
      expect(response.body).to include('Learning about web apps is so exciting!')
    end

    it "shows who is logged in if after post /login has been called and displays logout link" do
      post('/login', email: 'jonas@makers.com', password: 'grey81!mouse')
      response = get('/')
      expect(response.status).to eq(200)
      expect(response.body).to include('<div>You are logged in as Jonas.<div>')
      expect(response.body).to include('<form method="POST" action="/logout">')
      expect(response.body).to include('<input type="submit" value="Log out">')
    end

    it "displays login and sign up links if nobody is logged in" do
      response = get('/')
      expect(response.status).to eq(200)
      expect(response.body).to include('<a href="/login">Login</a>')
      expect(response.body).to include('<a href="/sign_up">Sign Up</a>')
    end
  end

  context "GET /login" do
    it "displays a login form" do
      response = get('/login')
      expect(response.status).to eq(200)
      expect(response.body).to include('<form method="POST" action="/login">')
    end

    it "displays an error message if username or password have been entered incorrectly" do
      response = get('/login', error: 'true')
      expect(response.status).to eq(200)
      expect(response.body).to include('<div>Email/Password incorrect</div>')
    end
  end

  context "POST /login" do
    it "redirects to login form if password is wrong" do
      post('/login', email: 'jonas@makers.com', password: 'greymouse')
      follow_redirect!
      expect(last_response.body).to include('<div>Email/Password incorrect</div>')
    end

    it "redirects to login form if username is wrong" do
      post('/login', email: 'jona@makers.com', password: 'grey81!mouse')
      follow_redirect!
      expect(last_response.body).to include('<div>Email/Password incorrect</div>')
    end
  end

  context "POST /logout" do
    it "reloads the home page with the user logged out" do
      post('/logout')
      follow_redirect!
      expect(last_response.body).to include('<a href="/login">Login</a>')
      expect(last_response.body).to include('<a href="/sign_up">Sign Up</a>')
    end
  end

  context "POST /new_peep" do
    it "displays a new peep as the first on the homepage" do
      post('/login', email: 'jonas@makers.com', password: 'grey81!mouse')
      post('/new_peep', content: 'I have finished the functionality of my app - now to the style!')
      follow_redirect!
      expect(last_response.body).to include('<div class="peep_content">I have finished the functionality of my app - now to the style!</div>')
    end
  end

  context "POST /sign_up" do
    it "redirects to sign up form with error message if email is already present in database" do
      post('/sign_up', email: 'jonas@makers.com', username: 'JonasD', password1: 'hello_world', password2: 'hello_world')
      follow_redirect!
      expect(last_response.body).to include('<div>Email is already registered!</div>')
    end

    it "redirects to sign up form with error message if email contains invalid characters" do
      post('/sign_up', email: 'jeremy!park@makers.com', username: 'Jeremy', password1: 'hello_world', password2: 'hello_world')
      follow_redirect!
      expect(last_response.body).to include('<div>Email can only contain letters, numbers and these characters -_.@</div>')
    end

    it "redirects to sign up form with error message if email contains invalid characters" do
      post('/sign_up', email: '"jeremy",park@makers.com', username: 'Jeremy', password1: 'hello_world', password2: 'hello_world')
      follow_redirect!
      expect(last_response.body).to include('<div>Email can only contain letters, numbers and these characters -_.@</div>')
    end

    it "redirects to sign up form with error message if email contains invalid characters" do
      post('/sign_up', email: '<jeremy>(park)@makers.com', username: 'Jeremy', password1: 'hello_world', password2: 'hello_world')
      follow_redirect!
      expect(last_response.body).to include('<div>Email can only contain letters, numbers and these characters -_.@</div>')
    end

    it "redirects to sign up form with error message if username is already present in database" do
      post('/sign_up', email: 'jonas@somewhere.com', username: 'Jonas', password1: 'hello_world952', password2: 'hello_world952')
      follow_redirect!
      expect(last_response.body).to include('<div>Username is already taken.</div>')
    end

    it "redirects to sign up form with error message if username contains characters other than numbers or letters" do
      post('/sign_up', email: 'johnny@somewhere.com', username: 'Johnny!', password1: 'hello_world952', password2: 'hello_world952')
      follow_redirect!
      expect(last_response.body).to include('<div>Username can only contain letters and numbers.</div>')
    end

    it "redirects to sign up form with error message if password1 and password2 don't match" do
      post('/sign_up', email: 'johnny@somewhere.com', username: 'Johnny', password1: 'hello_wold952', password2: 'hello_world952')
      follow_redirect!
      expect(last_response.body).to include("<div>The passwords don't match.</div>")
    end

    it "adds new user to the database and redirects to main page, with success message" do
      post('/sign_up', email: 'johnny@somewhere.com', username: 'Johnny', password1: 'hello_world952', password2: 'hello_world952')
      follow_redirect!
      expect(last_response.body).to include('<div>Sign Up successful!</div>')
    end
  end
end
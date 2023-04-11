require "spec_helper"
require "rack/test"
require_relative '../../app'
require 'peep_repository'
require 'user_repository'

def reset_tables
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods
  
  before(:each) do 
    reset_tables
  end

  let(:app) { Application.new }

  context "homepage" do
    it "displays a list of existing peeps" do
      response = get('/')
      expect(response.status).to eq 200
      expect(response.body).to include "<h1>Welcome to Chitter</h1>"
      expect(response.body).to include "Today I coded"
      expect(response.body).to include "Today I relaxed"
    end
  end

  context "new peep form" do
    it "displays a form page where text can be entered and submitted" do
      response = get('/peeps/new')
      expect(response.status).to eq 200
      expect(response.body).to include '<h1>Spread your chit</h1>'
      expect(response.body).to include '<form method="POST" action="/peeps">'
      expect(response.body).to include '<p><a href="/">Home</a></p>'
    end
  end

  context "new peep process" do
    it "creates a new peep which can be viewed on the homepage" do
      response = post('/peeps', body: 'Today I played games', tags: '#games, #amber', user_id: 1)
      expect(response.status).to eq 302
      response = get('/')
      expect(response.status).to eq 200
      expect(response.body).to include "<h1>Welcome to Chitter</h1>"
      expect(response.body).to include "Today I coded"
      expect(response.body).to include "Today I relaxed"
    end

    it "rejects new peep where <, > or / are entered in body" do
      response = post('/peeps', body: 'Today / played games', tags: '#games, #amber', user_id: 1)
      expect(response.status).to eq 302
      response = get('/peeps/new')
      expect(response.status).to eq 200
      expect(response.body).to include "'<', '>' and '/' are not permitted characters."
    end
  end

  context "register process" do
    it "creates a new user" do
      response = post('/register', name: 'Demi Quart', username: 'Demi', email: "demi@email.com", password: "mypassword")
      expect(response.status).to eq 302
      response = get('/')
      expect(response.status).to eq 200
      expect(response.body).to include "<h1>Welcome to Chitter</h1>"
      expect(response.body).to include "Today I coded"
      expect(response.body).to include "Today I relaxed"
    end
  end

  context "/logout" do
    it "ends a session and redirects to homepage" do
      response = get('/logout')
      expect(response.status).to eq 302
      response = get('/')
      expect(response.status).to eq 200
      expect(response.body).to include "<h1>Welcome to Chitter</h1>"
      expect(response.body).to include "Log in to create new peeps"
    end
  end

  context "/login/form" do
    it "renders a login form" do
      response = get('/login/form')
      expect(response.status).to eq 200
      expect(response.body).to include "<h1>Log in to Chitter</h1>"
      expect(response.body).to include '<form method="POST" action="/login">'
    end
  end

  context "login process" do
    it "logs a user in" do
      response = post('/login', email: "billy@email.com", password: "MyPassword456")
      expect(response.status).to eq 302
      response = get('/')
      expect(response.status).to eq 200
      expect(response.body).to include "<h1>Welcome to Chitter</h1>"
      expect(response.body).to include "You are logged in as Billy"
    end

    it "does not log the user in when email not found" do
      response = post('/login', email: "terry@email.com", password: "MyPassword456")
      expect(response.status).to eq 302
      response = get('/login/form')
      expect(response.status).to eq 200
      expect(response.body).to include "<h1>Log in to Chitter</h1>"
      expect(response.body).to include "Email and password do not match any registered user."
    end

    it "does not log the user in when email and password do not match" do
      response = post('/login', email: "billy@email.com", password: "MyPassword457")
      expect(response.status).to eq 302
      response = get('/login/form')
      expect(response.status).to eq 200
      expect(response.body).to include "<h1>Log in to Chitter</h1>"
      expect(response.body).to include "Email and password do not match any registered user."
    end
  end

  it "does not validate a peep with no word content" do
    response = post('/peeps', body: '', tags: '#nada')
    expect(response.status).to eq 302
    response = get('/peeps/new')
    expect(response.status).to eq 200
    expect(response.body).to include "Invalid peep:"
  end

  context "registration validation" do
    it "does not validate a name" do
      response = post('/register', name: '3', username: 'Demi', email: "demi@email.com", password: "MyPassword13")
      expect(response.status).to eq 302
      response = get('/register/new')
      expect(response.status).to eq 200
      expect(response.body).to include "Invalid name:"
    end

    it "does not validate a name" do
      response = post('/register', name: '', username: 'Demi', email: "demi@email.com", password: "MyPassword13")
      expect(response.status).to eq 302
      response = get('/register/new')
      expect(response.status).to eq 200
      expect(response.body).to include "Invalid name:"
    end

    it "does not validate a username" do
      response = post('/register', name: 'Demi Quart', username: '3', email: "demi@email.com", password: "MyPassword13")
      expect(response.status).to eq 302
      response = get('/register/new')
      expect(response.status).to eq 200
      expect(response.body).to include "Invalid username:"
    end

    it "does not validate a username" do
      response = post('/register', name: 'Demi Quart', username: '', email: "demi@email.com", password: "MyPassword13")
      expect(response.status).to eq 302
      response = get('/register/new')
      expect(response.status).to eq 200
      expect(response.body).to include "Invalid username:"
    end

    it "does not validate an email" do
      response = post('/register', name: 'Demi Quart', username: 'Demi', email: "demi@", password: "MyPassword13")
      expect(response.status).to eq 302
      response = get('/register/new')
      expect(response.status).to eq 200
      expect(response.body).to include "Invalid email:"
    end

    it "does not validate an email" do
      response = post('/register', name: 'Demi Quart', username: 'Demi', email: "@email.com", password: "MyPassword13")
      expect(response.status).to eq 302
      response = get('/register/new')
      expect(response.status).to eq 200
      expect(response.body).to include "Invalid email:"
    end

    it "does not validate a password with no uppercase" do
      response = post('/register', name: 'Demi Quart', username: 'Demi', email: "demi@email.com", password: "mypassword13")
      expect(response.status).to eq 302
      response = get('/register/new')
      expect(response.status).to eq 200
      expect(response.body).to include "Invalid password:"
    end

    it "does not validate a password with no lowercase" do
      response = post('/register', name: 'Demi Quart', username: 'Demi', email: "demi@email.com", password: "MYPASSWORD13")
      expect(response.status).to eq 302
      response = get('/register/new')
      expect(response.status).to eq 200
      expect(response.body).to include "Invalid password:"
    end

    it "does not validate a password with no digit" do
      response = post('/register', name: 'Demi Quart', username: 'Demi', email: "demi@email.com", password: "MyPassword")
      expect(response.status).to eq 302
      response = get('/register/new')
      expect(response.status).to eq 200
      expect(response.body).to include "Invalid password:"
    end

    it "does not validate a password with less that eight characters" do
      response = post('/register', name: 'Demi Quart', username: 'Demi', email: "demi@email.com", password: "MyPas13")
      expect(response.status).to eq 302
      response = get('/register/new')
      expect(response.status).to eq 200
      expect(response.body).to include "Invalid password:"
    end

    it "validates a name, username, email and password" do
      response = post('/register', name: 'Demi quart', username: 'Demi', email: "demi@email.com", password: "MyPassword13")
      expect(response.status).to eq 302
      response = get('/')
      expect(response.status).to eq 200
    end

    it "rejects registration where <, > or / are entered in name" do
      response = post('/register', name: 'Demi <quart', username: 'Demi', email: "demi@email.com", password: "MyPassword13")
      expect(response.status).to eq 302
      response = get('/register/new')
      expect(response.status).to eq 200
      expect(response.body).to include "'<', '>' and '/' are not permitted characters."
    end

    it "rejects registration where <, > or / are entered in username" do
      response = post('/register', name: 'Demi quart', username: 'De/mi', email: "demi@email.com", password: "MyPassword13")
      expect(response.status).to eq 302
      response = get('/register/new')
      expect(response.status).to eq 200
      expect(response.body).to include "'<', '>' and '/' are not permitted characters."
    end

    it "rejects registration where <, > or / are entered in email" do
      response = post('/register', name: 'Demi quart', username: 'Demi', email: "demi@emai<l.com", password: "MyPassword13")
      expect(response.status).to eq 302
      response = get('/register/new')
      expect(response.status).to eq 200
      expect(response.body).to include "'<', '>' and '/' are not permitted characters."
    end

    it "rejects registration where <, > or / are entered in password" do
      response = post('/register', name: 'Demi quart', username: 'Demi', email: "demi@email.com", password: "MyPassword/13")
      expect(response.status).to eq 302
      response = get('/register/new')
      expect(response.status).to eq 200
      expect(response.body).to include "'<', '>' and '/' are not permitted characters."
    end
  end

  context "registration validation" do
    it "rejects registration where <, > or / are entered in email" do
      response = post('/login', email: "billy@emai/.com", password: "MyPassword456")
      expect(response.status).to eq 302
      response = get('/login/form')
      expect(response.status).to eq 200
      expect(response.body).to include "'<', '>' and '/' are not permitted characters."
    end

    it "rejects registration where <, > or / are entered in password" do
      response = post('/login', email: "billy@email.com", password: "MyPassword<56")
      expect(response.status).to eq 302
      response = get('/login/form')
      expect(response.status).to eq 200
      expect(response.body).to include "'<', '>' and '/' are not permitted characters."
    end
  end

  context "unique username and email check when registering" do
    it "rejects a username that already exists" do
      response = post('/register', name: 'Amber Thompson', username: 'Amber', email: "amber2@email.com", password: "MyPassword123")
      expect(response.status).to eq 302
      response = get('/register/new')
      expect(response.status).to eq 200
      expect(response.body).to include "That username is already taken."
    end

    it "rejects an email that already exists" do
      response = post('/register', name: 'Amber Thompson', username: 'Amber2', email: "amber@email.com", password: "MyPassword123")
      expect(response.status).to eq 302
      response = get('/register/new')
      expect(response.status).to eq 200
      expect(response.body).to include "That email is already registered to a user."
    end
  end

end
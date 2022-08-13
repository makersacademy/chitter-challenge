# require 'spec_helper'
require 'rack/test'
# require 'user_repo'
# require 'peep_repo'
require_relative '../../app'

def reset_tables
  seed_sql = File.read('spec/seeds/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe Application do
  before(:each) do 
    reset_tables
  end

  include Rack::Test::Methods
  let(:app) { Application.new }

  context "get / when logged out" do
    it "shows peeps in correct order" do
      response = get('/')
      expect(response.status).to eq(200)
      str = "    <div>\n"\
        "      <p>Nice weather for ducks</p>\n"\
        "      <p>Posted: 2022-08-12 21:56:54.385627 +0100</p>\n"\
        "      <p>By: Donald Duck - @donald</p>\n"\
        "    </div>\n    \n    <div>\n"\
        "      <p>It is awfully hot today</p>\n"\
        "      <p>Posted: 2022-08-12 21:55:12.940137 +0100</p>\n"\
        "      <p>By: Daffy Duck - @daffy</p>\n"\
        "    </div>"
      expect(response.body).to include(str)
    end

    it "includes login link but logout and new peep are hidden" do
      response = get('/')
      expect(response.body).to include("<a href=\"/login\">Login</a>")
      expect(response.body).not_to include("<a href=\"/logout\">Logout</a>")
      expect(response.body).not_to include("<a href=\"/new\">New peep</a>")
    end
  end

  context "get / when logged in" do
    it "shows peeps" do
      post('/login', email: 'duck2@makers.com', password: 'quack!')
      response = get('/')
      expect(response.status).to eq(200)
      expect(response.body).to include("<p>Nice weather for ducks</p>")
      expect(response.body).to include("<p>It is awfully hot today</p>")
    end

    it "shows logout and new peep but login is hidden" do
      post('/login', email: 'duck2@makers.com', password: 'quack!')
      response = get('/')
      expect(response.body).not_to include("<a href=\"/login\">Login</a>")
      expect(response.body).to include("<a href=\"/logout\">Logout</a>")
      expect(response.body).to include("<a href=\"/new\">New peep</a>")
    end
  end

  context "get /login" do
    it "shows login form" do
      response = get('/login')
      expect(response.status).to eq(200)
      expect(response.body).to include('<form action="/login" method="POST">')
      expect(response.body).to include('<label>Email address: </label>')
      expect(response.body).to include('<input type="text" name="email">')
      expect(response.body).to include('<label>Password: </label>')
      expect(response.body).to include('<input type="text" name="password">')
      expect(response.body).to include('<input type="submit" value="submit">')
    end

    it "get /login even when logged in" do
      post('/login', email: 'duck2@makers.com', password: 'quack!')
      response = get('/login')
      expect(response.status).to eq(200)
      expect(response.body).to include('<form action="/login" method="POST">')  
    end 
  end

  context "post /login" do
    it "logs in" do
      response = post('/login', email: 'duck2@makers.com', password: 'quack!')
      expect(response.status).to eq(302)
      expect(response.body).to eq("")
    end

    it "logs in even if already logged in" do
      post('/login', email: 'duck2@makers.com', password: 'quack!')
      response = post('/login', email: 'duck2@makers.com', password: 'quack!')
      expect(response.status).to eq(302)
      expect(response.body).to eq("")
    end

    it "shows login error if password is incorrect" do
      response = post('/login', email: 'duck2@makers.com', password: 'quack')
      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Chitter: Login failed!</h1>')
    end

    it "shows login error if email is incorrect" do
      response = post('/login', email: 'duck3@makers.com', password: 'quack!')
      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Chitter: Login failed!</h1>')      
    end
  end

  context "get /new" do
    it "can't fetch the form unless logged in" do
      response = get('/new')
      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Chitter: Login to post a peep</h1>') 
    end

    it "gets the new peep form when logged in" do
      post('/login', email: 'duck2@makers.com', password: 'quack!')
      response = get('/new')
      expect(response.status).to eq(200)
      expect(response.body).to include('<label>Type your peep here: </label>')
      expect(response.body).to include('<textarea name="content", rows="4", cols="50">')
      expect(response.body).to include('<input type="submit" value="submit">')
    end
  end

  context "post /new" do
    it "can't post a peep unless logged in" do
      response = post('/new', content: "Peep from a rogue user")
      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Chitter: Login to post a peep</h1>')
    end

    it "can't post a peep when logged in if name or username are missing" do
      post('/login', email: 'duck2@makers.com', password: 'quack!')
      response = post('/new', content: "Hello from duck2!")
      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Chitter: Error posting Peep!</h1>')
      expect(response.body).to include('<p>Error details: invalid peep submitted</p>')
    end

    it "posts a peep" do
      post('/login', email: 'homer@simpsons.com', password: 'springfield1')
      response = post('/new', content: "Call Homer for all your plutonium disposal needs!")
      expect(response.status).to eq(302)
      expect(response.body).to eq("")
      result = get('/')
      expect(result.body).to include('<p>Call Homer for all your plutonium disposal needs!</p>')
      expect(result.body).to include('<p>By: Homer Simpson - @homer</p>')
    end
  end

  context "get /signup" do
    it "gets signup form" do
      response = get('/signup')
      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Chitter Signup</h1>')
      expect(response.body).to include('<label>Email address: </label>')
      expect(response.body).to include('<input type="text" name="email">')
      expect(response.body).to include('<label>Password: </label>')
      expect(response.body).to include('<input type="text" name="password">')
      expect(response.body).to include('<label>Name: </label>')
      expect(response.body).to include('<input type="text" name="name">')
      expect(response.body).to include('<label>Username: </label>')
      expect(response.body).to include('<input type="text" name="username">')
      expect(response.body).to include('<input type="submit" value="submit">')
    end

    it "gets signup form even when logged in" do
      post('/login', email: 'duck2@makers.com', password: 'quack!')
      response = get('/signup')
      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Chitter Signup</h1>')
    end
  end

  context "post /signup" do
    it "creates a user" do
      response = post(
        '/signup',
        email: 'willy@wonka.com',
        password: 'chocolate3',
        name: 'Willy Wonka',
        username: '@wonka'
      )
      expect(response.status).to eq(200)
      expect(response.body).to include('User: willy@wonka.com created')
      expect(response.body).to include('Click here to return to home screen')
    end

    it "won't create a user if the form is incomplete" do
      response = post(
        '/signup',
        email: 'willy@wonka.com',
        password: 'chocolate3'
      )
      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Chitter: Failed to create user</h1>')
      expect(response.body).to include('<p>User form incomplete</p>')
    end
  end
end

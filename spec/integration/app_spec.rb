require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do

  include Rack::Test::Methods

  let(:app) { Application.new }

  def reset_tables
    seed_sql = File.read('spec/seeds/chitter_seed.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_tables
  end

  context "GET /" do
    it "should return the home screen" do
      response = get('/')
      expect(response.status).to eq(200)
      expect(response.body).to include('<a href="/login">Login</a>')
      expect(response.body).to include('<a href="/sign_up">Sign Up</a>')
      expect(response.body).to include('<h1>Chitter</h1>')
    end

  end

  context "GET /login" do
    it "should return the login screen" do
      response = get('/login')
      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Login</h1>')
      expect(response.body).to include('<form action="/login" method="POST">')
      expect(response.body).to include('<input type="text" name="username" />')
      expect(response.body).to include('<input type="text" name="password" />')
    end

  end


  context "POST /login" do
    it "should allow the user to log in" do
      response = post(
        "/login",
        username: "CoolCat23",
        password: "Password%%5"
      )

      expect(response.status).to eq(200)
    end

    it "should return the error screen if the user's credentials are not correct (empty)" do
      response = post(
        "/login",
        username: "",
        password: ""
      )

      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>ERROR</h1>')
    end

    it "should return the error screen if the user's credentials are not correct (both incorrect)" do
      response = post(
        "/login",
        username: "Hi",
        password: "NotaPassword"
      )

      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>ERROR</h1>')
    end

    it "should return the error screen if the user's credentials are not correct (password incorrect)" do
      response = post(
        "/login",
        username: "JCMorgan",
        password: "NotaPassword"
      )

      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>ERROR</h1>')
    end
  end

  context "GET /sign_up" do
    it "should return the sign up screen" do
      response = get('/sign_up')
      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Sign-Up</h1>')
      expect(response.body).to include('<form action="/sign_up" method="POST">')
      expect(response.body).to include('<input type="text" name="name" />')
      expect(response.body).to include('<input type="text" name="username" />')
      expect(response.body).to include('<input type="text" name="email" />')
      expect(response.body).to include('<input type="text" name="password" />')
    end
  end

  context "POST /sign_up" do
    it "should create a new user" do
      response = post(
        "/sign_up",
        name: "Anne Bright",
        username: "IDontKnow",
        email: "ABfakeemail9873@email.com",
        password: "FakePassword43&"
      )

      expect(response.status).to eq(200)
    end

    it "should return the error screen when credentials do not fit requirements" do
      response = post(
        "/sign_up",
        name: "",
        username: "IDontKnow",
        email: "ABfakeemail9873@email.com",
        password: "FakePass"
      )

      expect(response.body).to include('<h1>ERROR</h1>')
    end
  end

  context "GET /new_peep" do
    it "should return the create peep screen" do
      response = get('/new_peep')
      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>New peep:</h1>')
      expect(response.body).to include('<form action="/new_peep" method="POST">')
      expect(response.body).to include('<input type="text" name="content" />')
    end
  end

  context "POST / new_peep" do
    it "should create a new peep" do
      response = post(
        "/new_peep",
        content: "Hi!"
      )
      expect(response.status).to eq(200)
    end
  end

  context "GET /new_reply/:id" do
    it "should return the create reply screen" do
      response = get('/new_reply/2')
      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>New reply:</h1>')
      expect(response.body).to include('<form action="/new_reply/2" method="POST">')
      expect(response.body).to include('<input type="text" name="content" />')
    end
  end

  context "POST /new_reply/:id" do
    it "should create a new reply" do
      response = post(
        "/new_reply/2",
        content: "Hi!"
      )
      expect(response.status).to eq(200)
    end
  end

  context "GET /replies/:id" do
    it "should return the replies of a post" do
      response = get('/replies/2')
      expect(response.status).to eq(200)
      expect(response.body).to include('CoolCat23')
      expect(response.body).to include('JCMorgan')
      expect(response.body).to include('Hi!')
      expect(response.body).to include('2022-12-04 13:01:32')
      expect(response.body).to include('2022-12-04 13:02:47')
      expect(response.body).to include(':D')
      expect(response.body).to include('<p><a href="/">Home</a>')
    end
  end

  context "GET /log_out" do
    it "should log the user out" do
      response = get('/log_out')
      expect(response.status).to eq(200)
    end
  end

end


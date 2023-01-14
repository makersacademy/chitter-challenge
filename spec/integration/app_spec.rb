require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Chitter do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods
  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Chitter.new }

  context "GET to /" do
    it "returns the home page with peeps on it" do
      response = get('/')
      expect(response.status).to eq 200
      expect(response.body).to include('<h1>Chitter</h1>')
    end
  end

  context "GET to /login" do
    it "returns the login page, with a form to input data" do
      response = get('/login')
      expect(response.status).to eq 200
      expect(response.body).to include('<h1>Login</h1>')
      expect(response.body).to include('<form action="/login" method="POST">')
      expect(response.body).to include('<input type="text" name="username">')
      expect(response.body).to include('<input type="password" name="password">')
    end
  end

  context "GET to /register" do
    it "returns the register page, with a form to input data" do
      response = get('/register')
      expect(response.status).to eq 200
      expect(response.body).to include('<form action="/register" method="POST">')
      expect(response.body).to include('<input type="password" name="password">')
      expect(response.body).to include('<input type="text" name="name">')
      expect(response.body).to include('<input type="text" name="email">')
    end
  end

  context "POST to /register" do
    it "adds a new user to the database" do

      # test_user = Hash.new
      # test_user[username] = 'tester1'
      # test_user[name] = 'Testy Mctester', 
      # test_user[email] = 'tester@gmail.com',
      # test_user[password] = 'password'

      response = post(
        '/register', 
        username: 'tester1', 
        name: 'Testy Mctester', 
        email: 'tester@gmail.com',
        password: 'password'
      )
      expect(User.where("username = 'tester1'").blank?).to eq false
    end
  end

  context "POST to /login" do
    it "will login a user with the correct credentials" do
      response = post(
        '/login',
        username: 'tester1',
        password: 'password'
      )

      response = get('/')
      expect(response.body).to include('Logged in as tester1')
    end
  end

  context "POST to /peeps" do
    it "adds a peep to the db and displays it on the index page" do
      peep_content = "This is a test peep"
      # firstly log in
      response = post(
        '/login',
        username: 'tester1',
        password: 'password'
      )
      # then add a peep
      response = post(
        '/add_peep',
        content: peep_content,
      )
      expect(Peep.where("content = '#{peep_content}'").blank?).to eq false
      response = get('/')
      expect(response.body).to include(peep_content)
    end
  end

end
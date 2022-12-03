require "spec_helper"
require "rack/test"
require_relative '../../app'

def reset_chitter_challenge_libary
  seed_sql = File.read('spec/seeds_chitter_challenge.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_challenge_test' })
  connection.exec(seed_sql)
end

describe Application do

  before(:each) do
    reset_chitter_challenge_libary
  end

  include Rack::Test::Methods

  let(:app) { Application.new }

  context 'for GET /' do
    it 'returns a list of posts in reverse order and links' do
      response = get("/")
      expect(response.status).to eq 200
      expect(response.body).to include('<h1>Chitter</h1>')
      expect(response.body).to include('This is another example post from username firstname')
      expect(response.body).to include('Peep added at: 2022-01-09 18:00:05 by First Name (@firstname)')
      expect(response.body).to include('Peep added at: 2022-01-08 04:05:06 by First Name (@firstname)')
      expect(response.body).to include('<a href="/signup">Sign up</a>')
      expect(response.body).to include('<a href="/login">Log in</a>')
      expect(response.body).to include('<a href="/new">Add a peep</a>')
    end
  end

  context 'for GET /signup' do
    it 'returns a sign up form' do
      response = get("/signup")
      expect(response.status).to eq 200
      expect(response.body).to include('<h2>Sign up</h2>')
      expect(response.body).to include('<form action="/signup" method="POST">') 
      expect(response.body).to include('<input type="text" name="name" maxlength="30" required><br /><br />') 
      expect(response.body).to include('<input type="text" name="email" maxlength="30" required><br /><br />')
      expect(response.body).to include('<input type="password" name="password" maxlength="8" required><br /><br />')
      expect(response.body).to include('<input type="text" name="username" maxlength="12" required><br /><br />')
      expect(response.body).to include('input type="submit"') 
    end
  end

  context 'for POST /signup' do 
    it 'creates a new user and returns a confirmation page' do
      response = post("/signup", name: "Third Name", email: "thirdname@email.com", password: "defgh456", username: "thirdname")
      expect(response.status).to eq(200)
      expect(response.body).to include('<h2>Sign up complete for thirdname</h2>')
      expect(response.body).to include('<a href="/">Back to home</a>')
    end
    it 'validates not a duplicate email' do
      response = post("/signup", name: "Third Name", email: "firstname@email.com", password: "defgh456", username: "thirdname")
      expect(response.status).to eq(200)
      expect(response.body).to include("Duplicate email or username, please re-submit")
    end
    it 'validates not a duplicate username' do
      response = post("/signup", name: "Third Name", email: "thirdname@email.com", password: "defgh456", username: "firstname")
      expect(response.status).to eq(200)
      expect(response.body).to include("Duplicate email or username, please re-submit")
    end
    it 'validates correct email' do
      response = post("/signup", name: "Third Name", email: "thirdnameemail", password: "defgh456", username: "firstname")
      expect(response.status).to eq(200)
      expect(response.body).to include("Incorrect email format, please re-submit")
    end
    it 'should return an error message if name parameter contains special characters' do
      response = post("/signup", name: "<script>", email: "thirdname@email.com", password: "defgh456", username: "thirdname")
      expect(response.status).to eq(200)
      expect(response.body).to include('Do not include special characters, please re-enter information')
    end
    it 'should return an error message if password parameter contains special characters' do
      response = post("/signup", name: "Third Name", email: "thirdname@email.com", password: "<script>", username: "thirdname")
      expect(response.status).to eq(200)
      expect(response.body).to include('Do not include special characters, please re-enter information')
    end
    it 'should return an error message if username parameter contains special characters' do
      response = post("/signup", name: "Third Name", email: "thirdname@email.com", password: "defgh456", username: "<script>")
      expect(response.status).to eq(200)
      expect(response.body).to include('Do not include special characters, please re-enter information')
    end
  end

  context 'for GET /signin' do
    it 'returns a log in form' do
      response = get("/login")
      expect(response.status).to eq 200
      expect(response.body).to include('<h2>Log in</h2>')
      expect(response.body).to include('<form action="/login" method="POST">') 
      expect(response.body).to include('<input type="text" name="email" maxlength="30" required><br /><br />')
      expect(response.body).to include('<input type="password" name="password" maxlength="8" required><br /><br />')
      expect(response.body).to include('input type="submit"') 
    end
  end

  context 'for GET /new' do
    it 'returns add a post form' do
      response = get("/new")
      expect(response.status).to eq 200
      expect(response.body).to include('<h2>Add a peep</h2>')
      expect(response.body).to include('<form action="/new" method="POST">') 
      expect(response.body).to include('<textarea rows = "5" cols = "60" name="content" maxlength="280" required></textarea><br /><br />')
      expect(response.body).to include('<option value="1">firstname</option>')
      expect(response.body).to include('<option value="2">secondname</option>')
      expect(response.body).to include('input type="submit"') 
    end
  end

  context 'for POST /new' do 
    it 'creates a new post and returns a confirmation page' do
      response = post("/new", content: "This is a test example post from username secondname", user_id: "2")
      expect(response.status).to eq(200)
      expect(response.body).to include('<h2>Peep added</h2>')
      expect(response.body).to include('<a href="/">Back to home</a>')
    end
    it 'should return an error message if parameter contains special characters' do
      response = post("/new", content: "This is a test example post from <script> username secondname", user_id: "2")
      expect(response.status).to eq(200)
      expect(response.body).to include('Do not include special characters, please re-enter information')
    end
  end

  context 'for POST /signin' do
    it 'logs in user' do
      response = post("/signup", name: "Third Name", email: "thirdname@email.com", password: "defgh456", username: "thirdname")
      expect(response.status).to eq(200)
      expect(response.body).to include('<h2>Sign up complete for thirdname</h2>')
      response = post("/login", email: "thirdname@email.com", password: "defgh456")  
      expect(response.status).to eq 200
      expect(response.body).to include('<h2>Log in complete for thirdname</h2>')
      expect(response.body).to include('<a href="/">Back to home</a>')
    end
  end
end

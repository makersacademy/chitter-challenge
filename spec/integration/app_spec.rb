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
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context 'for GET /' do
    it 'returns a list of posts in reverse order and links' do
      response = get("/")
      expect(response.status).to eq 200
      expect(response.body).to include('<h1>Chitter</h1>')
      expect(response.body).to include('This is another example post from username firstname')
      expect(response.body).to include('Time: 2022-01-09 18:00:05')
      expect(response.body).to include('Name: First Name')
      expect(response.body).to include('Username: firstname')
      expect(response.body).to include('This is an example post from username firstname')
      expect(response.body).to include('Time: 2022-01-08 04:05:06')
      expect(response.body).to include('Name: First Name')
      expect(response.body).to include('Username: firstname')
      expect(response.body).to include('<a href="/signup">Sign up</a>')
    end
  end

  context 'for GET /signup' do
    it 'returns a list of posts in reverse order and links' do
      response = get("/signup")
      expect(response.status).to eq 200
      expect(response.body).to include('<h1>Sign up to Chitter</h1>')
      expect(response.body).to include('<form action="/signup" method="POST">') 
      expect(response.body).to include('<input type="text" name="name" maxlength="30" required><br /><br />') 
      expect(response.body).to include('<input type="text" name="email" maxlength="30" required><br /><br />')
      expect(response.body).to include('<input type="password" name="password" maxlength="8" required><br /><br />')
      expect(response.body).to include('<input type="text" name="username" maxlength="12" required><br /><br />')
      expect(response.body).to include('<input type="submit">') 
    end
  end

  context 'for POST /signup' do 
    it 'creates a new album and returns a confirmation page' do
      response = post("/signup", name: "Third Name", email: "thirdname@email.com", password: "defgh456", username: "thirdname")
      expect(response.status).to eq(200)
      expect(response.body).to include('<h2>Sign up complete for thirdname!</h2>')
      expect(response.body).to include('<a href="/">Back to home</a>')
    end
    it 'validates the not a duplicate email' do
      response = post("/signup", name: "Third Name", email: "firstname@email.com", password: "defgh456", username: "thirdname")
      expect(response.status).to eq(200)
      expect(response.body).to include("Duplicate email or username, please re-submit with different details")
    end
    it 'validates the not a duplicate username' do
      response = post("/signup", name: "Third Name", email: "thirdname@email.com", password: "defgh456", username: "firstname")
      expect(response.status).to eq(200)
      expect(response.body).to include("Duplicate email or username, please re-submit with different details")
    end
    it 'validates correct email' do
      response = post("/signup", name: "Third Name", email: "thirdnameemail", password: "defgh456", username: "firstname")
      expect(response.status).to eq(200)
      expect(response.body).to include("Incorrect email format, please re-submit with different details")
    end


  end

end

require "spec_helper"
require "rack/test"
require_relative '../../app'

def reset_tables
  sql_seed = File.read('spec/seeds/empty_seeds_chitter_db.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_db' })
  connection.exec_params(sql_seed)
end

describe Application do
  before(:each) do
    reset_tables
  end
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "GET to /" do
    it "returns 200 OK" do
      # Send a GET request to /
      # and returns a response object we can test.
      response = get("/")

      # Assert the response status code and body.
      expect(response.status).to eq(200)
      expect(response.body).to include("Like twitter")
    end

    it "contains the sign up link" do
      response = get("/")
      expect(response.body).to include('<a href = "/signup">Sign up here!</a>')
    end
    it "contains the write peep link" do
      response = get("/")
      expect(response.body).to include('<a href = "/peep">Write new peep!</a>')
    end
  end

  context "GET/signup " do
    it "returns 200 OK and form data " do
      response = get("/signup")
      expect(response.status).to eq(200)
      expect(response.body).to include('<input type="text" name="username" />')
      expect(response.body).to include('<input type="text" name="password" />')
      expect(response.body).to include('<input type="submit" />')
    end
  end

  context "GET/peep" do
    it "returns 200 OK and the new peep form data" do
      response = get("/peep")
      expect(response.status).to eq(200)
      expect(response.body).to include('<input type="text" name="content" />')
    end 
  end
  
  context "GET/peepmade" do
    it "returns 200O OK and body" do
      response = get('/peepmade')
      expect(response.status).to eq (200)
      expect(response.body).to include("<div><head>Succesfully wrote a peep!</head></div>")
    end

  end

  context "POST/peep" do
    it "returns 400 status and body 'Contents or author id must not be empty'" do
      response = post("/peep", content: "", author_id: 1)
      expect(response.status).to eq(400)
      expect(response.body).to include("Contents or author id must not be empty")
    end

    it "returns 200 and and body when peep is succesfully made" do
      response = post('/peep', content: "This is my content", author_id: 1)
      expect(response.status).to eq(200)
      expect(response.body).to include("<div><head>Succesfully wrote a peep!</head></div>")
      all = get("/")
      expect(all.body).to include("This is my content")
    end

    it "returns 400 and 'Cannot enter author id above number of users' if author_id > num of users" do
      response = post('/peep', content: "This is my content", author_id: 40)
      expect(response.status).to eq(400)
      expect(response.body).to include("Author id not found")
    end

    it "returns 400 and 'Author id must be above 0' if author id <0" do
      response = post('/peep', content: "This is content", author_id: 0)
      expect(response.status).to eq(400)
      expect(response.body).to include ("Author id not found")
    end
  end

  context "POST/signup invalid signup" do
    it "returns 400 OK and message 'Username or password cannot be empty' when empty username" do
      response = post("/signup", username: "", password: '1234')
      expect(response.status).to eq(400)
      expect(response.body).to include("Username or password cannot be empty")
    end

    it "returns 200 OK and posts succesfully when username and password are valid" do
      response = post("/signup", username: "John", password: '1234')
      expect(response.status).to eq(200)
      expect(response.body).to include("<div><head>Succesfully signed up!</head></div>")
    end

    it "returns Existing username, please choose another if Username exists" do
      existing_name_repo = post("/signup", username: "Mike", password: '1234')
      expect(existing_name_repo.status).to eq(200)
      repo = post("/signup", username: "Joe", password: '1234')
      expect(repo.body).to include ("Existing username, please choose another")
    end
  end

  context "GET/login" do
    it "Returns 200 OK and body of form to login" do
      response = get("/login")
      expect(response.status).to eq(200)
      expect(response.body).to include('<input type="text" name ="username" />')
      expect(response.body).to include('<input type="text" name ="password" />')
      expect(response.body).to include('<input type="submit" />')
    end
  end

  context "POST/login" do
    it "returns 200 OK and body text of succesful login" do
      response = post("/login", username: "Joe", password: "123")
      expect(response.status).to eq(200)
      expect(response.body).to include('<head><h2>Logged in succesfully as Joe with ID 1!</h2></head>')
      expect(response.body).to include('<a href ="/"><h2>Return to homepage</h2></a>')
    end

    it "returns 400 and error message if wrong password for username" do
      response = post("/login", username: "Joe", password: "hello")
      expect(response.status).to eq(400)
      expect(response.body).to include('Incorrect username or password')

    end
  end
end
require_relative "../../app"
require "spec_helper"
require "rack/test"

def reset_users_posts_table
  seed_sql = File.read('spec/schemas-tables/seeds_users_posts.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

RSpec.describe Application do 
  before(:each) do 
    reset_users_posts_table
  end 
  include Rack::Test::Methods
  let(:app) { Application.new }

  context "GET /" do 
    it "returns correct html and status" do 
      response = get("/")

      expect(response.status).to eq(200)
      expect(response.body).to include("Create A New Chitter Acount!")
      expect(response.body).to include("Create New Post!")
      expect(response.body).to include("The Chitter Stream!")
    end
  end
  context "GET /stream" do 
    it "returns correct html and status" do 
      response = get("/stream")

      expect(response.status).to eq(200)
      expect(response.body).to include('<p>POSTED BY: fred23</p>')
      expect(response.body).to include("<p>hot take: vine is the american dream</p>")
      expect(response.body).to include("<p>i always daydream about how kanye west will save the economy</p>")
    end
  end
  context "GET /post" do 
    it "returns correct html and status" do 
      response = get("/post")

      expect(response.status).to eq(200)
      expect(response.body).to include('<input type="submit" value="Create Post"/>')
      expect(response.body).to include('<form action="/post/added" method="POST">')
      expect(response.body).to include('<input type="text" name="content"><br/>')
    end
  end
  context "POST /post/added" do 
    it "returns correct html and status" do 
      response = post("/post/added", content: "my new test post")

      expect(response.status).to eq(200)
      expect(response.body).to include('<h2>Post Created!</h2>')
      expect(response.body).to include('my new test post')
    end
  end
  context "GET /login" do 
    it "returns correct html and status" do 
      response = get("/login")

      expect(response.status).to eq(200)
      expect(response.body).to include('<form action="/login" method="POST">')
      expect(response.body).to include('<input type="submit" value="Log In"/>')
    end
  end
  context "POST /login" do 
    it "returns correct html and status when login is correct" do 
      response = post("/login", email:"rico_fr@gmail.com", password:"leftrightgdnight!2323")

      expect(response.status).to eq(200)
      expect(response.body).to include("<h2>You've Logged in succesfully!</h2>")
      expect(response.body).to include('p>Your Logged in as:</p>')
      expect(response.body).to include('<p>rico-franco</p>')
    end
     it "returns correct html and status when login password is incorrect" do 
      response = post("/login", email:"rico_fr@gmail.com", password:"ht!2323")

      expect(response.status).to eq(200)
      expect(response.body).to include("<h2>Your Password is Incorrect!</h2>")
      expect(response.body).to include('<p>please try again!</p>')
      expect(response.body).to include('<li><a href="/login">Login</a></li>')
    end
    it "returns correct html and status when login email is incorrect" do 
      response = post("/login", email:"rifr@gmail.com", password:"leftrightgdnight!2323")

      expect(response.status).to eq(200)
      expect(response.body).to include("<h2>Your Email is Incorrect!</h2>")
      expect(response.body).to include('<p>please try again!</p>')
      expect(response.body).to include('<li><a href="/login">Login</a></li>')
    end
  end
  context "GET /new_user" do 
    it "returns correct status and html" do 
      response = get('/new_user') 
      
      expect(response.status).to eq(200)
      expect(response.body).to include('<input type="text" name="password"><br/>
    <input type="submit" value="Create Acount"/>')
    expect(response.body).to include("")
    end 
  end
  context "POST /new_user/added" do 
    it "returns correct status and htm for correctly inputed acount details" do 
      response = post('/new_user/added',user_name:"ruben",email:"fjak@gmail.com",password:"fafjaj!") 
      
      expect(response.status).to eq(200)
      expect(response.body).to include('<p>ruben</p>')
      expect(response.body).to include("<h2>You've succesfully created a new acount!</h2>")
    end 
  end
  context "GET /log-out" do 
    it "returns correct status and html" do 
      response = get('/log-out')
      
      expect(response.status).to eq(200)
      expect(response.body).to include('<h2>Would you like to stop chittering and Logout?</h2>')
    expect(response.body).to include('<li><a href="/log-out/completed">if so click this! </a></li>')
    end 
  end
  context "GET /log-out/completed" do 
    it "returns correct status and html" do 
      response = get('/log-out/completed')
      
      expect(response.status).to eq(200)
      expect(response.body).to include("<h2>You've been Logout succesfully, see you soon!</h2>")
    expect(response.body).to include('<li><a href="/">Home Page</a></li>')
    end 
  end
end 
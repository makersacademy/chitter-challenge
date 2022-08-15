require "spec_helper"
require "rack/test"
require_relative "../../app"

# def reset_seeds_table
#   connection = PG.connect({host: "127.0.0.1", dbname: "chitter_test"})
#   seeds_sql = File.read("spec/seeds/chitter_test.sql")
#   connection.exec(seeds_sql)
# end


describe Application do 
  include Rack::Test::Methods

  let(:app) { Application.new }

  before(:each) do 
    connection = PG.connect({host: "127.0.0.1", dbname: "chitter_test"})
    seeds_sql = File.read("spec/seeds/chitter_test.sql")
    connection.exec(seeds_sql)
  end

  context "GET /" do 

    it "shows the homepage of Chitter" do 

      response = get('/')

      expect(response.status).to eq(200)
      expect(response.body).to include ("Welcome to Chitter!")

    end

    it "has a sign up button" do 

      response = get('/')

      expect(response.status).to eq(200)
      expect(response.body).to include("<a href= \"/signup/new\">Sign up to Chitter now.</a>")

    end

    it "has a link to view everyone's peeps" do 

      response = get('/')

      expect(response.status).to eq(200)
      expect(response.body).to include("<a href= \"/posts\">See what people are saying!</a> ")

    end

  end

  context "GET /signup/new" do 

    it "signs up a new user" do 

      response = get('/signup/new')

      expect(response.status).to eq(200)

      expect(response.body).to include("<input type=\"text\" name=\"email\" /><br />")
      expect(response.body).to include("<label>Username: </label>")

    end

  end

  context "POST /signup" do 

    it "gets the information from the form and put it in the database" do 

      response = post('/signup', name: "Bob", email: "firstblood@gmail.com", username: "BabyPunch", password: "nightoff12")

      expect(response.status).to eq(200)
      expect(response.body).to eq("You have successfully signed up for Chitter!")

    end

  end

  context "GET /posts" do 

    it "shows all the peeps posted by users" do

      response = get('/posts')

      expect(response.status).to eq(200)
      expect(response.body).to include("Peep")

    end 

  end

  context "GET /post/new" do 

    it "shows a form for the user to post a message" do 

      response = get('/post/new')

      expect(response.status).to eq(200)
      expect(response.body).to include("<label>What is your name?</label>")


    end

  end

  context "POST /post" do 

    it "send a peep" do 

      response = post('/post')

      expect(response.status).to eq(200)
      expect(response.body).to eq("Your peep has been sent!")


    end


  end

  
    

end  
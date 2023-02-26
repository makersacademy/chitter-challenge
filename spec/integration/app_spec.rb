require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  def reset_posts_table
    seed_sql = File.read('spec/seeds_posts.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
    connection.exec(seed_sql)
  end

  def reset_user_table
    seed_sql = File.read('spec/seeds_users.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
    connection.exec(seed_sql)
  end
  
  before(:each) do 
    reset_posts_table
    reset_user_table
  end

  context "GET /" do
    it 'returns 200 OK' do
      response = get('/')

      expect(response.status).to eq(200)
      expect(response.body).to include ('<a href="/login">Login here</a>')
      expect(response.body).to include ('<a href="/signup">Signup here</a>')
      expect(response.body).to include ('Ron Weasley A.K.A. gingernut says:')
      expect(response.body).to include ('Looking forward to quidditch world cup!')
      expect(response.body).to include ('At 2023-01-09 11:11:06')
    end
  end

  context "GET /login" do
    it "returns the login form" do
      response = get('/login')

      expect(response.status).to eq(200)
      expect(response.body).to include ('<label for="user_name">User name:<label><input type="text" name="user_name">')
    end
  end

  context "GET /signup" do
    it "returns the signup form" do
      response = get('/signup')

      expect(response.status).to eq(200)
      expect(response.body).to include('<label for="name">Enter your name:<label><input type="text" name="name">')
    end
  end

  context "POST /login" do
    it "will run validate user_name and password" do
      response = post('/login', 
                      user_name: 'lightning-boy', 
                      password: 'scarhead1234')
      expect(response.status).to eq(200)
      expect(response.body).to include('<h2>Welcome, Harry Potter</h2>')
      expect(response.body).to include ('Looking forward to quidditch world cup!')
    end

    
    it "when user password incorrect" do
      response = post('/login', 
                      user_name: 'lightning-boy', 
                      password: '123')
      expect(response.status).to eq(200)
      expect(response.body).to include ('<p>Wrong user name and password combination! Please try again</p>')
    end

    it "when user name does not exist it will redirect to sign up page" do
      response = post('/login', 
                      user_name: 'bill-bob', 
                      password: 'scarhead1234')
      expect(response.status).to eq(200)
      expect(response.body).to include('<label for="name">Enter your name:<label><input type="text" name="name"> <br>')
    end
  end

  context "POST /signup" do
    it "when a email address already exists" do
      response = post('/signup',
                      name: 'Neville Longbottom', 
                      user_name: 'plant-lover',
                      email: 'harry@hogwarts.com', 
                      password: '1234')
      expect(response.status).to eq(200)
      expect(response.body).to include('<p>Email already in use. Please login instead!</p>')
    end

    it "when a user name already exists, user told to select new username" do
      response = post('/signup',
                      name: 'Neville Longbottom', 
                      user_name: 'lightning-boy',
                      email: 'neville@hogwarts.com', 
                      password: '1234')
      expect(response.status).to eq(200)
      expect(response.body).to include('<p>That user name has been taken, please choose a different user name!</p>')
    end

    it "creates a new user" do
      response = post('/signup',
                      name: 'Neville Longbottom', 
                      user_name: 'plant-lover',
                      email: 'neville@hogwarts.com', 
                      password: 'wizardlife')
      expect(response.status).to eq(200)
      user_repo = UserRepository.new
      expect(user_repo.all).to include(
        have_attributes(name: 'Neville Longbottom')
      )
    end
  end

  context "POST /newpost" do
    it "creates a new post" do
      response = post('/login', 
        user_name: 'lightning-boy', 
        password: 'scarhead1234')

      response = post('/newpost', 
        message: 'Hedwig has gone for a fly around',
        user_name: 'lightning-boy')
      expect(response.status).to eq(200)
    end

    it "redirects the user if they are not logged in" do 
      response = post('/newpost', 
        message: 'Hedwig has gone for a fly around',
        user_name: 'lightning-boy')
      expect(response.body).to include ('<label for="user_name">User name:<label><input type="text" name="user_name">')
    end
  end

  context "POST /logout" do
    it "returns the index page when a user logs out" do
      response = post('/logout')
      expect(response.body).to include ('Ron Weasley A.K.A. gingernut says:')
    end
  end
end
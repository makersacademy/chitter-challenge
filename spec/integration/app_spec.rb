require_relative '../spec_helper'
require 'rack/test'
require_relative '../../app'

describe Application do
  include Rack::Test::Methods
  let(:app) { Application.new }

  def reset_tables
    seed_sql = File.read('spec/seeds/seeds_chitter.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_db_test' })
    connection.exec(seed_sql)
  end
  
  after(:each) do 
    reset_tables
  end

  context "GET /homepage" do
    # Need to workout how to add and test user_name to posts online
    it "should return the homepage that lists all posts in reverse order" do
      post_repo = PostRepository.new
      user_repo = UserRepository.new
      users = user_repo.all
      posts = post_repo.all
      response = get('/homepage')
      posts.each do |post|
        expect(response.body).to include(post.content, post.date_time)
      end
      expect(response.body).to include('<a href="/log_in">Log In to Chitter</a>')
      expect(response.status).to eq(200)
    end
  end

  context "POST /sign_up" do
    it "let's the user sign up if email or user_name is not taken" do
      user_repo = UserRepository.new
      response = post('/sign_up',
        name: 'Harry Potter',
        email: 'h1@hogs.com',
        user_name: "BigWizz",
        password: '123')
      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Welcome to Chitter</h1>')
      expect(response.body).to include('<a href="/homepage">Head back to the homepage to start Chitting</a>')
    end
  end  

  context "GET /sign_up" do
    it "returns the sign up page" do
      response = get('/sign_up')
      expect(response.body).to include('<label>Name: </label>')
      expect(response.body).to include('<label>Email: </label>')
      expect(response.body).to include('<label>User Name: </label>')
      expect(response.body).to include('<label>Password: </label>')
      expect(response.body).to include('<input type="text" name="name" /><br>')
      expect(response.body).to include('<input type="text" name="email" /><br>')
      expect(response.body).to include('<input type="text" name="user_name" /><br>')
      expect(response.body).to include('<input type="text" name="password" /><br>')
      expect(response.status).to eq(200)
    end
  end  

  context "GET /log_in" do
    it "returns the log in page" do
      response = get('/log_in')
      expect(response.body).to include('<label>User Name: </label>')
      expect(response.body).to include('<label>Password: </label>')
      expect(response.body).to include('<input type="text" name="user_name" /><br>')
      expect(response.body).to include('<input type="text" name="password" /><br>')
      expect(response.status).to eq(200)
    end
  end  

  context "POST /log_in" do
    it "changes the user database to logged in, lets the user then post" do
      response = post('/log_in',
      user_name: 'adam1',
      password: 'password1')
      expect(response.body).to include('<label>My Peep: </label>')
      expect(response.body).to include('<input type="text" name="new_content" /><br>')
      expect(response.body).to include('<input type="submit" value="Peep"/>')
      expect(response.status).to eq(200)
    end
  end  
end
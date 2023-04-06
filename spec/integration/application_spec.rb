require "spec_helper"
require "rack/test"
require_relative '../../app'

describe ChitterApplication do
  include Rack::Test::Methods
  let(:app) { ChitterApplication.new }

  context "GET /" do
    it 'displays the feed and shows prompt to login if user is not logged in' do
      response = get('/')
      expect(response.body).to include('<div><b>Chit:</b> I pray for the day where we stop using sinatra <b>By:</b> Useface <b>At:</b> 2023-03-20 / 10:39 </div>')
      expect(response.body).to include('<a href="/login">Log in</a>')
      expect(response.body).to_not include('<a href="/logout">Log Out</a>')
    end  

    it 'displays the feed and shows prompt to logout and create post if user is logged in' do
      response = post('login', 
        username: "Useface", 
        password: "usersville")
      expect(response).to be_redirect
      response = get('/')
      expect(response.body).to include('<div><b>Chit:</b> I pray for the day where we stop using sinatra <b>By:</b> Useface <b>At:</b> 2023-03-20 / 10:39 </div>')
      expect(response.body).to_not include('<a href="/login">Log in</a>')
      expect(response.body).to include('<a href="/logout">Log Out</a>')
    end  
  end

  context "GET /login" do
    it 'displays the login form to the user' do
      response = get('/login')
      expect(response.body).to include("<input type='submit' value='log me in'>")
      expect(response.body).to include("<input type='text' placeholder='username' name='username' required>")
      expect(response.body).to include("<input type='password' placeholder='password' name='password' required>")
    end
  end

  context "POST /login" do
    it 'redirects the user back to the feed page if logged in with correct credentials' do
      response = post('login', 
        username: "Useface", 
        password: "usersville")
      expect(response).to be_redirect
      follow_redirect!
      expect(last_request.path).to eq("/")
    end

    it 'redirects the user back to the login page if input with < or > is included' do
      response = post('login', 
        username: "Userf<ace", 
        password: "usersvi>lle")
      expect(response).to be_redirect
      follow_redirect!
      expect(last_request.path).to eq("/login")
    end

    it 'redirects the user back to the login page if username does not exist in db' do
      response = post('login', 
        username: "Uuuuuuuu", 
        password: "usersville")
      expect(response).to be_redirect
      follow_redirect!
      expect(last_request.path).to eq("/login")
    end

    it 'redirects the user back to the login page if username does not match the password' do
      response = post('login', 
        username: "Useface", 
        password: "wrongpass")
      expect(response).to be_redirect
      follow_redirect!
      expect(last_request.path).to eq("/login")
    end
  end

  context "GET /register" do
    it 'displays the register form to the user' do
      response = get('/register')
      expect(response.body).to include("<input type='submit' value='register'>")
      expect(response.body).to include("<input type='text' placeholder='username' name='username' required>")
      expect(response.body).to include("<input type='text' placeholder='name and surname' name='real_name' required>")
      expect(response.body).to include("<input type='text' placeholder='e-mail address' name='email' required>")
      expect(response.body).to include("<input type='password' placeholder='password' name='password' minlength= 8 required>")
    end
  end

  context "GET /logout" do
    it 'logs the user out' do
      response = get('logout')
      expect(response).to be_redirect
      follow_redirect!
      expect(last_request.path).to eq("/")
    end
  end

end
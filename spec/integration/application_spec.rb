require "spec_helper"
require "rack/test"
require_relative '../../app'
require 'database_cleaner/active_record'


describe ChitterApplication do
  include Rack::Test::Methods
  let(:app) { ChitterApplication.new }

  context "GET /" do
    it 'displays the feed and shows prompt to login if user is not logged in' do
      response = get('/')
      expect(response.body).to include('<div><b>Chit:</b> I pray for the day where we stop using sinatra <br> <b>By:</b> Useface <b>At:</b> <u>2023-03-20 / 10:39</u> </div>')
      expect(response.body).to include('<a href="/login">Log in</a>')
      expect(response.body).to_not include('<a href="/logout">Log Out</a>')
    end  

    it 'displays the feed and shows prompt to logout and create post if user is logged in' do
      response = post('login', 
        username: "Useface", 
        password: "usersville")
      expect(response).to be_redirect
      response = get('/')
      expect(response.body).to include('<div><b>Chit:</b> I pray for the day where we stop using sinatra <br> <b>By:</b> Useface <b>At:</b> <u>2023-03-20 / 10:39</u> </div>')
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

  context "GET /create_post" do
    it 'displays the create post form to the user when user is logged in' do
      response = post('login', 
        username: "Useface", 
        password: "usersville")
      response = get('create_post')
      expect(response.body).to include("<textarea type='text' placeholder='your ramblings' name='content' maxlength=140 required cols=50 rows=10></textarea>")
    end

    it 'redirects you to the login page if you try to post without credentials' do
      response = get('create_post')
      expect(response).to be_redirect
      follow_redirect!
      expect(last_request.path).to eq("/login")  
    end
  end

  context "POST /create_post" do
    it 'redirects you to the login page if you try to post without credentials' do
      response = post('create_post', 
        user_id: 6,
        content: "This route is as protected as the rental prices in London", 
        created_at: Time.now,
        updated_at: Time.now
      )
      expect(response).to be_redirect
      follow_redirect!
      expect(last_request.path).to eq("/login")
    end

    it 'creates a post and sends you back to the login feed once successful' do
      DatabaseCleaner.strategy = :transaction
      DatabaseCleaner.start 
      current_time = Time.now
      response = post('login', 
        username: "Useface", 
        password: "usersville")
      response = post('create_post', 
        user_id: 6,
        content: "This route is as protected as the rental prices in London",
        created_at: current_time,
        updated_at: current_time 
      )
      expect(response).to be_redirect
      follow_redirect!
      expect(last_request.path).to eq("/")
      response = get('/')
      expect(response.body).to include("<div><b>Chit:</b> This route is as protected as the rental prices in London <br> <b>By:</b> Useface <b>At:</b> <u>#{(current_time-3600).strftime("%F / %H:%M")}</u> </div>")
      DatabaseCleaner.clean
      
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

  context "POST /register" do
    it 'redirects the user back to the main feed if registered successfully' do
      DatabaseCleaner.strategy = :transaction
      DatabaseCleaner.start 
      response = post('register', 
        username: "Registerro",
        real_name: "Regis Terry", 
        password: "password",
        email: "regis@terry.com"
      )
      expect(response).to be_redirect
      follow_redirect!
      expect(last_request.path).to eq("/")
      response = get('/')
      expect(response.body).to include('<div><b>Chit:</b> I pray for the day where we stop using sinatra <br> <b>By:</b> Useface <b>At:</b> <u>2023-03-20 / 10:39</u> </div>')
      expect(response.body).to_not include('<a href="/login">Log in</a>')
      expect(response.body).to include('<a href="/logout">Log Out</a>')
      DatabaseCleaner.clean
    end

    it 'redirects the user back to the registry page if input is incorrect' do
      response = post('register', 
        username: "<",
        real_name: "Regis Terry", 
        password: "password",
        email: "regis@terry.com"
      )
      expect(response).to be_redirect
      follow_redirect!
      expect(last_request.path).to eq("/register")
    end

    it 'redirects the user back to the registry page if input is incorrect' do
      response = post('register', 
        username: "Usek",
        real_name: "", 
        password: "password",
        email: "regis@terry.com"
      )
      expect(response).to be_redirect
      follow_redirect!
      expect(last_request.path).to eq("/register")
    end

    it 'redirects the user back to the registry page if username exists' do
      response = post('register', 
        username: "Useface",
        real_name: "some person", 
        password: "password",
        email: "regis@terry.com"
      )
      expect(response).to be_redirect
      follow_redirect!
      expect(last_request.path).to eq("/register")
    end

    it 'redirects the user back to the registry page if email exists' do
      response = post('register', 
        username: "Registerro",
        real_name: "some person", 
        password: "password",
        email: "Userella@userio.uo"
      )
      expect(response).to be_redirect
      follow_redirect!
      expect(last_request.path).to eq("/register")
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
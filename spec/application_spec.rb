require "spec_helper"
require "rack/test"
require "orderly"
require_relative '../app'
require 'database_cleaner/active_record'

describe ChitterApplication do
  include Rack::Test::Methods
  let(:app) { ChitterApplication.new }
  let(:users_post) { '<p><b>Chit:</b> I pray for the day where we stop using sinatra <br> <b>By:</b> Useface <b>At:</b> <u>2023-03-20 / 10:39</u> <a href="reply/31">Reply</a></p>' }
  let(:users_reply) { "<p style='color: navy;'><b>►►► Reply:</b> Best internet arguments start with just one reply <b>By:</b> Useface <b>At:</b> <u>2023-03-21 / 20:12</u></p>" }

  def login
    response = post('login', 
      username: "Useface", 
      password: "usersville")
    return response
  end

  context "GET /" do
    it 'displays the feed and shows prompt to login if user is not logged in' do
      response = get('/')
      expect(response.body).to include(users_post)
      expect(response.body).to include('<a href="/login">Log in</a>')
      expect(response.body).to_not include('<a href="/logout">Log Out</a>')
    end

    describe "the order of posts displayed on chitter", type: :feature do
      it "shows parent posts on descending and replies in an ascending order" do
        visit '/'
        first_post = all('p', text: 'I pray for the day where we stop using sinatra').first
        last_post = all('p', text: 'I was late so I am shown first').first
        first_reply_to_first_post = all('p', text: 'Best internet arguments start with just one reply').first
        second_reply_to_first_post = all('p', text: 'And then it carries on like an avalanche from there').first
        expect(last_post).to appear_before(first_post)
        expect(first_post).to appear_before(first_reply_to_first_post)
        expect(first_reply_to_first_post).to appear_before(second_reply_to_first_post)
      end
    end

    it 'displays the feed and shows prompt to logout and create post if user is logged in' do
      response = login
      expect(response).to be_redirect
      response = get('/')
      expect(response.body).to include(users_post)
      expect(response.body).to_not include('<a href="/login">Log in</a>')
      expect(response.body).to include('<a href="/logout">Log Out</a>')
    end  

    it 'displays the replies made to posts in the feed in correct format' do
      response = get('/')
      expect(response.body).to include(users_post)
      expect(response.body).to include(users_reply)
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
      response = login
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

  context "GET /reply" do
    it 'displays the create post form and original post content to the user when user is logged in' do
      login
      response = get('reply/31')
      expect(response.body).to include("<p>Original post was by: Useface</p>")
      expect(response.body).to include("<p>They said: I pray for the day where we stop using sinatra <b>at</b> 2023-03-20 / 10:39</p>")
      expect(response.body).to include("<textarea type='text' placeholder='your response' name='content' maxlength=140 required cols=50 rows=10></textarea>")
    end

    it 'redirects you to the login page if you try to post without credentials' do
      response = get('reply/31')
      expect(response).to be_redirect
      follow_redirect!
      expect(last_request.path).to eq("/login")  
    end
  end

  context "POST /reply" do
    it 'creates a reply and sends you back to the login feed once successful' do
      DatabaseCleaner.strategy = :transaction
      DatabaseCleaner.start
      current_time = Time.now
      login
      response = post('reply/31', 
        user_id: 6,
        content: "Here is my reply",
        parent_id: 31
      )
      expect(response).to be_redirect
      follow_redirect!
      expect(last_request.path).to eq("/")
      response = get('/')
      expect(response.body).to include("<p style='color: navy;'><b>►►► Reply:</b> Here is my reply <b>By:</b> Useface <b>At:</b> <u>#{(current_time - 3600).to_formatted_s(:chitter)}</u></p>")
      DatabaseCleaner.clean
    end
  
    it 'redirects you to the login page if you try to reply without credentials' do
      response = post('reply/31',
      user_id: 6,
      content: "this is my reply")
      expect(response).to be_redirect
      follow_redirect!
      expect(last_request.path).to eq("/login")  
    end
  end

  context "GET /create_post" do
    it 'displays the create post form to the user when user is logged in' do
      login
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
      DatabaseCleaner.strategy = :transaction
      DatabaseCleaner.start 
      response = post('create_post', 
        user_id: 6,
        content: "This route is as protected as the rental prices in London"
      )
      expect(response).to be_redirect
      follow_redirect!
      expect(last_request.path).to eq("/login")
      DatabaseCleaner.clean
    end

    it 'creates a post and sends you back to the login feed once successful' do
      DatabaseCleaner.strategy = :transaction
      DatabaseCleaner.start
      current_time = Time.now
      login
      response = post('create_post', 
        user_id: 6,
        content: "This route is as protected as the rental prices in London",
      )
      expect(response).to be_redirect
      follow_redirect!
      expect(last_request.path).to eq("/")
      response = get('/')
      expect(response.body).to include("<p><b>Chit:</b> This route is as protected as the rental prices in London <br> <b>By:</b> Useface <b>At:</b> <u>#{(current_time - 3600).to_formatted_s(:chitter)}</u>")
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
      expect(response.body).to include(users_post)
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

  describe "invalid addresses", type: :feature do
    it 'redirect you to a 404 page' do
      visit ('/invalidplace')
      expect(page.status_code).to eq 404
      expect(page).to have_content('Page you are looking for does not exist')
      expect(page).to have_content('Take me to promised lands')
    end
  end
end

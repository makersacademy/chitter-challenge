require "spec_helper"
require "rack/test"
require_relative '../../app'
require 'erb'
require 'timecop'

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  def reset_chitter_database_test
    seed_sql = File.read('spec/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
    connection.exec(seed_sql)
  end

  before(:each) do 
    reset_chitter_database_test
  end

  context 'GET /' do
    it "displays peeps with time and username in the homepage" do
      response = get('/')
      expect(response.status).to eq(200)
      expect(response.body).to include('2023-04-10 15:12:00')
      expect(response.body).to include('jane_d0e')
      expect(response.body).to include('new peep!')
      expect(response.body).to include('2023-04-09 19:10:00')
      expect(response.body).to include('j0ndoe')
      expect(response.body).to include('peep 1')
    end

  end

  context 'GET /signup' do
    it "renders the signup page" do
      response = get('/signup')
      expect(response.status).to eq(200)
      expect(response.body).to include('<h2>Create a Chitter Account</h2>')
    end

  end

  context 'POST /signup' do
    it "validates email input and username input are not being used by existing Chitter users" do
      response = post('/signup', name: 'Elon Musk', email: 'john_d@email.com', username: 'j0ndoe', password: 'Fakepas5word')
      
      expect(response.body).to include('<h2>Create a Chitter Account</h2>')
      expect(response.body).to include('email address or username already exists, try again.')
    end

    it "validates user's inputs have met the minimum requirements" do
      response = post('/signup', name: 'Elon Musk', email: 'wrongemail', username: 'another_elon', password: 'Fakepas5word')
    
      expect(response.body).to include('<h2>Create a Chitter Account</h2>')
      expect(response.body).to include('Make sure Email Address is valid')
      expect(response.body).to include('Make sure Username is at least three characters long')
      expect(response.body).to include('Make sure Password is at least eight characters long')
    end

    it "creates a new user" do
      response = post('/signup', name: 'Elon Musk', email: 'el_musk@email.com', username: 'im_the_other_elon', password: 'Fakepas5word')
      expect(response.status).to eq(302)
      # last_response is automatically created by Rack::MockResponse
      # this checks if signup is indeed redirecting to the root '/'
      expect(last_response).to be_redirect
    end
  end

  context 'GET /login' do
    it "renders the login page" do
      response = get('/login')
      expect(response.status).to eq(200)
      expect(response.body).to include('<h2>Log in to post a Peep</h2>')
    end

  end

  context 'POST /login' do
    it "should return to login page when email does not belong to an existing user" do
      response = post('/login', email: 'doesnt_exist@email.com', password: 'doesn0tExist')
      
      expect(response.body).to include('<h2>Log in to post a Peep</h2>')
      expect(response.body).to include('email address does not exist')
    end

    it "should return to login page when password does not match existing email" do
      response = post('/login', email: 'john_d@email.com', password: 'doesn0tExist')
      
      expect(response.body).to include('<h2>Log in to post a Peep</h2>')
      expect(response.body).to include('password does not match')
    end

    it "logs in user when email and password are from the same existing user" do
      response = post('/login', email: 'john_d@email.com', password: 'Pas5w0rd!')

      response = get('/')
      expect(response.body).to include('<h1>Chitter</h1>')
      expect(response.body).to include('<h3>Hi <span>j0ndoe</span>,</h3>')
      expect(response.body).to include('<label>Post a Peep here:</label>')
    end

  end

  context 'POST /post' do
    it "escapes any HTML tags in the input, and returns the sanitized input" do
      response = post('/login', email: 'john_d@email.com', password: 'Pas5w0rd!')
      Timecop.freeze(Time.utc(2023, 4, 10, 22, 25, 0)) do
    
        response = post('/post', message: '<script>document.location.href="https://www.youtube.com/watch?v=34Ig3X59_qA";</script>', username: 'j0ndoe')
        response = get('/')
  
        expect(response.body).to include('2023-04-10 22:25:00')
        expect(response.body).to include('j0ndoe')
        expect(response.body).to include('&lt;script&gt;document.location.href=&quot;https://www.youtube.com/watch?v=34Ig3X59_qA&quot;;&lt;/script&gt;')
      end
    end

    it "creates a peep with information about the time it was posted and username of who posted it" do
      response = post('/login', email: 'john_d@email.com', password: 'Pas5w0rd!')
      Timecop.freeze(Time.utc(2023, 4, 10, 22, 25, 0)) do
    
        response = post('/post', message: 'peep sounds funny', username: 'j0ndoe')
        response = get('/')
  
        expect(response.body).to include('2023-04-10 22:25:00')
        expect(response.body).to include('j0ndoe')
        expect(response.body).to include('peep sounds funny')
      end
    end

  end

  context 'GET /logout' do
    it "renders the logout page" do
      response = get('/logout')
      expect(response.body).to include('<h3>Press confirm to log out?</h3>')
      expect(response.body).to include('<button type="submit">confirm</button>') 
    end
  end

  context 'POST /logout' do
    it "log off current user that is logged in" do
      response = post('/logout')
      expect(response.status).to eq(302)

      response = get('/')
      expect(response.body).to include('<h1>Welcome to Chitter!</h1>') 
    end
  end
  
end

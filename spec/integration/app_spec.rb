require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  before(:each) do
    session = {}
  end


  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context 'GET /' do
    it 'shows a list of posts' do
      response = get('/')

      expect(response.status).to eq 200
      expect(response.body).to include '<a href="/sign-up">SIGN UP</a>'
      expect(response.body).to include '<a href="/login">LOG IN</a>'
      expect(response.body).to include 'First content'
      expect(response.body).to include 'Second content'
      expect(response.body).to include 'Thrid content'
    end

  end

  context 'POST /new-post' do
    it 'returns error message if post without login' do
      response = post('/new-post',content:'I am happy!')

      expect(response.status).to eq 200
      expect(response.body).to eq 'Please login first'
    end
  end

  context 'GET /sign-up' do
    it 'shows a form for user to sign up' do
      response = get('/sign-up')

      expect(response.status).to eq 200
      expect(response.body).to include "<form class='sign-up' method='POST' action='/new-user'>"
    end
  end

  context 'POST /new-user' do
    it 'creates a new user in the database' do
      response = post('new-user',email:'james@gmail.com',password:'password',username:'james',name:'James') 

      expect(response.status).to eq 302
      follow_redirect!
      expect(last_response.body).to include 'James'
    end

    it 'shows error message for invalid username' do
      response = post('new-user', email:'luke@gmail.com',password:'123456',username:'luke luke',name:'Luke123')

      expect(response.status).to eq 200
      expect(response.body).to include '<p>No special characters or space allowed in username.</p>'
    end

    it 'shows error message for invalid password length' do
      response = post('new-user', email:'luke@gmail.com',password:'123',username:'luke',name:'Luke123')

      expect(response.status).to eq 200
      expect(response.body).to include '<p>Password must be at least 6 characters.</p>'
    end

    it 'shows error message for exist username' do
      response = post('new-user', email:'luke@gmail.com',password:'123456',username:'luke',name:'Luke123')

      expect(response.status).to eq 200
      expect(response.body).to include '<p>Username exists!</p>'
    end

    it 'shows error message for exist email' do
      response = post('new-user', email:'abc@gmail.com',password:'123456',username:'yoyo',name:'Yoyo')

      expect(response.status).to eq 200
      expect(response.body).to include '<p>Email exists!</p>'
    end
  end

  context 'GET /login' do
    it 'displays a login form' do
      response = get('login')

      expect(response.status).to eq 200
      expect(response.body).to include "<form class='form' method='POST' action='/user-login'>"
    end
  end

  context 'POST /user-login' do
    it 'returns Successfully login with the right email and password' do
      response = post('user-login', email:'abc@gmail.com',password:'123')
      expect(response.status).to eq 302
      expect(response.body).to eq ''
    end

    it 'returns Invalid credential with the wrong email' do
      response = post('user-login', email:'123@gmail.com',password:'123')
      expect(response.status).to eq 200
      expect(response.body).to include 'Invalid credential'
    end

    it 'returns Invalid credential with the wrong password' do
      response = post('user-login', email:'abc@gmail.com',password:'abc')
      expect(response.status).to eq 200
      expect(response.body).to include 'Invalid credential'
    end

    it 'displays a form for logged-in users' do
      response = post('user-login', email:'abc@gmail.com',password:'123')
      expect(last_response.status).to eq 302
      follow_redirect!

      # Verify that the form is displayed for the logged-in user
      expect(last_response.body).to include "<form method='POST' action='/new-post'>"
      expect(last_response.body).to include '<textarea name="content" rows="4" cols="50" placeholder="Luke, What\'s happening?"></textarea>'        
      expect(last_response.body).to include '<input type="submit">'
    end

    it 'posts a new post after user logins' do
      post('user-login', email:'abc@gmail.com',password:'123')
      post('new-post',content:'I am happy!')
      expect(last_response.status).to eq 302
      follow_redirect!
      expect(last_response.body).to include 'I am happy!'
    end

   it 'expires user session after 1 hour' do
      response = post('user-login', email:'abc@gmail.com',password:'123')
      expect(last_response.status).to eq 302
      follow_redirect!

      # Verify that the form is displayed for the logged-in user
      expect(last_response.body).to include '<textarea name="content" rows="4" cols="50" placeholder="Luke, What\'s happening?"></textarea>'        
      # Stub the Time module to simulate 1 hour of elapsed time
      allow(Time).to receive(:now).and_return(Time.now + 3600)
      response = get('/')
      expect(response.status).to eq 200
      expect(response.body).not_to include "<form method='POST' action='/new-post'>"
    end
  end

  context 'POST /logout' do
    it 'logouts user session' do
      response = post('user-login', email:'abc@gmail.com',password:'123')
      follow_redirect!
      response = post('logout')
      expect(response.status).to eq 302
      follow_redirect!
      expect(last_response.body).not_to include '<textarea name="content" rows="4" cols="50" placeholder="Luke, What\'s happening?"></textarea>'
      expect(last_response.body).to include '<a href="/sign-up">SIGN UP</a>'
      expect(last_response.body).not_to include '<form method="POST" action="/logout">'
    end
  end
end

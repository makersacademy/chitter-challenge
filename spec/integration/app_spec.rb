require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

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

    it 'shows a form with textarea and submit button' do
      response = get('/')
      expect(response.status).to eq 200
      expect(response.body).to include "<form method='POST' action='/new-post'>"
      expect(response.body).to include '<textarea name="content" rows="4" cols="50" placeholder="What\'s happening?"></textarea>'        
      expect(response.body).to include '<input type="submit">'
    end
  end

  context 'POST /new-post' do
    it 'creates a new post to the database' do
      response = post('/new-post',content:'I am happy!')

      expect(response.status).to eq 302
      expect(response.body).to eq ''
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

    expect(response.status).to eq 200
    expect(response.body).to eq 'Successfully created!'
    end

    it 'shows error message for exist username' do
      response = post('new-user', email:'luke@gmail.com',password:'123',username:'luke',name:'Luke123')
      
    expect(response.status).to eq 200
    expect(response.body).to include '<p>Username exists!</p>'
    end

    it 'shows error message for exist email' do
      response = post('new-user', email:'abc@gmail.com',password:'123',username:'yoyo',name:'Yoyo')
      
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

end

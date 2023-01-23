require 'spec_helper'
require 'rack/test'
require_relative '../../app'


def reset_tables
  seed_sql = File.read('spec/integration/chitter_seed.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
  connection.exec(seed_sql)
end

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  before(:each) do
    reset_tables
  end

  after(:each) do
    reset_tables
  end

  context 'GET to /' do
    it 'redirects to the feed' do
      response = get('/')
      expect(last_response.location).to include '/feed'
    end
  end

  context 'GET to /feed' do
    it 'returns a list of peeps as HTML' do
      response = get('/feed')
      expect(response.status).to eq 200

      expect(response.body).to include 'First peep on chitter!'
      expect(response.body).to include 'How do I use this thing?'
      expect(response.body).to include 'Here we go!'
    end

    it 'shows a text box for posting a tweet only when logged in' do
      response = get('/feed')
      expect(response.status).to eq 200

      expect(response.body).not_to include '<form action="/feed" method="POST">'
      expect(response.body).not_to include '<label for="content">Send a peep:</label>'
      expect(response.body).not_to include '<input type="text" id="content" name="content"><br>'

      post "/signin", { :username => "brugalheimer", :password => "password" }
      response = get('/feed')
      expect(response.status).to eq 200

      expect(response.body).to include '<form action="/feed" method="POST" class="peep__form">'
      expect(response.body).to include '<label for="content" class="peeps__label">Tell the world something:</label>'
    end
  end

  context 'POST to /feed' do
    it 'adds a peep to the database which appears at top of the feed' do
      post "/signin", { :username => "brugalheimer", :password => "password" }
      response = post('/feed', content: "First time posting!", timestamp: '2023-01-11 13:40:00', 
user_id: 3)
      expect(response.status).to eq 200
      repo = PeepRepository.new
      peeps = repo.all
      expect(peeps.first.content).to eq 'First time posting!'
    end
  end

  context 'GET to /signup' do
    it 'shows a signup form' do
      response = get('/signup')
      expect(response.status).to eq 200
      expect(response.body).to include 'Username:'
      expect(response.body).to include 'Email:'
      expect(response.body).to include 'Password:'
    end
  end

  context 'POST to /signup' do
    it 'creates a new user' do
      response = post('/signup', username: 'peymanhewitt', email: 'peyman@gmail.com', 
password: 'password6')
      repo = UserRepository.new
      expect(repo.all.last.username).to eq 'peymanhewitt'
      expect(repo.all.last.email).to eq 'peyman@gmail.com'
    end

    it 'shows a success page with valid credentials' do
      response = post('/signup', username: 'tarajade', email: 'tara@gmail.com', 
        password: 'password7')
      expect(response.body).to include 'Successful signup!'
      expect(response.body).to include 'Back to feed'
    end

    it 'will redirect to signup page and not show a PG error' do
      response = post "/signup", 
{ :username => "brugalheimer", :email => 'josephburgess@gmail.com', :password => "password" }
      expect(response.body).not_to include 'PG::UniqueViolation'
    end
  end

  context 'GET to /signin' do
    it 'shows a sign-in form' do
      response = get('/signin')
      expect(response.status).to eq 200
      expect(response.body).to include 'Username:'
      expect(response.body).to include 'Password:'
    end
  end

  context 'POST to /signin' do
    it 'logs in with valid credentials' do
      response = post('/signin', username: 'brugalheimer', password: 'password')
      expect(last_response.location).to include '/feed'
    end

    it 'will not signin with invalid credentials' do
      response = post('/signin', username: 'brugalheimer', password: 'wrongpassword')
      expect(response.body).to include 'Sign in to Chitter'
    end

    it 'will avoid index error when using invalid credentials not found in database' do
      response = post('/signin', username: 'brugalheimer', password: 'wrongpassword')
      expect(response.body).not_to include 'IndexError'
    end
  end

  context 'GET to /users/:username' do
    it 'shows a user profile page' do
      response = get('/users/brugalheimer')
      expect(response.status).to eq 200
      expect(response.body).to include 'All peeps by @brugalheimer'
    end
  end

  context 'GET to /logout' do
    it 'removes session variables' do
      post "/signin", { :username => "brugalheimer", :password => "password" }
      response = get('/logout')
      expect(session[:user_id]).to eq nil
      expect(session[:username]).to eq nil
    end
  end

  it 'extracts tagged users from peep content' do
    content = 'Hey @brugalheimer welcome to chitter'
    expect(extract_tagged_users(content)).to eq ['brugalheimer']
  end

  it 'identifies current user from session' do
    post "/signin", { :username => "brugalheimer", :password => "password" }
    expect(current_user.username).to eq 'brugalheimer'
  end
end
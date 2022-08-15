require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  include Rack::Test::Methods
  let(:app) { Application.new }

  before(:each) do 
    seed_sql = File.read('spec/seeds/seeds_mixed_tables.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
    connection.exec(seed_sql)
    ActiveRecord::Base.establish_connection(
      adapter:  'postgresql',
      database: 'chitter_test'
    )
  end

  # methods

  context 'escape_html_all_params' do
    it 'santises all params inputs' do
      params = { "username" => "JI2<><>022", "password" => "passw<><>ord123" }
      result = { "password" => "passw&lt;&gt;&lt;&gt;ord123", "username" => "JI2&lt;&gt;&lt;&gt;022" }
      expect(Application.escape_html_all_params(params)).to eq result
    end
  end

  # GET /

  context 'GET / with @user_id = nil and no params' do
    it 'returns 200' do
      response = get('/')
      expect(response.status).to eq 200
      expect(response.body).to include 'Login'
      expect(response.body).to include 'Sign up for Chitter!'    
      # Peeps
      expect(response.body).to include 'Marky Mark'
      expect(response.body).to include '@FunkyB'
      expect(response.body).to include 'Where are my tacos'
      expect(response.body).to include '08:15 PM Friday 12 August 2022'
      expect(response.body).to include 'John Isaac'
      expect(response.body).to include '@JI2022'
      expect(response.body).to include 'Have you guys seen the new Marvel movie?'
      expect(response.body).to include '04:47 PM Friday 12 August 2022'
    end
  end

  context 'GET / when @user_id = user_id' do
    it 'returns 200 with log off and post options' do
      post('/login', username: 'JI2022', password: 'password123')
      response = get('/')
      expect(response.status).to eq 200
      expect(response.body).to include '@JI2022'
      expect(response.body).to include 'Log off'
      expect(response.body).to include 'Post a new Peep'
    end
  end

  # GET /login

  context 'GET /login with @user_id = nil and no params' do
    it 'returns 200' do
      response = get('/login')
      expect(response.status).to eq 200
      expect(response.body).to include 'Log on to Chitter'
      expect(response.body).to include 'Username:'
      expect(response.body).to include 'Password:'
      expect(response.body).to include 'Sign up to Chitter'
      expect(response.body).to include 'Back'
    end
  end

  context 'GET /login with @user_id = nil and password_error=true' do
    it 'returns 200 and password error' do
      response = get('/login', password_error: true)
      expect(response.status).to eq 200
      expect(response.body).to include 'Username:'
      expect(response.body).to include 'Password:'
      expect(response.body).to include 'Incorrect password'
    end
  end
 
  context 'GET /login with @user_id = nil and username_error=true' do
    it 'returns 200 and password error' do
      response = get('/login', username_error: true)
      expect(response.status).to eq 200
      expect(response.body).to include 'Username:'
      expect(response.body).to include 'Username does not exist'
      expect(response.body).to include 'Password:'
    end
  end

  context 'GET /login with @user_id = nil and sign_up=true' do
    it 'returns 200 with sign-up message' do
      response = get('/login', sign_up: true)
      expect(response.status).to eq 200
      expect(response.body).to include 'Sign in with your new account'
    end
  end

  context 'GET /login with @user_id = user_id' do
    it 'returns 302 and redirects to /' do
      post('/login', username: 'JI2022', password: 'password123')
      response = get('/login')
      expect(response.status).to eq 302
      expect(last_response).to be_redirect
      follow_redirect!
      expect(last_request.url).to include '/'
    end
  end

  # POST /login

  context 'POST /login with @user_id = nil and username & password in db' do
    it 'returns 302 and redirects to /' do
      response = post('/login', username: 'JI2022', password: 'password123')
      expect(response.status).to eq 302
      expect(last_response).to be_redirect
      follow_redirect!
      expect(last_request.url).to include '/'
    end
  end

  context "POST /login with @user_id = nil and username in db but password doesn't match" do
    it 'returns 302 and redirects back to /login' do
      response = post('/login', username: 'JI2022', password: 'password456')
      expect(response.status).to eq 302
      expect(last_response).to be_redirect
      follow_redirect!
      expect(last_request.url).to include '/login?password_error=true'
    end
  end

  context "POST /login with @user_id = nil but username not in db" do
    it 'returns 302 and redirects to /login&username_error=true' do
      response = post('/login', username: 'username', password: 'password123')
      expect(response.status).to eq 302
      expect(last_response).to be_redirect
      follow_redirect!
      expect(last_request.url).to include '/login?username_error=true'
    end
  end

  context 'POST /login with @user_id = nil and username but no password' do
    it 'returns 400' do
      response = post('/login', username: 'username')
      expect(response.status).to eq 400
    end
  end

  context 'POST /login with @user_id = nil and password but no username' do
    it 'returns 400' do
      response = post('/login', password: 'password')
      expect(response.status).to eq 400
    end
  end

  context 'POST /login with @user_id = user_id and any params' do
    it 'returns 400' do
      post('/login', username: 'JI2022', password: 'password123')
      response = post('/login', username: 'JI2022', password: 'password123')
      expect(response.status).to eq 400
    end
  end

  # GET /log_off

  context 'GET /log-off with @user_id = user_id' do
    it 'returns 200 and logs the user off' do
      post('/login', username: 'JI2022', password: 'password123')
      response = get('/log-off')
      expect(response.status).to eq 200
      expect(response.body).to include 'You have successfully logged off'
      expect(response.body).to include 'Back'
    end
  end

  # GET /sign-up/new

  context 'GET /sign-up/new with @user_id = nil' do
    it 'returns 200' do
      response = get('/sign-up/new')
      expect(response.status).to eq 200
      expect(response.body).to include 'Sign up to Chitter'
      expect(response.body).to include 'Name:'
      expect(response.body).to include 'Email:'
      expect(response.body).to include 'Username:'
      expect(response.body).to include 'Password:'
      expect(response.body).to include 'Back'
    end
  end

  context 'GET /sign-up/new with @user_id = nil and username_error and email_error' do
    it 'returns 200' do
      response = get('/sign-up/new', username_error: true, email_error: true)
      expect(response.status).to eq 200
      expect(response.body).to include 'Sign up to Chitter'
      expect(response.body).to include 'Name:'
      expect(response.body).to include 'Email:'
      expect(response.body).to include 'This email is already taken.'
      expect(response.body).to include 'Username:'
      expect(response.body).to include 'This username is already taken.'
      expect(response.body).to include 'Password:'
      expect(response.body).to include 'Back'
    end
  end

  context 'GET /sign-up/new with @user_id = user_id' do
    it 'returns 302 and redirects to /' do
      post('/login', username: 'JI2022', password: 'password123')
      response = get('/sign-up/new')
      expect(response.status).to eq 302
      expect(last_response).to be_redirect
      follow_redirect!
      expect(last_request.url).to include '/'
    end
  end

  # POST /sign-up/new

  context 'POST /sign-up/new with @user_id = nil and all params valid' do
    it 'returns 302, creates a new user and redirects to /login' do
      response = post('/sign-up/new',
        name: 'name',
        email: 'email@email.com',
        username: 'username',
        password: 'password'
      )
      expect(response.status).to eq 302
      expect(last_response).to be_redirect
      follow_redirect!
      expect(last_request.url).to include '/login?sign_up=true'
      expect(User.all.length).to eq 5
      expect(User.last.name).to eq 'name'
      expect(User.last.email).to eq 'email@email.com'
      expect(User.last.username).to eq 'username'
      expect(User.last.password).to eq 'password'
    end
  end

  context 'POST /sign-up/new with @user_id = nil and with email and username already taken' do
    it 'returns 302 and redirects to /sign-up/new with errors' do
      response = post('/sign-up/new',
        name: 'name',
        email: 'john@hotmail.com',
        username: 'JI2022',
        password: 'password'
      )
      expect(response.status).to eq 302
      expect(last_response).to be_redirect
      follow_redirect!
      expect(last_request.url).to include '/sign-up/new?email_error=true&username_error=true'
    end
  end

  context 'POST /sign-up/new with @user_id = user_id' do
    it 'returns 400' do
      post('/login', username: 'JI2022', password: 'password123')
      response = post('/sign-up/new',
        name: 'name',
        email: 'john@hotmail.com',
        username: 'JI2022',
        password: 'password'
      )
      expect(response.status).to eq 400
    end
  end

  context 'POST /sign-up/new with @user_id = nil and missing params' do
    it 'returns 400' do
      response = post('/sign-up/new')
      expect(response.status).to eq 400
    end
  end

  # GET /peep/new

  context 'GET /peep/new with @user_id = nil' do
    it 'returns 302 and redirects to login' do
      response = get('/peep/new')
      expect(response.status).to eq 302
      expect(last_response).to be_redirect
      follow_redirect!
      expect(last_request.url).to include '/login'
    end
  end

  context 'GET /peep/new with @user_id = user_id' do
    it 'returns 200 and loads Peep form' do
      post('/login', username: 'JI2022', password: 'password123')
      response = get('/peep/new')
      expect(response.status).to eq 200
      expect(response.body).to include 'Create a new Peep'
      expect(response.body).to include 'What do you want to say?'
      expect(response.body).to include 'Post peep!'
      expect(response.body).to include 'Back'
    end
  end

  # POST /peep/new

  context 'POST /peep/new with @user_id = nil and any params' do
    it 'returns 400' do
      response = post('/peep/new')
      expect(response.status).to eq 400
    end
  end

  context 'POST /peep/new with @user_id and no content' do
    it 'returns 400' do
      post('/login', username: 'JI2022', password: 'password123')
      response = post('/peep/new')
      expect(response.status).to eq 400
    end
  end

  context 'POST /peep/new with @user_id and content' do
    it 'returns 200, creates a new post and redirects to /' do
      post('/time-admin', password: 'admin', time: '2022,8,14,12,0,0')
      post('/login', username: 'JI2022', password: 'password123')
      response = post('/peep/new', content: "content @JI2022")
      expect(response.status).to eq 302
      peep = Peep.last
      expect(peep.content).to eq 'content @JI2022'
      expect(peep.date_time_created).to eq '2022-08-14 11:00:00'
      expect(peep.user_id).to eq 1
      expect(last_response).to be_redirect
      follow_redirect!
      expect(last_request.url).to include '/'
    end
  end

  # POST /time-admin
  # this sets the time for testing

  context 'POST /time-admin to set time for tests with no password' do
    it 'returns 400' do
      response = post('/time-admin', time: '2022,8,14,12,0,0')
      expect(response.status).to eq 400
    end
  end

  context 'POST /time-admin to set time for tests with the correct password' do
    it 'returns 200' do
      response = post('/time-admin', password: 'admin', time: '2022,8,14,12,0,0')
      expect(response.status).to eq 200
      expect(response.body).to eq "Time set to 2022-08-14 12:00:00 +0100"
    end
  end

  context 'POST /time-admin resets @time_admin' do
    it 'returns 200' do
      response = post('/time-admin', password: 'admin', time: 'reset')
      expect(response.status).to eq 200
    end
  end
end

require "spec_helper"
require "rack/test"
require_relative '../../app'

def reset_table
  seed_sql = File.read('spec/seeds/chitter_test_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end
    
def session_tracker
  last_request.env['rack.session']
end
    
describe Application do
  before(:each) do 
    reset_table
  end

    
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods
    
  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context 'GET /' do
    it 'should get homepage when not logged in' do
      response = get('/')
      
      expect(response.status).to eq 200
      expect(response.body).to include '<h1>Peeps</h1>'
      expect(response.body).to include '<a href="/login">Login</a>'
    end

    it 'logged in' do
      response = post('/login',
                params = { email: 'chris@test.com', password: 'zxcvb_123' })
      expect(response.status).to eq 302
    end
  end
  
  context 'GET /login' do
    it 'should get the login page' do
      response = get('/login')

      expect(response.status).to eq 200
      expect(response.body).to include '<a href="/signup">Signup</a>'
      expect(response.body).to include '<input type="submit" value="Login">'
    end

    it 'should not return login if logged in' do
      post('/login', 
        params = { email: 'chris@test.com', password: 'zxcvb_123' })

      response = get('/login')
      expect(response.status).to eq(302)
    end
  end

  context 'POST /login' do
    it 'should login' do
      response = post('/login',
                params = { email: 'chris@test.com', password: 'zxcvb_123' })
      expect(response.status).to eq 302

      response = get('/')
      
      expect(response.status).to eq 200
      expect(response.body).to include '<a href="/peeps/new">New peep</a>'
      expect(session_tracker[:user_id]).to eq 1
    end

    it 'should send to login on wrong password' do
      response = post('/login', 
                params = { email: 'chris@test.com', password: 'xxxxxx' })
      expect(response.status).to eq 302

      response = get('/')
      expect(response.status).to eq 200
      expect(response.body).to include('<a href="/signup">Signup</a>')
      expect(session_tracker[:user_id]).to eq nil
    end
  end

  context 'GET /signup' do
    it 'should get the signup page' do
      response = get('/signup')

      expect(response.status).to eq 200
      expect(response.body).to include '<a href="/login">Login</a>'
      expect(response.body).to include '<input type="submit" value="Sign up">'
    end

    it 'should not appear if logged in' do
      post('/login', 
        params = { email: 'chris@test.com', password: 'zxcvb_123' })

      response = get('/signup') 
      expect(response.status).to eq 302
    end
  end

  context 'POST /signup' do
    it 'should create a new user' do
      response = post('/signup', 
                params = { email: 'test@test.com', 
                          username: 'test',
                          password: 'test123',
                          name: 'Test' })
      repo = UserRepository.new

      expect { repo.find(5) }.to raise_error 'Index 0 is out of range'
      expect(response.status).to eq 302

      response = get('/')
      expect(response.body).to include('<a href="/peeps/new">New peep</a> | <a href="/logout">Logout</a>')
    end

    it 'should be unavailable if logged in' do
      response = post('/signup', 
                params = { email: 'test@test.com',
                          username: 'test',
                          password: 'test123',
                          name: 'Test' })
      repo = UserRepository.new
      users = repo.find(4)

      expect(response.status).to eq 302
    end
  end

  context 'GET /logout' do
    it 'should log out the user' do
      response = post('/login', 
                params = { email: 'amelia@test.com', 
                          password: 'qwerty#789' })
      expect(response.status).to eq 302
      expect(session_tracker[:user_id]).to eq 3
      response = get('/logout')
      expect(response.status).to eq 302
      expect(session_tracker[:user_id]).to eq nil
    end
  end

  context 'GET /peeps/new' do
    it 'should get the new peeps page' do
      post('/login', 
          params = {email: 'amelia@test.com', 
                    password: 'qwerty#789'})
      response = get ('/peeps/new')

      expect(response.status).to eq 200
      expect(response.body).to include('<form method="POST" action="/peeps/new">')
    end
  end

  context 'POST /peeps/new' do
    it 'should create a new post' do
      post('/login', 
        params = {email: 'amelia@test.com', password: 'qwerty#789'})
      response = post('/peeps/new',
                      params = {
                        content: 'Hi there',
                        post_time: '2022-11-15 10:50:55'
                      })
      expect(response.status).to eq 302
     
      response = get('/')
      expect(response.body).to include ('Hi there')
    end
  end

  context 'GET /peep/:id' do
    it 'should get the peep page' do
      response = get ('/peep/1')

      expect(response.status).to eq 200
      expect(response.body).to include('<h1>Peep</h1>')
    end
  end
end

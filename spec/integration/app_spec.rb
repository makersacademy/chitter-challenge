require "spec_helper"
require "rack/test"
require_relative '../../app'

def reset_peeps_table
  seed_sql = File.read('spec/seeds_peeps.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

def reset_users_table
  seed_sql = File.read('spec/seeds_user.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe Application do
  before(:each) do 
    reset_users_table
    reset_peeps_table
  end

  include Rack::Test::Methods

  let(:app) { Application.new }

  context "GET /" do
    it "returns 200 ok" do
      response = get('/')
      expect(response.status).to eq 200
    end

    it "returns Home page" do
      response = get('/')
      expect(response.body).to include("<h1>Chitter</h1>")
      expect(response.body).to include('<a href="/login">Login </a>')
      expect(response.body).to include('<br> <a href="/all_peeps">View all peeps </a>')
      expect(response.body).to include('<a href="/new_account">Create an account </a>')
    end
  end

  context "GET /new_account" do
    it "returns the form page" do
      response = get('new_account')
      expect(response.status).to eq 200
      expect(response.body).to include('<form action="/new_account" method="POST">')
      expect(response.body).to include('<h1>Create an account</h1>')
    end
  end

  context "POST /new_account" do
    it "redirects to login page" do
      response = post('/new_account', 
        name: 'Don Caster', 
        username: 'Donny1', 
        password: 'test_pwd', 
        password_confirm: 'test_pwd',
        email: 'DonnyC@example.com')
      expect(response.status).to eq 302
    end

    it "returns failure page if password and password_confirm do not match" do
      response = post('/new_account', 
        name: 'Don Caster', 
        username: 'Donny1', 
        password: 'test_pwd', 
        password_confirm: 'test_pws',
        email: 'DonnyC@example.com')
      expect(response.status).to eq 200
      expect(response.body).to include('<h1>Passwords do not match</h1>')
      expect(response.body).to include('<a href="/new_account">Try again </a>')
    end
  end

  context "GET /login" do
    it "returns the form page" do
      response = get('/login')
      expect(response.status).to eq 200
      expect(response.body).to include('<h1>Login</h1>')   
      expect(response.body).to include('<form action="/login" method="POST">')   
    end
  end

  context "POST /login" do
    it "returns a success page" do
      repo = UserRepository.new
      user = User.new
      user.id = 4
      user.name = 'Janie Marie'
      user.username = 'JMarie1'
      user.password = 'foo'
      user.email = 'Jmarie2002@example.com'
      repo.add_user(user)
      response = post(
        '/login',
        email: 'Jmarie2002@example.com',
        password: 'foo')
      expect(response.status).to eq 200
      expect(response.body).to include('<h1>Login successfull</h1>')
      expect(response.body).to include('<a href="/account_page">Continue to Account</a>')
    end

    it "returns failure page if password is incorrect" do
      repo = UserRepository.new
      user = User.new
      user.id = 4
      user.name = 'Janie Marie'
      user.username = 'JMarie1'
      user.password = 'foo'
      user.email = 'Jmarie2002@example.com'
      repo.add_user(user)
      response = post(
        '/login',
        email: 'Jmarie2002@example.com',
        password: 'bar')
      expect(response.status).to eq 200
      expect(response.body).to include('<h1>Username or password is incorrect</h1>')
      expect(response.body).to include('<a href="/login">Try again </a>')
    end
  end

  context "POST /post" do
    it 'returns 200 OK' do
      # Assuming the post with id 1 exists.
      response = post('/post', { content: 'A good day :)' }, { 'rack.session' => { user_id: 1 } })
      expect(response.status).to eq(200)
    end

    it 'database includes new post' do
      response = post('/post', { content: 'A good day :)' }, { 'rack.session' => { user_id: 1 } })
      get_response = get('/post/6')
      expect(get_response.status).to eq(200)
      expect(get_response.body).to include "<h1>Just finished a great workout</h1>"
      expect(get_response.body).to include "Time posted: 2022-09-06 07:30:00"
      expect(get_response.body).to include "User: bobj"
    end

    it 'returns success message' do
      response = post('/post', { content: 'A good day :)' }, { 'rack.session' => { user_id: 1 } })
      expect(response.status).to eq(200)
      expect(response.body).to include("<h1>Peep posted :)</h1>")
      expect(response.body).to include('<a href="/">Return to home page </a>')
    end

    it "Responds with 400 if input is empty string" do
      response = post('/post', { content: '' }, { 'rack.session' => { user_id: 1 } })
      expect(response.status).to eq(400)
    end

    it "Responds with 400 if input is nil" do
      response = post('/post', { content: nil }, { 'rack.session' => { user_id: 1 } })
      expect(response.status).to eq(400)
    end
  end

  context "GET /post/:id" do
    it "returns 200 Ok" do
      response = get('/post/1')
      expect(response.status).to eq 200
    end

    it "outputs post values" do
      response1 = get('/post/1')
      expect(response1.body).to include('Just had the best burger ever!')
      expect(response1.body).to include('2022-09-01 12:30:00')
      
      response2 = get('/post/2')
      expect(response2.body).to include("Can't wait for the weekend!")
      expect(response2.body).to include('2022-09-02 16:45:00')
    end
  end
end
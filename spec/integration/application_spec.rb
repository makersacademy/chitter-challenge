require "spec_helper"
require "rack/test"
require_relative '../../app'

def reset_makers_table
  seed_sql = File.read('spec/seeds_makers.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
  connection.exec(seed_sql)
end

def reset_peeps_table
  seed_sql = File.read('spec/seeds_makers.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_database_test' })
  connection.exec(seed_sql)
end

describe Application do
  before(:each) do
    reset_peeps_table
  end

  before(:each) do
    reset_makers_table
  end
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context 'GET /makers/:id' do
    it 'should return user1 information' do
      response = get('/makers/1')

      expect(response.status).to eq(200)
      expect(response.body).to include(' <h1> Welcome name1!</h1>')
      expect(response.body).to include('username: user1')
      expect(response.body).to include('email: name1@email.com')
    end
  end

  context 'GET to /makers' do
    # List all the albums
      it 'list all the makers' do
        response = get('/makers')

        expect(response.status).to eq(200)
        expect(response.body).to match('<a href="/makers/1">user1.*</a><br />')
        expect(response.body).to match('<a href="/makers/2">user2.*</a><br />')
      end

  end
  context 'GET /signup' do
    it 'should return a form to singup ' do
    response = get('/signup')

    expect(response.status).to eq(200)
    expect(response.body).to include('<form action="/signup" method="POST">')
    expect(response.body).to include(' <input type="text" name="name" placeholder="name" />')
    expect(response.body).to include('<input type="text" name="username" placeholder="username" />')
    expect(response.body).to include('<input type="text" name="email" pattern="[a-z0-9._%+-]+@[a-z0-9]+\.[a-z]{2,}$" placeholder="valid email" />')
    expect(response.body).to include('<input type="password" name="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z).{8,}" placeholder="password" />')
    end
  end
  context 'POST to /signup' do
    let(:name) { 'name4' }
    let(:username) { 'user4' }
    let(:email) { 'name4@gmail.com' }
    let(:password) { 'password1234*' }
    it 'return 400 for empty name input' do
      response = post('/signup', name: nil, username: username, email: email, password: password)

      expect(response.status).to eq(400)
    end

    it 'return 400 for empty username input' do
      response = post('/signup', name: name, username: nil, email: email, password: password)

      expect(response.status).to eq(400)
    end

    it 'return 400 for empty email input' do
      response = post('/signup', name: name, username: username, email: nil, password: password)

      expect(response.status).to eq(400)
    end

    it 'return 400 for empty password input' do
      response = post('/signup', name: name, username: username, email: email, password: nil)

      expect(response.status).to eq(400)
    end

    it 'checks existing username when signing up' do
      response = post('/signup', name: name, username: username, email: email, password: password)

      expect(response.status).to eq(302)
      expect(response.header['Location']).to match(".*/login")

      response = get('/makers/3')

      expect(response.status).to eq(200)


      response = post('/signup', name: 'name5', username: username, email: 'name5@gmail.com', password: 'password3')

      expect(response.status).to eq(302)
      expect(response.header['Location']).to match(".*/signup")

    end

    it 'checks existing name when signing up' do
      response = post('/signup', name: name, username: username, email: email, password: password)

      expect(response.status).to eq(302)
      expect(response.header['Location']).to match(".*/login")

      response = get('/makers/3')

      expect(response.status).to eq(200)

      response = post('/signup', name: name, username: 'user5', email: email, password: 'password3')

      expect(response.status).to eq(302)
      expect(response.header['Location']).to match(".*/signup")

    end

    it 'checks existing email when signing up' do
      response = post('/signup', name: name, username: username, email: email, password: password)

      expect(response.status).to eq(302)
      expect(response.header['Location']).to match(".*/login")

      response = get('/makers/3')

      expect(response.status).to eq(200)

      response = post('/signup', name: 'name5', username: 'user5', email: email, password: 'password3')

      expect(response.status).to eq(302)
      expect(response.header['Location']).to match(".*/signup")

    end

    it 'creates a new maker' do
      response = post('/signup', name: 'name4', username: 'user4', email: 'name4@gmail.com', password: 'password3')

      expect(response.status).to eq(302)

      response = get('/makers/3')

      expect(response.status).to eq(200)
      expect(response.body).to include('user4')
    end
  end

  context 'GET to /login' do
    it 'returns the login page' do
      response = get('/login')

      expect(response.status).to eq 200
      expect(response.body).to include ('<form action="/login" method="post">')
      expect(response.body).to match ('<input type="text" name="email" placeholder="Email" />')
      expect(response.body).to match ('<input type="password" name="password" placeholder="Password" />')
    end
  end

  context 'POST to /login' do
    it 'returns the maker page after succesful login' do
      response = post('/signup', name: 'name4', username: 'user4', email: 'name4@gmail.com', password: 'password')

      expect(response.status).to eq (302)
      expect(response.header['Location']).to match (".*/login")

      response = get(response.header['Location'])
      expect(response.status).to eq(200)

      response = post('/login', email: 'name4@gmail.com', password: 'password')

      expect(response.status).to eq(302)
      expect(response.header['Location']).to match('.*/makers')

      response = get(response.header['Location'])
      expect(response.status).to eq(200)
      expect(response.body).to include('<h1> Welcome name4!</h1>')

    end

    it 'returns 401 for wrong email' do
      response = post('/signup', name: 'name4', username: 'user4', email: 'name4@gmail.com', password: 'password')

      expect(response.status).to eq (302)
      expect(response.header['Location']).to match (".*/login")

      response = get(response.header['Location'])
      expect(response.status).to eq(200)

      response = post('/login', email: 'name@gmail.com', password: 'password')

      expect(response.status).to eq(401)
    end

    it 'returns 401 for wrong password' do
      response = post('/signup', name: 'name4', username: 'user4', email: 'name4@gmail.com', password: 'password')

      expect(response.status).to eq (302)
      expect(response.header['Location']).to match (".*/login")

      response = get(response.header['Location'])
      expect(response.status).to eq(200)

      response = post('/login', email: 'name4@gmail.com', password: 'password8')

      expect(response.status).to eq(401)
    end

  end
  context 'GET to /peeps' do
      it 'list all the peeps in reverse chronological order' do
        response = get('/peeps')

        expect(response.status).to eq(200)
        expect(response.body).to match('<a href="/peeps/2">second peep.*</a><br />')
        expect(response.body).to match('<a href="/peeps/1">first peep.*</a><br />')
      end
  end

  context 'GET /peeps/new' do
    it 'should return a form to add a new peep' do
    response = get('/peeps/new')

    expect(response.status).to eq(200)
    expect(response.body).to include('<form method="post" action="/peeps">')
    expect(response.body).to include('<input type="text" name="peep" placeholder="write your peep here" />')
    end
  end
  context 'POST to /peeps' do
    let(:name) { 'name4' }
    let(:username) { 'user4' }
    let(:email) { 'name4@gmail.com' }
    let(:password) { 'password1234*' }
    let(:peep) { 'third peep' }
    it 'should validate peeps parameters' do
      response = post('/peeps', invalid_peep: 123)

      expect(response.status).to eq(400)
    end
    it 'creates a new peep in the database after signup and login' do
      signup = post('/signup', name: name, username: username, email: email, password: password)
      expect(signup.status).to eq(302)
      login = post('/login', email: 'name4@gmail.com', password: 'password1234*')
      expect(login.status).to eq(302)
      new_post = post('/peeps', peep: 'third peep')

      expect(new_post.status).to eq(302)

      response = get('/peeps')

      expect(response.status).to eq(200)
      expect(response.body).to include('third peep')
    end
  end

  context 'GET /peeps/:id' do
    it 'should return info about first peep' do
      response = get('/peeps/1')

      expect(response.status).to eq(200)
      expect(response.body).to include('<h1> Your peeps</h1>')
      expect(response.body).to include('peep: first peep')
      expect(response.body).to include('time: 2022-11-11 11:11:11')
    end
  end
end
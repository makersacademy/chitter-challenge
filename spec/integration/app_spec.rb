require 'rack/test'
require_relative '../../app'

def reset_tables
  seed_sql = File.read('db/seeds.sql')
  connection = PG.connect({ host: 'localhost', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  before(:each) do
    reset_tables
  end

  context 'GET /' do
    it 'returns the homepage' do
      response = get('/')

      expect(response.status).to eq(200)
      expect(response.body).to include('<h1><a href="/">Chitter</a></h1>')
      expect(response.body).to include('<span class="bold">Alice</span>')
      expect(response.body).to include('<span class="translucent">aliceinwonderland</span>')
      expect(response.body).to include('<p class="content">My first post</p>')
      expect(response.body).to include('<p class="translucent">10:10 · 31/1/23</p>')
      expect(response.body).to include('<p class="translucent">14:40 · 1/2/23</p>')
      expect(response.body).to include('<p class="translucent">14:45 · 1/2/23</p>')
      expect(response.body).to include('<p class="translucent">8:32 · 2/2/23</p>')
    end
  end

  context 'GET /login' do
    it 'returns the login view' do
      response = get('/login')

      expect(response.status).to eq(200)
      expect(response.body).to include('<input class="box" name="username" placeholder="Username" required/>')
      expect(response.body).to include('<input class="box" type="password" name="password" placeholder="Password" required/>')
    end
  end

  context 'GET /signup' do
    it 'returns the signup view' do
      response = get('/signup')

      expect(response.status).to eq(200)
      expect(response.body).to include('<input class="box" name="email" placeholder="Email" required/>')
      expect(response.body).to include('<input class="box" name="password" type="password" placeholder="Password" required/>')
      expect(response.body).to include('<input class="box" name="name" placeholder="Name" required/>')
      expect(response.body).to include('<input class="box" name="username" placeholder="Username" required/>')
    end
  end

  context 'POST /login' do
    context 'given valid username and password' do
      it 'redirects to homepage having logged in' do
        response = post(
          '/login',
          username: 'bobthebuilder',
          password: 'password2'
        )

        expect(response).to be_redirect
        follow_redirect!
        expect(last_response.body).to include('<label>Hello Bob</label>')
      end
    end

    context 'given invalid username and password' do
      it 'given an error message on login view' do
        response = post(
          '/login',
          username: 'bob',
          password: 'password'
        )

        expect(response.status).to eq(200)
        expect(response.body).to include('<p class="error">Username does not exist</p>')
      end
    end

    context 'given invalid username' do
      it 'given an error message on login view' do
        response = post(
          '/login',
          username: 'bob',
          password: 'password2'
        )

        expect(response.status).to eq(200)
        expect(response.body).to include('<p class="error">Username does not exist</p>')
      end
    end

    context 'given invalid password' do
      it 'given an error message on login view' do
        response = post(
          '/login',
          username: 'bobthebuilder',
          password: 'password'
        )

        expect(response.status).to eq(200)
        expect(response.body).to include('<p class="error">Password incorrect</p>')
      end
    end
  end

  context 'POST /post' do
    it 'redirects to homepage and displays new post' do
      # needs login first
      post(
        '/login',
        username: 'aliceinwonderland',
        password: 'password1'
      )

      response = post(
        '/post',
        content: 'Test post',
      )

      expect(response).to be_redirect
      follow_redirect!
      expect(last_response.body).to include('<p class="content">Test post</p>')

    end
  end

  context 'POST /signup' do
    context 'given valid info' do
      it 'redirects to homepage having logged in' do
        response = post(
          '/signup',
          email: 'test@makersacademy.com',
          password: 'testpassword',
          name: 'testname',
          username: 'testuser'
        )

        expect(response).to be_redirect
        follow_redirect!
        expect(last_response.body).to include('<label>Hello testname</label>')
      end
    end
  end

end

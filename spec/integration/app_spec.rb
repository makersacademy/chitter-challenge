require 'spec_helper'
require 'rack/test'
require_relative '../../app'

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  describe 'GET /' do
    it 'returns all peeps in the database' do
      response = get('/')

      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Chitter • Latest Peeps</h1>')
      expect(response.body).to include('<p>content peep 1</p>')
      expect(response.body).to include('<p>content peep 2</p>')
      expect(response.body).to include('<p>content peep 3</p>')
      expect(response.body).to include('<p>content peep 4</p>')
    end

    it 'if a user is signed in it shows the username' do
      login = post(
        '/login',
        email: 'email_1@email.com',
        password: 'strong_password1'
      )
      response = get('/')

      expect(response.status).to eq 200
      expect(response.body).to include('<li>username_1</li>')
    end

    it 'if a user is signed in it shows a logout button' do
      login = post(
        '/login',
        email: 'email_2@email.com',
        password: 'strong_password2'
      )
      response = get('/')

      expect(response.status).to eq 200
      expect(response.body).to include('<li><a href="/logout">Logout</a></li>')
    end
  end

  describe 'GET /index' do
    it 'redirects to /' do
      response = get('/index')
      expect(response.status).to eq 302
      expect(response).to be_redirect
      expect(response.location).to eq 'http://example.org/'
    end
  end

  describe 'GET /peeps/:id' do
    it 'returns details for a peep (or thread of peeps given) the id' do
      response = get('/peeps/2')

      expect(response.status).to eq 200
      expect(response.body).to include('content peep 2')
      expect(response.body).to include('user_2')
      expect(response.body).to include('username_2')
    end
  end

  describe 'GET /signup' do
    it 'returns a form to sign up for Chitter' do
      response = get('/signup')

      expect(response.status).to eq 200
      expect(response.body).to include('<form action="/signup" method="POST">')
      expect(response.body).to include('<input type="text" name="email">')
      expect(response.body).to include('<input type="text" name="password">')
      expect(response.body).to include('<input type="text" name="name">')
      expect(response.body).to include('<input type="text" name="username">')
    end
  end

  describe 'POST /signup' do
    it 'allows the registration of a new user' do
      response = post(
        '/signup',
        email: 'user@email.com',
        password: 'password',
        name: 'One More User',
        username: 'one_more_username'
      )

      expect(response.status).to eq 200
      expect(response.body).to include('<h1>Your account is ready!</h1>')
      expect(response.body).to include('<a href="/login">Log in</a>')
    end

    it 'will reload the page if the email is in use' do
      response = post(
        '/signup',
        email: 'email_1@email.com',
        password: 'new_password',
        name: 'New User',
        username: 'new_username'
      )

      expect(response.status).to eq 200
      expect(response.body).to include('<h2>Email address and/or username already in use</h2>')
    end

    it 'will reload the page if the username is in use' do
      response = post(
        '/signup',
        email: 'another_new_email@email.com',
        password: 'new_password',
        name: 'New User',
        username: 'username_3'
      )

      expect(response.status).to eq 200
      expect(response.body).to include('<h2>Email address and/or username already in use</h2>')
    end

    it 'will reload the page if the username is invalid' do
      response = post(
        '/signup',
        email: 'another_new_email@email.com',
        password: 'new_password',
        name: 'New User',
        username: '<script>username'
      )

      expect(response.status).to eq 200
      expect(response.body).to include('<h2>Please check your input</h2>')
    end

    it 'will reload the page if the email is invalid' do
      response = post(
        '/signup',
        email: 'invalid<script>@@email.com',
        password: 'new_password',
        name: 'New User',
        username: 'new_username'
      )

      expect(response.status).to eq 200
      expect(response.body).to include('<h2>Please check your input</h2>')
    end

    it 'will reload the page if the name is invalid' do
      response = post(
        '/signup',
        email: 'new_email@email.com',
        password: 'new_password',
        name: 'New-User With Invalid_<script>Name',
        username: 'new_username'
      )

      expect(response.status).to eq 200
      expect(response.body).to include('<h2>Please check your input</h2>')
    end
  end

  describe 'GET /login' do
    it 'presents a login form to the user' do
      response = get('/login')

      expect(response.status).to eq 200
      expect(response.body).to include('<form action="/login" method="POST">')
      expect(response.body).to include('<input type="text" name="email">')
      expect(response.body).to include('<input type="text" name="password">')
    end
  end

  describe 'POST /login' do
    it 'shows a message if the credentials are incorrect' do
      response = post(
        '/login',
        email: 'invalid@email.com',
        password: 'password'
      )

      expect(response.status).to eq 200
      expect(response.body).to include('<h1>Unable to log in</h1>')
      expect(response.body).to include('<h2>Email or password are incorrect</h2>')
      expect(response.body).to include('<a href="/login">Try again</a>')
    end

    it 'shows a message if the email provided is not an email address' do
      response = post(
        '/login',
        email: 'inval<script>id@@email.com',
        password: 'password'
      )

      expect(response.status).to eq 200
      expect(response.body).to include('<h1>Unable to log in</h1>')
      expect(response.body).to include('<h2>Email or password are incorrect</h2>')
      expect(response.body).to include('<a href="/login">Try again</a>')
    end

    it 'shows a message if the password is incorrect' do
      response = post(
        '/login',
        email: 'email_1@email.com',
        password: 'wrong password'
      )

      expect(response.status).to eq 200
      expect(response.body).to include('<h1>Unable to log in</h1>')
      expect(response.body).to include('<h2>Email or password are incorrect</h2>')
      expect(response.body).to include('<a href="/login">Try again</a>')
    end

    it 'allows the user to log in' do
      response = post(
        '/login',
        email: 'email_1@email.com',
        password: 'strong_password1'
      )

      expect(response.status).to eq 200
      expect(response.body).to include('<h1>Logged in as username_1</h1>')
      expect(response.body).to include('<a href="/index">Browse new peeps</a>')
      expect(response.body).to include('<a href="/peeps/new">Post a new peep</a>')
    end
  end

  describe 'GET /peeps/new' do
    it 'returns a form to create a new peep' do
      login = post(
        '/login',
        email: 'email_1@email.com',
        password: 'strong_password1'
      )

      response = get('peeps/new')

      expect(response.status).to eq 200
      expect(response.body).to include('<form action="/peeps/new" method="POST">')
      expect(response.body).to include('<input type="text" name="content">')
    end

    it 'returns the login page if the user is not signed in' do
      response = get('peeps/new')

      expect(response.body).to include('<form action="/login" method="POST">')
      expect(response.body).to include('<input type="text" name="email">')
      expect(response.body).to include('<input type="text" name="password">')
    end
  end

  describe 'POST /peeps/new' do
    it 'allows a logged in user to post a new peep' do
      login = post(
        '/login',
        email: 'email_1@email.com',
        password: 'strong_password1'
      )

      new_peep = post(
        '/peeps/new',
        content: 'new peep!'
      )

      response = get('/')

      expect(response.body).to include('new peep!')
    end

    it 'sanitizes user input before creating a new peep' do
      login = post(
        '/login',
        email: 'email_1@email.com',
        password: 'strong_password1'
      )

      string = "<script>window.alert(\"You've been p0wn3d!!!!\"); document.location.href=\"https://www.youtube.com/watch?v=34Ig3X59_qA\";</script>"
      output = '&lt;script&gt;window.alert(&quot;You&#x27;ve been p0wn3d!!!!&quot;); document.location.href=&quot;https:&#x2F;&#x2F;www.youtube.com&#x2F;watch?v=34Ig3X59_qA&quot;;&lt;&#x2F;script&gt;'

      new_peep = post(
        '/peeps/new',
        content: string
      )

      response = get('/')

      expect(response.body).to include(output)
    end

    it 'sends out emails if username are tagged' do
      login = post(
        '/login',
        email: 'email_1@email.com',
        password: 'strong_password1'
      )

      string = 'This string contains a tag for @username_1'

      new_peep = post(
        '/peeps/new',
        content: string
      )

      response = get('/')
      expect(response.body).to include(string)
    end
  end

  describe 'GET /logout' do
    it 'logs the user out' do
      login = post(
        '/login',
        email: 'email_1@email.com',
        password: 'strong_password1'
      )

      expect(get('/').body).to include('<li>username_1</li>')
      expect(get('/').body).to include('<li><a href="/peeps/new">New peep</a></li>')
      expect(get('/').body).to include('<li><a href="/logout">Logout</a></li>')

      logout = get('/logout')

      expect(get('/').body).to include('<li><a href="/login">Login</a></li>')
    end
  end

  describe 'GET /peeps/:id/reply' do
    it 'presents a form to reply to a peep' do
      login = post(
        '/login',
        email: 'email_1@email.com',
        password: 'strong_password1'
      )

      response = get('/peeps/2/reply')

      expect(response.status).to eq 200
      expect(response.body).to include('<form action="/peeps/2/reply" method="POST">')
    end

    it 'presents a login page if the user is not signed in' do
      response = get('/peeps/1/reply')

      expect(response.status).to eq 200
      expect(response.body).to include('<form action="/login" method="POST">')
      expect(response.body).to include('<input type="text" name="email">')
      expect(response.body).to include('<input type="text" name="password">')
    end
  end

  describe 'POST /peeps/:id/reply' do
    it 'allows a logged in user to reply to a peep' do
      login = post(
        '/login',
        email: 'email_1@email.com',
        password: 'strong_password1'
      )

      new_peep = post(
        '/peeps/2/reply',
        content: 'this is a reply to another peep'
      )

      response = get('/peeps/2')

      expect(response.body).to include('this is a reply to another peep')
    end

    it 'sanitizes user input before creating a new peep' do
      login = post(
        '/login',
        email: 'email_1@email.com',
        password: 'strong_password1'
      )

      string = "<script>window.alert(\"You've been p0wn3d!!!!\"); document.location.href=\"https://www.youtube.com/watch?v=34Ig3X59_qA\";</script>"
      output = '&lt;script&gt;window.alert(&quot;You&#x27;ve been p0wn3d!!!!&quot;); document.location.href=&quot;https:&#x2F;&#x2F;www.youtube.com&#x2F;watch?v=34Ig3X59_qA&quot;;&lt;&#x2F;script&gt;'

      new_peep = post(
        '/peeps/3/reply',
        content: string
      )

      response = get('/peeps/3')

      expect(response.body).to include(output)
    end
  end
end

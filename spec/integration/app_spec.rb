require 'spec_helper'
require 'rack/test'
require_relative '../../app'

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  before(:each) do
    reset_users_table
    reset_peeps_table
  end

  describe 'GET /' do
    it 'returns 200 OK' do
      response = get('/')
      expect(response.status).to eq 200
    end

    it 'returns returns html with all peeps' do
      response = get('/')

      expect(response.body).to include '<h2>All Peeps</h2>'
      
      expect(response.body).to include 'content_1'
      expect(response.body).to include '2023-05-01 17:15:32'
      expect(response.body).to include 'name_1'
      expect(response.body).to include 'username_1'
      
      expect(response.body).to include 'content_3'
      expect(response.body).to include '2022-06-21 00:01:02'
      expect(response.body).to include 'name_3'
      expect(response.body).to include 'username_3'
      
      expect(response.body).to include 'content_4'
      expect(response.body).to include '2022-06-21 22:01:02'
      expect(response.body).to include 'name_4'
      expect(response.body).to include 'username_4'
    end

    it 'returns html with link to sign up and login when not logged in' do
      response = get('/')
      expect(response.body).to include '<a href="/sign-up">Sign Up</a>'
      expect(response.body).to include '<a href="/login">Log In</a>'
    end
    
    it 'does not return html with link to log in or sign up when logged in' do
      user = User.new
      user.email = 'hello@gmail.com'
      user.password = 'new_pass_123!'
      user.name = 'My Name'
      user.username = 'new_username'
      
      repo = UserRepository.new
      repo.create(user)
      
      post('/login', email: 'hello@gmail.com', password: 'new_pass_123!')
      response = get('/')
      expect(response.body).not_to include '<a href="/login">Log In</a>'
      expect(response.body).not_to include '<a href="/sign-up">Sign Up</a>'
    end
    
    it 'returns html with link to post a new peep when logged in' do
      user = User.new
      user.email = 'hello@gmail.com'
      user.password = 'new_pass_123!'
      user.name = 'My Name'
      user.username = 'new_username'
      
      repo = UserRepository.new
      repo.create(user)
      
      post('/login', email: 'hello@gmail.com', password: 'new_pass_123!')
      response = get('/')
      expect(response.body).to include '<a href="/new-peep">Add new peep</a>'
    end
    
    it 'returns no link to make a new peep when not logged in' do
      response = get('/')
      expect(response.body).not_to include '<a href="/new-peep">Add new peep</a>'
    end
    
    it 'returns html with link to log out when logged in' do
      user = User.new
      user.email = 'hello@gmail.com'
      user.password = 'new_pass_123!'
      user.name = 'My Name'
      user.username = 'new_username'
      
      repo = UserRepository.new
      repo.create(user)
      
      post('/login', email: 'hello@gmail.com', password: 'new_pass_123!')
      response = get('/')
      expect(response.body).to include '<a href="/logout">Log Out</a>'
    end

    it 'does not return html with link to log out when not logged in' do
      response = get('/')
      expect(response.body).not_to include '<a href="/logout">Log Out</a>'
    end
  end

  describe 'GET /login' do
    it "returns 200 OK" do
      response = get('/login')
      expect(response.status).to eq 200
    end

    it 'returns html with login form using POST /login route' do
      response = get('login')
      expect(response.body).to include '<form action="/login" method="POST">'
      expect(response.body).to include '<input type="text" name="email">'
      expect(response.body).to include '<input type="text" name="password">'
      expect(response.body).to include '<input type="submit">'
    end

    it 'returns html with link back to homepage' do
      response = get('/login')
      expect(response.body).to include '<a href="/">Back to homepage</a>'
    end
  end

  describe 'GET /logout' do
    it 'logs the user out' do
      user = User.new
      user.email = 'hello@gmail.com'
      user.password = 'new_pass_123!'
      user.name = 'My Name'
      user.username = 'new_username'
      
      repo = UserRepository.new
      repo.create(user)
      
      post('/login', email: 'hello@gmail.com', password: 'new_pass_123!')
      response = get('/logout')

      expect(response.status).to eq 302
    end
  end
  
  describe 'GET /sign-up' do
    it 'returns 200 OK' do
      response = get('/sign-up')
      expect(response.status).to eq 200
    end
    
    it 'returns html with sign up form using POST /sign-up route' do
      response = get('/sign-up')
      expect(response.body).to include '<form action="/sign-up" method="POST">'
      expect(response.body).to include '<input type="text" name="email">'
      expect(response.body).to include '<input type="text" name="password">'
      expect(response.body).to include '<input type="text" name="name">'
      expect(response.body).to include '<input type="text" name="username">'
      expect(response.body).to include '<input type="submit">'
    end
    
    it 'returns html with link back to homepage' do
      response = get('/sign-up')
      expect(response.body).to include '<a href="/">Back to homepage</a>'
    end
  end
  
  describe 'GET /new-peep' do
    context 'when user is logged in' do
      it 'returns 200 OK' do
        user = User.new
        user.email = 'hello@gmail.com'
        user.password = 'new_pass_123!'
        user.name = 'My Name'
        user.username = 'new_username'

        repo = UserRepository.new
        repo.create(user)

        response = post('/login', email: 'hello@gmail.com', password: 'new_pass_123!')
        response = get('/new-peep')
        expect(response.status).to eq 200
      end
      
      it 'returns html with new peep form using POST /new-peep route' do
        user = User.new
        user.email = 'hello@gmail.com'
        user.password = 'new_pass_123!'
        user.name = 'My Name'
        user.username = 'new_username'

        repo = UserRepository.new
        repo.create(user)

        response = post('/login', email: 'hello@gmail.com', password: 'new_pass_123!')
        response = get('/new-peep')
        expect(response.body).to include '<form action="/new-peep" method="POST">'
        expect(response.body).to include '<input type="text" name="content">'
        expect(response.body).to include '<input type="submit">'
      end
      
      it 'returns html with link back to the homepage' do
        user = User.new
        user.email = 'hello@gmail.com'
        user.password = 'new_pass_123!'
        user.name = 'My Name'
        user.username = 'new_username'

        repo = UserRepository.new
        repo.create(user)

        response = post('/login', email: 'hello@gmail.com', password: 'new_pass_123!')
        response = get('/new-peep')
        expect(response.body).to include '<a href="/">Back to homepage</a>'
      end
    end
    
    context 'when user is not logged in' do
      it 'redirects to the login page' do
        response = get('/new-peep')
        expect(response.status).to eq 302
      end
    end
  end

  describe 'POST /login' do
    context 'when used with valid params' do
      it 'returns 200 OK' do
        user = User.new
        user.email = 'hello@gmail.com'
        user.password = 'new_pass_123!'
        user.name = 'My Name'
        user.username = 'new_username'

        repo = UserRepository.new
        repo.create(user)

        response = post('/login', email: 'hello@gmail.com', password: 'new_pass_123!')
        expect(response.status).to eq 200
      end

      it 'returns html success message' do
        user = User.new
        user.email = 'hello@gmail.com'
        user.password = 'new_pass_123!'
        user.name = 'My Name'
        user.username = 'new_username'

        repo = UserRepository.new
        repo.create(user)

        response = post('/login', email: 'hello@gmail.com', password: 'new_pass_123!')
        expect(response.body).to include '<h1>Success!</h1>'
      end
      
      it 'returns html with link back to the homepage' do
        user = User.new
        user.email = 'hello@gmail.com'
        user.password = 'new_pass_123!'
        user.name = 'My Name'
        user.username = 'new_username'
  
        repo = UserRepository.new
        repo.create(user)
  
        response = post('/login', email: 'hello@gmail.com', password: 'new_pass_123!')
        expect(response.body).to include '<p><a href="/">Back to homepage</a></p>'
      end
      
      it 'logs the user in' do
        user = User.new
        user.email = 'hello@gmail.com'
        user.password = 'new_pass_123!'
        user.name = 'My Name'
        user.username = 'new_username'
        
        repo = UserRepository.new
        repo.create(user)
        
        response = post('/login', email: 'hello@gmail.com', password: 'new_pass_123!')
        expect(response.body).to include '<h2>Hello My Name! You are logged in as new_username</h2>'
      end
    end
    
    context 'when used with invalid params' do
      context 'when email is blank' do
        it 'returns 400 Bad Request and failure page' do
          response = post('/login', email: '', password: 'new_pass_123!')
          expect(response.status).to eq 400
          expect(response.body).to include '<a href="/">Back to homepage</a>'
          expect(response.body).to include '<h2>One or more of your inputs was invalid</h2>'
          expect(response.body).to include '<a href="/login">Try again</a>'
        end
      end
      
      context 'when email does not exist in the database' do
        it 'returns 400 Bad Request and failure page' do
          response = post('/login', email: 'fake_email@email.com', password: 'new_pass_123!')
          expect(response.status).to eq 400
          expect(response.body).to include '<a href="/">Back to homepage</a>'
          expect(response.body).to include '<h2>One or more of your inputs was invalid</h2>'
          expect(response.body).to include '<a href="/login">Try again</a>'
        end
      end
      
      context 'when password is incorrect' do
        it 'returns 400 Bad Request and failure page' do
          user = User.new
          user.email = 'hello@gmail.com'
          user.password = 'new_pass_123!'
          user.name = 'My Name'
          user.username = 'new_username'
  
          repo = UserRepository.new
          repo.create(user)
          
          response = post('/login', email: 'hello@gmail.com', password: 'bad_pass')
          expect(response.status).to eq 400
          expect(response.body).to include '<a href="/">Back to homepage</a>'
          expect(response.body).to include '<h2>One or more of your inputs was invalid</h2>'
          expect(response.body).to include '<a href="/login">Try again</a>'
        end
      end
    end
  end
  
  describe 'POST /sign-up' do
    context 'when used with valid params' do
      it 'returns 200 OK' do
        response = post(
          '/sign-up',
          email: 'new@gmail.com',
          password: 'new_password',
          name: 'New Name',
          username: 'new_username'
        )
        expect(response.status).to eq 200
      end
      
      it 'returns html with success message' do
        response = post(
          '/sign-up',
          email: 'new@gmail.com',
          password: 'new_password',
          name: 'New Name',
          username: 'new_username'
        )
        expect(response.body).to include '<h1>Success!</h1>'
        expect(response.body).to include '<h2>Thanks for signing up!</h2>'
      end
      
      it 'returns html with link back to the homepage' do
        response = post('/sign-up')
        expect(response.body).to include '<a href="/">Back to homepage</a>'
      end
      
      it 'adds a new user to the database' do
        response = post(
          '/sign-up',
          email: 'new@gmail.com',
          password: 'new_password',
          name: 'New Name',
          username: 'new_username'
        )
        
        repo = UserRepository.new
        user = repo.find(5)

        expect(user.email).to eq 'new@gmail.com'
        expect(user.name).to eq 'New Name'
        expect(user.username).to eq 'new_username'

        stored_password = BCrypt::Password.new(user.password)
        expect(stored_password).to eq 'new_password'
      end
    end
    
    context 'when used with invalid params' do
      context 'when email already exists' do
        it 'returns 400 Bad Request and html failure page' do
          response = post(
            '/sign-up',
            email: 'email_1',
            password: 'new_password',
            name: 'New Name',
            username: 'new_username'
          )
          expect(response.status).to eq 400
          expect(response.body).to include '<h1>Error!</h1>'
          expect(response.body).to include (
            '<h2>One or more of your inputs was invalid</h2>'
          )
          expect(response.body).to include '<a href="/">Back to homepage</a>'
          expect(response.body).to include '<a href="/sign-up">Try again</a>'
        end        
      end

      context 'when username already exists' do
        it 'returns 400 Bad Request and html failure page' do
          response = post(
            '/sign-up',
            email: 'new_email',
            password: 'new_password',
            name: 'New Name',
            username: 'username_1'
          )
          expect(response.status).to eq 400
          expect(response.body).to include '<h1>Error!</h1>'
          expect(response.body).to include (
            '<h2>One or more of your inputs was invalid</h2>'
          )
          expect(response.body).to include '<a href="/">Back to homepage</a>'
          expect(response.body).to include '<a href="/sign-up">Try again</a>'
        end        
      end

      context 'when email is empty' do
        it 'returns 400 Bad Request and html failure page' do
          response = post(
            '/sign-up',
            email: '',
            password: 'new_password',
            name: 'New Name',
            username: 'new_username'
          )
          expect(response.status).to eq 400
          expect(response.body).to include '<h1>Error!</h1>'
          expect(response.body).to include (
            '<h2>One or more of your inputs was invalid</h2>'
          )
          expect(response.body).to include '<a href="/">Back to homepage</a>'
          expect(response.body).to include '<a href="/sign-up">Try again</a>'
        end
      end

      context 'when password is empty' do
        it 'returns 400 Bad Request and html failure page' do
          response = post(
            '/sign-up',
            email: 'new_email',
            password: '',
            name: 'New Name',
            username: 'new_username'
          )
          expect(response.status).to eq 400
          expect(response.body).to include '<h1>Error!</h1>'
          expect(response.body).to include (
            '<h2>One or more of your inputs was invalid</h2>'
          )
          expect(response.body).to include '<a href="/">Back to homepage</a>'
          expect(response.body).to include '<a href="/sign-up">Try again</a>'
        end
      end

      context 'when name is empty' do
        it 'returns 400 Bad Request and html failure page' do
          response = post(
            '/sign-up',
            email: 'new_email',
            password: 'new_password',
            name: '',
            username: 'new_username'
          )
          expect(response.status).to eq 400
          expect(response.body).to include '<h1>Error!</h1>'
          expect(response.body).to include (
            '<h2>One or more of your inputs was invalid</h2>'
          )
          expect(response.body).to include '<a href="/">Back to homepage</a>'
          expect(response.body).to include '<a href="/sign-up">Try again</a>'
        end
      end

      context 'when username is empty' do
        it 'returns 400 Bad Request and html failure page' do
          response = post(
            '/sign-up',
            email: 'new_email',
            password: 'new_password',
            name: 'New Name',
            username: ''
          )
          expect(response.status).to eq 400
          expect(response.body).to include '<h1>Error!</h1>'
          expect(response.body).to include (
            '<h2>One or more of your inputs was invalid</h2>'
          )
          expect(response.body).to include '<a href="/">Back to homepage</a>'
          expect(response.body).to include '<a href="/sign-up">Try again</a>'
        end
      end

      context 'when email has invalid characters' do
        it 'returns 400 Bad Request and html failure page' do
          response = post(
            '/sign-up',
            email: 'new_email<',
            password: 'new_password',
            name: 'New Name',
            username: 'username'
          )
          expect(response.status).to eq 400
          expect(response.body).to include '<h1>Error!</h1>'
          expect(response.body).to include (
            '<h2>One or more of your inputs was invalid</h2>'
          )
          expect(response.body).to include '<a href="/">Back to homepage</a>'
          expect(response.body).to include '<a href="/sign-up">Try again</a>'
        end
      end

      context 'when password has invalid characters' do
        it 'returns 400 Bad Request and html failure page' do
          response = post(
            '/sign-up',
            email: 'new_email',
            password: 'new_password>',
            name: 'New Name',
            username: 'username'
          )
          expect(response.status).to eq 400
          expect(response.body).to include '<h1>Error!</h1>'
          expect(response.body).to include (
            '<h2>One or more of your inputs was invalid</h2>'
          )
          expect(response.body).to include '<a href="/">Back to homepage</a>'
          expect(response.body).to include '<a href="/sign-up">Try again</a>'
        end
      end

      context 'when name has invalid characters' do
        it 'returns 400 Bad Request and html failure page' do
          response = post(
            '/sign-up',
            email: 'new_email',
            password: 'new_password',
            name: 'New Name<html>',
            username: 'username'
          )
          expect(response.status).to eq 400
          expect(response.body).to include '<h1>Error!</h1>'
          expect(response.body).to include (
            '<h2>One or more of your inputs was invalid</h2>'
          )
          expect(response.body).to include '<a href="/">Back to homepage</a>'
          expect(response.body).to include '<a href="/sign-up">Try again</a>'
        end
      end

      context 'when username has invalid characters' do
        it 'returns 400 Bad Request and html failure page' do
          response = post(
            '/sign-up',
            email: 'new_email',
            password: 'new_password',
            name: 'New Name',
            username: '<script>username'
          )
          expect(response.status).to eq 400
          expect(response.body).to include '<h1>Error!</h1>'
          expect(response.body).to include (
            '<h2>One or more of your inputs was invalid</h2>'
          )
          expect(response.body).to include '<a href="/">Back to homepage</a>'
          expect(response.body).to include '<a href="/sign-up">Try again</a>'
        end
      end

      it 'doesn\'t update the database' do
        repo = UserRepository.new
        number_of_records = repo.all.length

        response = post(
          '/sign-up',
          email: 'new_email',
          password: 'new_password',
          name: 'New Name',
          username: '<script>username'
        )

        updated_number_of_records = repo.all.length
        expect(updated_number_of_records).to eq number_of_records
      end
    end
  end

  describe 'POST /new-peep' do
    context 'when used with valid params' do
      it 'returns 200 OK' do
        response = post(
          '/new-peep',
          content: 'test_content',
          time_posted: Time.now,
          user_id: '4'
        )
        expect(response.status).to eq 200
      end
      
      it 'returns html with success message' do
        response = post(
          '/new-peep',
          content: 'test_content',
          time_posted: Time.now,
          user_id: '4'
        )
        expect(response.body).to include '<h1>Success!</h1>'
        expect(response.body).to include '<h2>You added a new peep!</h2>'
      end
      
      it 'returns html with link back to the homepage' do
        response = post(
          '/new-peep',
          content: 'test_content',
          time_posted: Time.now,
          user_id: '4'
        )
        expect(response.body).to include '<a href="/">Back to homepage</a>'
      end
      
      it 'returns html with option to create another new peep' do
        response = post(
          '/new-peep',
          content: 'test_content',
          time_posted: Time.now,
          user_id: '4'
        )
        expect(response.body).to include '<a href="/new-peep">Add another peep</a>'
      end
      
      it 'adds a new peep to the database' do
        user = User.new
        user.email = 'hello@gmail.com'
        user.password = 'new_pass_123!'
        user.name = 'My Name'
        user.username = 'new_username'

        repo = UserRepository.new
        repo.create(user)

        response = post('/login', email: 'hello@gmail.com', password: 'new_pass_123!')

        response = post(
          '/new-peep',
          content: 'this is new content',
          time_posted: Time.new(2000, 1, 2, 3, 4, 5)
        )
        repo = PeepRepository.new
        expect(repo.all).to include(
          have_attributes(
            id: 8,
            content: 'this is new content',
            time_posted: Time.new(2000, 1, 2, 3, 4, 5),
            user_id: 5
          )
        )
      end
    end

    context 'when used with invalid params' do
      context 'when content is empty' do
        it 'returns 400 Bad Request and html failure page' do
          response = post(
            '/new-peep',
            content: '',
            time_posted: Time.now,
            user_id: '4'
          )
          expect(response.status).to eq 400
          expect(response.body).to include '<h1>Error!</h1>'
          expect(response.body).to include (
            '<h2>One or more of your inputs was invalid</h2>'
          )
          expect(response.body).to include '<a href="/">Back to homepage</a>'
          expect(response.body).to include '<a href="/new-peep">Try again</a>'
        end
      end

      context 'when user_id is empty' do
        it 'returns 400 Bad Request and html failure page' do
          response = post(
            '/new-peep',
            content: 'some new content',
            time_posted: Time.now,
            user_id: ''
          )
          expect(response.status).to eq 400
          expect(response.body).to include '<h1>Error!</h1>'
          expect(response.body).to include (
            '<h2>One or more of your inputs was invalid</h2>'
          )
          expect(response.body).to include '<a href="/">Back to homepage</a>'
          expect(response.body).to include '<a href="/new-peep">Try again</a>'
        end
      end

      context 'when content has invalid characters' do
        it 'returns 400 Bad Request and html failure page' do
          response = post(
            '/new-peep',
            content: 'some new content<html>',
            time_posted: Time.now,
            user_id: '3'
          )
          expect(response.status).to eq 400
          expect(response.body).to include '<h1>Error!</h1>'
          expect(response.body).to include (
            '<h2>One or more of your inputs was invalid</h2>'
          )
          expect(response.body).to include '<a href="/">Back to homepage</a>'
          expect(response.body).to include '<a href="/new-peep">Try again</a>'
        end
      end

      context 'when user_id has invalid characters' do
        it 'returns 400 Bad Request and html failure page' do
          response = post(
            '/new-peep',
            content: 'some new content',
            time_posted: Time.now,
            user_id: '3<script>'
          )
          expect(response.status).to eq 400
          expect(response.body).to include '<h1>Error!</h1>'
          expect(response.body).to include (
            '<h2>One or more of your inputs was invalid</h2>'
          )
          expect(response.body).to include '<a href="/">Back to homepage</a>'
          expect(response.body).to include '<a href="/new-peep">Try again</a>'
        end
      end

      it 'doesn\'t update the database' do
        repo = PeepRepository.new
        number_of_records = repo.all.length

        response = post(
          '/new-peep',
          content: 'some new content',
          time_posted: Time.now,
          user_id: '3<script>'
        )

        updated_number_of_records = repo.all.length
        expect(updated_number_of_records).to eq number_of_records
      end
    end
  end
end

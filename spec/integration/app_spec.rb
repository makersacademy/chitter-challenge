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

      expect(response.body).to include '<h1>All Peeps</h1>'
      
      expect(response.body).to include 'content_1'
      expect(response.body).to include '2023-05-01 17:15:32'
      expect(response.body).to include 'username_1'

      expect(response.body).to include 'content_3'
      expect(response.body).to include '2022-06-21 00:01:02'
      expect(response.body).to include 'username_3'

      expect(response.body).to include 'content_4'
      expect(response.body).to include '2022-06-21 22:01:02'
      expect(response.body).to include 'username_4'
    end

    it 'returns html with link to sign up' do
      response = get('/')
      expect(response.body).to include '<a href="/sign-up">Sign Up</a>'
    end
    
    it 'returns html with link to post a new peep' do
      response = get('/')
      expect(response.body).to include '<a href="/new-peep">Add new peep</a>'
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
    it 'returns 200 OK' do
      response = get('/new-peep')
      expect(response.status).to eq 200
    end
    
    it 'returns html with new peep form using POST /new-peep route' do
      response = get('/new-peep')
      expect(response.body).to include '<form action="/new-peep" method="POST">'
      expect(response.body).to include '<input type="text" name="content">'
      expect(response.body).to include '<input type="text" name="user_id">'
      expect(response.body).to include '<input type="submit">'
    end
    
    it 'returns html with link back to the homepage' do
      response = get('/new-peep')
      expect(response.body).to include '<a href="/">Back to homepage</a>'
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
        expect(repo.all).to include(
          have_attributes(
            email: 'new@gmail.com',
            password: 'new_password',
            name: 'New Name',
            username: 'new_username'
          )
        )
      end
    end
    
    context 'when used with invalid params' do
      context 'when email is empty'
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

      context 'when password is empty'
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

      context 'when name is empty'
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

      context 'when username is empty'
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
  end

  describe 'POST /new-peep' do
    context 'when used with valid params' do
      it 'returns 200 OK' do
        response = post('/new-peep')
        expect(response.status).to eq 200
      end
      
      it 'returns html with success message' do
        response = post('/new-peep')
        expect(response.body).to include '<h1>Success!</h1>'
        expect(response.body).to include '<h2>You added a new peep!</h2>'
      end
      
      it 'returns html with link back to the homepage' do
        response = post('/new-peep')
        expect(response.body).to include '<a href="/">Back to homepage</a>'
      end
      
      it 'returns html with option to create another new peep' do
        response = post('/new-peep')
        expect(response.body).to include '<a href="/new-peep">Add another peep</a>'
      end
      
      it 'adds a new peep to the database' do
        response = post(
          '/new-peep',
          content: 'this is new content',
          time_posted: Time.new(2000, 1, 2, 3, 4, 5),
          user_id: '3'
        )
        repo = PeepRepository.new
        expect(repo.all).to include(
          have_attributes(
            id: 8,
            content: 'this is new content',
            time_posted: Time.new(2000, 1, 2, 3, 4, 5),
            user_id: 3
          )
        )
      end
    end

    context 'when used with invalid params' do
      xit 'returns 400 Bad Request' do
      end
      # TODO - Consider invalid params
    end
  end
end

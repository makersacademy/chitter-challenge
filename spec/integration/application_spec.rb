require 'sinatra/base'
require 'sinatra/reloader'
require 'rack/session/cookie'
require 'spec_helper'
require 'rack/test'
require_relative '../../app'
require './lib/user_repository'
require './lib/user'
require 'capybara'

RSpec.describe Application do
  include Rack::Test::Methods
  include Capybara::RSpecMatchers

  let(:app) { Application.new }

  before(:each) do
    peep_seeds_sql = File.read("spec/seeds/peeps_seeds.sql")
    user_seeds_sql = File.read("spec/seeds/users_seeds.sql")
    connection = PG.connect({ host: "127.0.0.1", dbname: "chitter_database_test" })
    connection.exec(peep_seeds_sql)
    connection.exec(user_seeds_sql)
  end

  context 'GET /' do
    it 'shows a list of peeps with usernames and time they were posted' do
      response = get('/')

      expect(response.status).to eq 200
      expect(response.body).to include 'loving chitter'
      expect(response.body).to include 'posting my first peep'
      expect(response.body).to include 'onto my second peep'
      expect(response.body).to include '<h1>Chitter</h1>'
    end
  end

  context 'GET /welcome' do
    it 'provides the user with a form to log in' do
      response = get('welcome')

      expect(response.status).to eq(200)
      expect(response.body).to include('<h2 class="left">Log in</h2>')
      expect(response.body).to include('<form action="/log-in" method="POST" class="left">')
    end

    it 'provides the user with a form to sign up' do
      response = get('/welcome')

      expect(response.status).to eq(200)
      expect(response.body).to include('<h2 class="right">Sign up</h2>')
      expect(response.body).to include('<form action="/sign-up" method="POST" class="right">')
    end
  end

  context 'GET /sign-up' do
    it 'provides a form for the user to sign up to Chitter' do
      response = get('/sign-up')

      expect(response.status).to eq(200)
      expect(response.body).to include('<form action="/sign-up" method="POST">')
    end
  end

  context 'POST /sign-up' do
    it 'creates a new user in the database' do
      response = post('/sign-up', name: 'user four', email:'user_four@gmail.com', pass_word: 'password4', username: 'user_four')

      expect(response.status).to eq(200)
      expect(response.body).to include('')

      response = post('/log-in', email:'user_four@gmail.com', password:'password4')

      expect(response.status).to eq(302)
      expect(response.body).to eq('')
    end
  end

  context 'GET /log-in' do
    it 'provides a form for the user to log in' do
      response = get('/log-in')

      expect(response.status).to eq(200)
      expect(response.body).to include('<form action="/log-in" method="POST">')
    end
  end

  context 'POST /log-in' do
    it 'logs the user in and redirects to the homepage' do
      response = post('/log-in', email:'user_two@gmail.com', password:'password2')

      expect(response.status).to eq(302)
      expect(response.body).to eq('')
    end

    it 'returns an error message when user inputs invalid username or password' do
      response = post('/log-in', email:'user_five@gmail.com', password:'password5')

      expect(response.status).to eq(302)
      expect(response.body).to eq('')
    end
  end

  context 'GET /error' do
    it 'returns an error message for invalid credentials' do
      response = get('/error')

      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Invalid username or password! Please try again</h1>')
    end
  end

  context 'GET /peep' do
    it 'provides a form for the user to post a peep' do
      response = get('/peep')

      expect(response.status).to eq(200)
      expect(response.body).to include('<form action="/peep" method="post">')
    end
  end

  context 'POST /peep' do
    it 'creates a new peep and shows it on the homepage when user is logged in' do
      response = post('/peep', {user_id:2, message: 'this is a test peep', time_posted:'2023-02-16 21:48:43'}, {'rack.session' => {user_id: 2}})

      expect(last_response).to be_redirect
      follow_redirect!
      expect(last_request.path).to eq('/')
    end

    it 'redirects to the /log-in page when user is not logged in' do
      post('/peep', {}, {'rack.session' => {}})

      expect(last_response).to be_redirect
      follow_redirect!
      expect(last_request.path).to eq('/log-in')
    end
  end
end
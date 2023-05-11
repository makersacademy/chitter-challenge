require 'spec_helper'
require 'rack/test'
require_relative '../../app'

RSpec.describe Application do
  before(:each) do
    reset_tables
  end

  include Rack::Test::Methods

  let(:app) { Application.new }

  context 'GET /' do
    it 'lists all peeps with names' do
      response = get('/')

      expect(response.status).to eq 200
      expect(response.body).to include('<h1>Chitter</h1>')
      expect(response.body).to include('<a href="/users/new">Sign up now!</a>')
      expect(response.body).to include("Louis (<a href='users/1'>lpc</a>) says:")
      expect(response.body).to include('First post')
      expect(response.body).to include('- 12:00:00')
      expect(response.body).to include("Louis (<a href='users/1'>lpc</a>) says:")
      expect(response.body).to include('Second post')
      expect(response.body).to include('- 13:00:00')
    end

    it 'contains a form for creating a new peep' do
      response = get('/')

      expect(response.status).to eq 200
      expect(response.body).to include('<form method="POST" action="/peep">')
      expect(response.body).to include('<label>What would you like the world to know?</label>')
    end
  end

  context "POST /peep" do
    it 'returns 200 OK with valid username' do
      # Assuming the username already exisis
      response = post(
        '/peep',
        content: 'New peep posted',
        username: 'lpc'
      )

      expect(response.status).to eq(200)
      expect(response.body).to include('New peep posted')

      response = get('/')
      expect(response.body).to include('New peep posted')
    end

    it 'returns 400 with invalid username' do
      response = post(
        '/peep',
        content: "New peep posted",
        username: "unknown"
      )

      expect(response.status).to eq 400
      expect(response.body).to include('<div>This user (unknown) does not exist...</div>')
      expect(response.body).to include('<div>Please <a href="/users/new">sign up</a> first</div>')
    end

    it 'returns 400 and no response when parameters not valid' do
      response = post(
        '/peep',
        fake_content: "New peep posted",
        bad_param: "unknown"
      )

      expect(response.status).to eq 400
      expect(response.body).to eq ''
    end
  end

  context "GET /users/new" do
    it 'returns 200 OK with the sign up form' do
      response = get('/users/new')

      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Welcome to Chitter!</h1>')
      expect(response.body).to include('<form method="POST" action="/user">')
    end
  end

  context "POST /user" do
    it 'returns 200 OK with valid email and username' do
      response = post(
        '/user',
        email: 'email@example.com',
        password: 'password',
        name: 'Jimmy',
        username: 'jm123')

      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Sign up complete!</h1>')
    end

    it 'returns 400 when email taken' do
      response = post(
        '/user',
        email: 'lou@chitter.com',
        password: 'password',
        name: 'Jimmy',
        username: 'jm123')

      expect(response.status).to eq(400)
      expect(response.body).to include('<div>Sorry, this email already exists</div>')
    end

    it 'returns 400 when username taken' do
      response = post(
        '/user',
        email: 'example@email.com',
        password: 'password',
        name: 'Jimmy',
        username: 'lpc')

      expect(response.status).to eq(400)
      expect(response.body).to include('<div>Sorry, this username already exists</div>')
    end

    it 'returns 400 and no response when parameters not valid' do
      response = post(
        '/user',
        not_email: 'example@email.com',
        random_param: 1234,
        no_name: 'Jimmy',
        or_username: 'lpc')

      expect(response.status).to eq 400
      expect(response.body).to eq ''
    end
  end

  context "GET /users/:id" do
    it 'returns 200 OK' do
      response = get('/users/1')

      expect(response.status).to eq(200)
      expect(response.body).to include('<h2>lpc</h2>')
      expect(response.body).to include('<div>First post</div>')
      expect(response.body).to include('<div>Second post</div>')
      expect(response.body).to include('<div>- 13:00:00</div>')
    end

    it 'returns 404 Not Found' do
      response = get('/user/276278')

      expect(response.status).to eq(404)
    end
  end
end

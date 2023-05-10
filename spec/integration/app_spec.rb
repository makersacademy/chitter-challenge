require 'spec_helper'
require 'rack/test'
require_relative '../../app'

def reset_tables
  seed_sql = File.read('spec//seeds/app_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_site_test' })
  connection.exec(seed_sql)
end

DatabaseConnection.connect('chitter_site_test')

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
      expect(response.body).to include('<a href="/new_user">Sign up!</a>')
      expect(response.body).to include('Louis (lpc) says:')
      expect(response.body).to include('First post')
      expect(response.body).to include('- 12:00:00')
      expect(response.body).to include('Louis (lpc) says:')
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
        content: "New peep posted",
        username: "lpc"
      )

      expect(response.status).to eq(200)
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
      expect(response.body).to include('<div>Please sign up first</div>')
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

  context "GET /new_user" do
    it 'returns 200 OK with the sign up form' do
      response = get('/new_user')

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

    xit 'returns 500 when email taken' do
      response = post(
        '/user',
        email: 'lou@chitter.com',
        password: 'password',
        name: 'Jimmy',
        username: 'jm123')

      expect(response.status).to eq(500)
      expect(response.body).to include('<div>Your email is already taken</div>')
    end

    xit 'returns 500 when username taken' do
      response = post(
        '/user',
        email: 'lou@chitter.com',
        password: 'password',
        name: 'Jimmy',
        username: 'jm123')

      expect(response.status).to eq(500)
      expect(response.body).to include('<div>Your username is already taken</div>')
    end
  end
end

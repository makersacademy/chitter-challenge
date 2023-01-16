require "spec_helper"
require "rack/test"
require_relative '../../app'

def reset_tables
  seed_peeps_sql = File.read('spec/seeds_peeps.sql')
  seed_users_sql = File.read('spec/seeds_users.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_peeps_sql)
  connection.exec(seed_users_sql)  
end

describe Application do
  before(:each) do
    reset_tables
  end
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context 'GET /' do
    it 'should get the form to add a new peep' do
      response = get('/')
      expect(response.status).to eq(200)
      expect(response.body).to include('<form method="post" action="/peeps">')
      expect(response.body).to include('<input type="text" name="peep_content" />')
      expect(response.body).to include('<input type="timestamp" name="time_posted" />')
      expect(response.body).to include('<input type="int" name="user_id" />')
      expect(response.body).to include('<a href="/login">Login</a>')
    end
  end

  context 'GET /peeps' do
    it "should return a list of peeps" do
      response = get('/peeps')
      expect(response.status).to eq 200
      expect(response.body).to include('Using Chitter for the first time!')
      expect(response.body).to include('Weekend challenge!')
      expect(response.body).to include('Repeeps mean nugget treats')
    end
  end

  context "GET /users/1" do
    it "contains a h1 title" do
      response = get('users/1')
      expect(response.status).to eq 200
      expect(response.body).to include('<h1>')
      expect(response.body).to include('Roger')
      expect(response.body).to include('</h1>')
    end

    it "contains a p tag" do
      response = get('/users/1')
      expect(response.body).to include('roger@yahoo.com')
      expect(response.body).to include('</p>')
      expect(response.body).to include('<p>')
    end
  end

  context 'POST to /peeps' do

    it 'should validate peep parameters' do
      response = post(
        '/peeps',
        peep_content: '@£$%',
        time_posted: 'mdhajkr74358.;'
      )
      expect(response.status).to eq(400)
    end

    it 'returns 200 when it creates the new peep' do
      response = post('/peeps', 
        peep_content: 'Good night everyone!', 
        time_posted: 'Sun Jan 15 2023 23:26:28', 
        user_id: '4'
      )
      expect(response.status).to eq(200)
      response = get('/peeps')
      expect(response.body).to include('Good night everyone!')
    end

    it 'returns "New peep created" ' do
      response = post('/peeps', 
        peep_content: 'Good night everyone!', 
        time_posted: 'Sun Jan 15 2023 23:26:28', 
        user_id: '4'
      )
      expect(response.status).to eq(200)
      expect(response.body).to include("New peep")
      expect(response.body).to include("was created at")
    end
  end
end

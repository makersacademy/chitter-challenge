require 'spec_helper'
require 'rack/test'
require_relative '../../app'

def reset_tables
  seed_sql = File.read('spec/seeds/chitter_tables.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
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

  context '/' do
    it 'should return the homepage' do
      response = get('/')
      expect(response.status).to eq(200)
      expect(response.body).to include('<title>Chitter</title>')
      expect(response.body).to include('<h1>Chitter</h1>')
      expect(response.body).to include ('<form method="POST" action="/">')
    end

    it 'should return all peeps' do
      response = get('/')
      expect(response.status).to eq(200)
      expect(response.body).to include "Peep 1"
      expect(response.body).to include "Meow"
    end
  end

  context 'POST /' do
    it 'posts a new peep' do
      response = post('/', title: 'New peep', content: 'new peep content')
      expect(response.status).to eq 200
      expect(response.body).to include 'New peep'
    end
  end

  context 'GET /signup' do
    it 'gets the signup page' do
      response = get('/signup')
      
      expect(response.status).to eq 200
      expect(response.body).to include '<h2>Sign up</h2>'
      expect(response.body).to include '<label>Password</label>'
    end
  end
end
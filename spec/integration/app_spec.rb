require_relative '../../app'
require 'spec_helper'
require 'rack/test'
  
RSpec.describe Application do
  include Rack::Test::Methods

  let(:app) {Application.new}

  def reset_chitter_tables
    seed_sql = File.read('spec/seeds_chitter.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
    connection.exec(seed_sql)
  end

  before(:each) do 
    reset_chitter_tables
  end

  context 'GET /' do
    it 'should return 200 and correct body' do
      response = get('/')

      expect(response.status).to eq 200
      expect(response.body).to include '<h1> Welcome to Chitter</h1>'
    end
  end

  context 'GET /peeps' do
    it 'should return 200 and correct body' do
      response = get('/peeps')
      
      expect(response.status).to eq 200
      expect(response.body).to include "<h1> What's Peeping?</h1>"
    end
  end

  context 'GET /signup' do
    it 'should return 200 and correct body' do
      response = get('/signup')
      
      expect(response.status).to eq 200
      expect(response.body).to include '<h2>Sign up to Chitter!</h2>'
    end
  end
end
require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  # This is so we can use rack-test helper methods.
  # hello 
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  # run seed files and start database connection 
  before(:each) do 
    chitter_seeds = File.read('spec/seeds/chitter_seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_app_test' })
    connection.exec(chitter_seeds)
  end

  context 'GET /' do 
    it 'returns the home page with options' do 
      response = get('/') 
      
      expect(response.status).to eq 200 
      expect(response.body).to include '<h1>Peeps:</h1>'
      expect(response.body).to include ''
    end 
  end 

  context 'GET /show_peeps' do 
    xit 'returns the list of peeps' do
    end 
  end 

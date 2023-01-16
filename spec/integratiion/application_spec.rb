require "spec_helper"
require "rack/test"
require_relative '../../app'

def reset_tables
    seed_sql = File.read('spec/seeds/chitter_seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
    connection.exec(seed_sql)
end 

describe Application do

  include Rack::Test::Methods

  let(:app) { Application.new }

  before(:each) do 
    reset_tables
  end 

  context 'GET /' do 
    it "returns the homepage with a timeline" do
      response = get('/')

      expect(response.status).to be(200)
      expect(response.body).to include('<title>Chitter</title>')
    end 
  end 
   context 'GET /join' do 
    it "returns the signup page" do
      response = get('/join')

      expect(response.status).to be(200)
      expect(response.body).to include('<title>Sign Up to Chitter!</title>')
    end 
  end 
    context 'GET /login' do 
    it "returns the signup page" do
      response = get('/login')

      expect(response.status).to be(200)
      expect(response.body).to include('<title>Log In</title>')
    end 
  end
  
  context 'GET /peeps/id' do
    it 'returns a specific peep with a given id' do
      response = get('/peeps/1')
      expect(response.status).to be(200)
      expect(response.body).to include('peep')
    end
  end 

  context 'GET /username' do
    xit 'returns all the peeps by the given user' do 
      response = get('/alice')
      expect(response.status).to be(200)
    end
  end

end
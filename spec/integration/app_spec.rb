require "spec_helper"
require "rack/test"
require_relative '../../app'


describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  # def reset_tables
  #   seed_sql = File.read('spec/seeds/test_seeds.sql')
  #   connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  #   connection.exec(seed_sql)
  # end
  
  # before(:each) do 
  #   reset_tables
  # end

  context 'GET /signup' do
    it 'returns 200 OK and a form to sign up' do
      response = get('/signup')
      expect(response.status).to eq(200)
      expect(response.body).to include("<h1>Welcome to Chitter</h1>")
      expect(response.body).to include('<form action="/signup" method="POST">')
    end
  end

  context 'POST /signup' do
    it 'returns 200 OK and the correct content' do
      response = post('/signup', name: 'Sam', username: 'Samy', email: 'samy@mail.com', password: 'samy123' )
      expect(response.status).to eq (200)
      expect(response.body).to include('<h2> Thank you for sign up! <h2>')
      expect(response.body).to include('<a href="/peeps"> View peeps </a>')
    end
  end
       
end


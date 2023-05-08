require "spec_helper"
require 'rack/test'
require_relative '../../app'

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context 'GET /'  do
    it 'should return the list of peeps' do
      response = get('/')

      expect(response.status).to eq(200)
      expect(response.body).to include('First Peep!')
      expect(response.body).to include('Hayley')
    end
  end

   context 'GET /signup' do 
    it 'should provide a form for signup' do
      response = get('/signup')

      expect(response.status).to eq(200)
      expect(response.body).to include('<form method="POST" action="/signup">')
      expect(response.body).to include('input type="text" name="name"')
    end  
  end

  context 'POST /signup' do
    it 'should create a new user record' do
      response = post(
        '/signup',
        name: 'Jack',
        username: 'Jack100',
        email: 'jack@makers.com',
        password: 'password3'
      )

      expect(response.status).to eq(200)
      expect(response.body).to include('Yay! Welcome to the Chitter club!')
    end 
  end
  
  context 'POST /newpeep' do
    it 'should create a peep, authentication not implemented at this point' do
      response = post(
        '/newpeep',
        name: 'Oscar',
        username: 'OscarO',
        content: 'Peepy McPeepface'

      )

      expect(response.status).to eq(200)
    end
  end    
end
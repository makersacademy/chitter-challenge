require 'spec_helper'
require 'rack/test'
require_relative '../../app.rb'

RSpec.describe Application do
  include Rack::Test::Methods
  let(:app) { Application.new }
  before(:each) do 
    reset_tables
  end

  describe 'GET /' do
    it'returns the index page' do
      get '/'
      expect(last_response).to be_ok
      expect(last_response.body).to include('<h1>Welcome to <s>twitter</s> Chitter!</h1>')
      expect(last_response.body).to include('<h2>Messages</h2>')
    end
  end

  describe 'GET /user' do
    it'renders the user page' do
      get '/user'
      expect(last_response).to be_ok
      expect(last_response.body).to include('<h1>Chitter</h1>')
      expect(last_response.body).to include('<h2>Messages</h2>')
    end
  end

  describe 'POST /login' do
    context 'Credentials are wrong' do
      xit 'returns user to login page' do
        response = post('/login', username: 'Jim', password: 'Bob')
        expect(response).to redirect_to('/')
      end
    end

    context 'Credentials are correct' do
      xit 'sends user to user page' do
        
      end
    end
  end
end


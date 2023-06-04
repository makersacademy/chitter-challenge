require 'rspec'
require 'rack/test'
require_relative 'database_helper'
require_relative '../app'

RSpec.describe 'Users' do
  include Rack::Test::Methods

  def app
    Users
  end

  let(:user_params) do
    {
      name: 'John Doe',
      username: 'johndoe',
      email: 'john@example.com',
      password: 'password'
    }
  end

  before(:each) do 
    reset_chitter_table
  end
  
  describe 'POST /signup' do
    it 'creates a new user and sets the session user_id' do
      expect(UserRepository).to receive(:create).with(
        user_params[:name],
        user_params[:username],
        user_params[:email],
        user_params[:password]
      ).and_return('user_id')

      post '/signup', user_params

      expect(last_response).to be_redirect
      expect(last_response.location).to include('/profile')
      expect(last_request.session[:user_id]).to eq('user_id')
    end
  end

  describe 'POST /login' do
    let(:existing_user) { double('User', id: 'user_id') }

    before do
      allow(UserRepository).to receive(:authenticate).and_return(existing_user)
    end

    context 'with valid credentials' do
      it 'sets the session user_id and redirects to profile' do
        post '/login', email: user_params[:email], password: user_params[:password]

        expect(last_response).to be_redirect
        expect(last_response.location).to include('/profile')
        expect(last_request.session[:user_id]).to eq('user_id')
      end
    end

    context 'with invalid credentials' do
      before do
        allow(UserRepository).to receive(:authenticate).and_return(nil)
      end

      it 'redirects to login page' do
        post '/login', email: user_params[:email], password: user_params[:password]

        expect(last_response).to be_redirect
        expect(last_response.location).to include('/login')
        expect(last_request.session[:user_id]).to be_nil
      end
    end
  end

  describe 'GET /profile' do
    context 'when user is logged in' do
      let(:user) { double('User', id: 'user_id') }

      before do
        allow(UserRepository).to receive(:find).and_return(user)
        allow(PeepRepository).to receive(:find_by_user).and_return([])
        get '/profile', {}, { 'rack.session' => { user_id: 'user_id' } }
      end

      it 'renders the profile page' do
        expect(last_response).to be_ok
        expect(last_response.body).to include('Profile')
      end

      it 'assigns the user and peeps to the view' do
        expect(last_request.env['sinatra.template'].instance_variable_get(:@user)).to eq(user)
        expect(last_request.env['sinatra.template'].instance_variable_get(:@peeps)).to eq([])
      end
    end

    context 'when user is not logged in' do
      it 'redirects to login page' do
        get '/profile'
        expect(last_response).to be_redirect
        expect(last_response.location).to include('/login')
      end
    end
  end

  describe 'GET /logout' do
    it 'clears the session and redirects to login page' do
      get '/logout', {}, { 'rack.session' => { user_id: 'user_id' } }

      expect(last_response).to be_redirect
      expect(last_response.location).to include('/login')
      expect(last_request.session[:user_id]).to be_nil
    end
  end
end
require 'sinatra'
require 'sinatra/base'
require 'sinatra/reloader'
require './lib/database_connection'
require './lib/user_repository'

class SignupController < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    enable :sessions
    set :public_folder, 'public'
    set :views, 'views'
  end

  before do
  @user_repo = UserRepository.new
  end

  helpers do
    def current_user
      @current_user ||= @user_repo.find_by_id(session[:user_id]) if session[:user_id]
    end
  end

  get '/login' do
    email_address = params[:email_address]
    password_hash = params[:password_hash]
    user = @user_repo.find_by_email(email_address)
  
    if user && user.password_hash == password_hash
      # Store user ID in the session
      session[:user_id] = user.id
      
      redirect '/peeps'
    else
      erb :login
    end
  end
  
  get '/signup' do
    erb :signup
  end

  post '/signup' do
    new_user = User.new
    new_user.name = params[:name]
    new_user.username = params[:username]
    new_user.email_address = params[:email_address]
    new_user.password_hash = params[:password_hash]
    @user_repo.create(new_user)

    erb :signup
  end

  get '/logout' do
    erb :logout
  end

end

ENV["RACK_ENV"] ||= "development"

require './models/user'
require 'sinatra/base'
require './data_mapper_setup.rb'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  register Sinatra::Flash

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :index
  end

  get '/signup' do
    @user = User.new
    erb :signup
  end

  post '/users/new' do
    @user = User.create(username: params[:username], email: params[:email], name: params[:name], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to ('/welcome')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'/signup'
    end
  end

  get '/welcome' do
    erb :welcome
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end
end

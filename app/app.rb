ENV["RACK_ENV"] ||= "development"

require './models/user'
require 'sinatra/base'
require './data_mapper_setup.rb'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :index
  end

  get '/signup' do
    erb :signup
  end

  post '/users/new' do
    @user = User.create(username: params[:username], email: params[:email], name: params[:name], password: params[:password], password_confirmation: params[:password_confirmation])
    @user.save
    session[:user_id] = @user.id
    redirect to ('/welcome')
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

ENV["RACK_ENV"] ||= 'development'
require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative 'models/user'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :index
  end

  post '/users' do
    user = User.create(name: params[:name], username: params[:username], email: params[:email],
    password: params[:password], password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    redirect to ('/peeps')
  end

  get '/user/new' do
    erb :sign_up
  end

  get '/peeps' do
    'Peeps here!'
  end

  # creates a helper method that returns an instance of User for the currently logged-in user.
  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0
end

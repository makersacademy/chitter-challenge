require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'database_connection_setup'
require './lib/user'


class ChitterApp < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions, :method_override

  get '/' do
    @user = User.find(session[:user_id])
    erb :index
  end

  get '/users/sign_up' do
    erb :"users/sign_up"
  end

  post '/users' do
    user = User.create(username: params[:username], email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/'
  end

  run! if app_file == $PROGRAM_NAME
end



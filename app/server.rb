require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative './models/user'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'superbly secret'

  get '/' do
    erb :index
  end

  post '/users' do
    if User.first(email: params[:email])
      return "There is already a user with this email!"
    else
      User.create(email: params[:email],
                  name: params[:name],
                  password: params[:password],
                  username: params[:username])
      return "Welcome #{params[:name].split(' ').first}!"
    end
  end

  post '/sessions/new' do
    user = User.first(email: params[:returning_email])
    if user && user.password == params[:returning_password]
      session[:name] = user.name.split(' ').first
      "Welcome #{session[:name]}!"
    else
      "No user with those details!"
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME

end

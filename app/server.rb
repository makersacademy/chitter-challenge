require 'sinatra/base'
require 'rack-flash'
require_relative 'data_mapper_setup'
require_relative './models/user'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'superbly secret'
  use Rack::Flash

  get '/' do
    erb :index
  end

  post '/users' do
    user = User.new(email: params[:email],
                name: params[:name],
                password: params[:password],
                username: params[:username])
    if user.save
      "Welcome #{params[:name].split(' ').first}!"
    else
      flash.now[:errors] = user.errors
      erb :index
    end
  end

  post '/sessions/new' do
    user = User.first(email: params[:returning_email])
    if user && user.password == params[:returning_password]
      session[:name] = user.name.split(' ').first
      "Welcome #{session[:name]}!"
    else
      flash.now[:errors] = [["No user with those details!"]]
      erb :index
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME

end

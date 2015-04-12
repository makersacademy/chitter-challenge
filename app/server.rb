require 'sinatra/base'
require 'rack-flash'
require_relative 'data_mapper_setup'
require_relative './models/user'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'superbly secret'
  use Rack::Flash
  use Rack::MethodOverride

  get '/' do
    erb :index
  end

  post '/users' do
    user = User.new(email: params[:email],
                name: params[:name],
                password: params[:password],
                username: params[:username])
    if user.save
      flash.now[:announcement] = ["Welcome #{params[:name].split(' ').first}!"]
      session[:user] = user.id
      session[:name] = user.name.split(' ').first
      erb :index
    else
      flash.now[:errors] = user.errors
      erb :index
    end
  end

  post '/sessions/new' do
    user = User.first(email: params[:returning_email])
    if user && user.password == params[:returning_password]
      session[:user] = user.id
      session[:name] = user.name.split(' ').first
      flash.now[:announcement] = ["Welcome #{session[:name]}!"]
      erb :index
    else
      flash.now[:errors] = [["No user with those details!"]]
      erb :index
    end
  end

  delete '/sessions/:id' do
    session[:user] = nil
    session[:name] = nil
    flash[:announcement] = ["You have logged out!"]
    redirect '/'
  end

  post '/peep/new' do
    Peep.create(peep: params[:post_peep], user: User.first(id: session[:user]))
    erb :index
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME

end

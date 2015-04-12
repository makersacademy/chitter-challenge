require 'sinatra/base'
require 'rack-flash'
require_relative 'data_mapper_setup'
require_relative './models/user'
require_relative './session_helper'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'superbly secret'
  use Rack::Flash
  use Rack::MethodOverride
  include SessionHelper

  get '/' do
    erb :index
  end

  post '/users' do
    user = User.new(email: params[:email],
                    name: params[:name],
                    password: params[:password],
                    username: params[:username])
    if user.save
      create_session(user)
    else
      flash.now[:errors] = user.errors
    end
    erb :index
  end

  get '/users/:id' do
    @user = User.first(id: params[:id])
    @users_peeps = @user.peeps.all(order: [:id.desc])
    erb :profile_page
  end

  post '/sessions/new' do
    user = User.first(email: params[:returning_email])
    if user && user.password == params[:returning_password]
      create_session(user)
    else
      flash.now[:errors] = [["No user with those details!"]]
    end
    erb :index
  end

  delete '/sessions/:id' do
    session[:user], session[:name] = nil
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

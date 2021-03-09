require 'sinatra/base'
require 'sinatra/flash'
require 'uri'
require_relative './database_connection_setup'
require_relative './lib/peep'
require_relative './lib/user'
require_relative './session_helper'

class Chitter < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash
  include SessionHelper

  get '/' do
    erb :index
  end

  get '/peeps' do
    @user = current_user
    @peeps = Peep.all
    erb :peeps
  end

  get '/peeps/new' do
    @user = current_user
    @peeps = Peep.all
    erb :peep_new
  end

  post '/peeps' do
    Peep.create(
      fullname: current_user.fullname,
      username: current_user.username,
      content: params[:content])
    redirect '/peeps'
  end

  get '/users/new' do
    erb :'users_new'
  end

  post '/users' do
    user = User.create(email: params['email'],
      password: params['password'],
      fullname: params['fullname'],
      username: params['username'])
    session[:user_id] = user.id
    redirect '/peeps'
  end

  get '/sessions/new' do
    erb :'sessions_new'
  end

  post '/sessions' do
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash[:notice] = 'Please check your email or password'
      redirect '/sessions/new'
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out'
    redirect '/peeps'
  end

  run! if app_file == $0
end

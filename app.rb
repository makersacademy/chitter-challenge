require 'sinatra/base'
require 'sinatra/flash'
require './lib/peep'
require './lib/user'
require 'pg'
require './database_connection_setup'

class Peeps < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :"welcome/index"
  end

  get '/peeps' do
    @current_user = User.find(id: session[:user_id])
    redirect '/' if @current_user.nil?
    @peeps = Peep.all
    erb :"peeps/index"
  end

  post '/peeps' do
    Peep.create(message: params[:message], user_id: session[:user_id])
    redirect '/peeps'
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password], handle: params[:handle])
    session[:user_id] = user.id
    redirect '/peeps'
  end

  get '/sessions/new' do
    erb :"sessions/new"
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
    flash[:notice] = 'Successfully signed out'
    redirect '/'
  end

  run if app_file == $0
end

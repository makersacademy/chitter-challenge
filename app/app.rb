require 'sinatra/base'
require 'sinatra/flash'
require './app/lib/peep'
require_relative 'database_connection_setup'
require './app/lib/user.rb'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    redirect('/peeps')
  end

  get '/peeps' do
    @user = User.find(session[:user_id])
    @peeps = Peep.all
    erb :index
  end

  get '/peeps/new' do
    erb :"peeps/new"
  end

  post '/peeps' do
    Peep.create(peep: params['peep'])
    redirect('/peeps')
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    user = User.create(email: params['email'], password: params['password'], name: params['name'], username: params['username'])
    session[:user_id] = user.id
    redirect('/peeps')
  end

  get '/sessions/new' do
    erb :"sessions/new"
  end

  post '/sessions' do
    user = User.authenticate(params['email'], params['password'])
    if user
      session[:user_id] = user.id
      redirect('/peeps')
    else
      flash[:notice] = 'Please check your email or password'
      redirect('/sessions/new')
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = "You have signed out"
    redirect('/peeps')
  end

  run! if app_file == $0
end

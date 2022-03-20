require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require './database_connection_setup'
require_relative './lib/peep'
require_relative './lib/user'


class ChitterApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :'homepage/homepage'
  end

  get '/peeps' do
    @user = User.find(session[:user_id])
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peep/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(peep: params[:peep], user_id: session[:user_id])
    redirect('/peeps')
  end

  post '/peep/new' do
    erb :'peeps/new'
   end

  get '/user/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(
      email: params[:email], 
      password: params[:password], 
      name: params[:name], 
      username: params[:username]
      )
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
      redirect('/peeps')
    else 
      flash[:notice] = 'Please check your email or password.'
      redirect('/sessions/new')
    end
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect('/sessions/new')
  end

  run! if app_file == $0
end

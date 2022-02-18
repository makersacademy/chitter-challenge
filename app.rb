# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require './database_connection_setup'
require './lib/peep'
require './lib/user'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  get '/chitter' do
    @user = User.find(session[:user_id])
    @peeps = Peep.all_in_time_order
    session[:user_email] = @user.email

    erb :index
  end

  post '/chitter' do
    Peep.create_peep(params['peep'], session[:user_email])

    redirect '/chitter/refresh'
  end

  get '/chitter/refresh' do
    Peep.populate_peeps

    redirect '/chitter'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users/new' do
    @user = User.create(params['email'], params['password'])
    session[:user_id] = @user.id

    redirect '/chitter'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    @user = User.authenticate(params['email'])
    session[:user_id] = @user.id
    redirect '/chitter'
  end
end

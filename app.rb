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

    erb :index
  end

  post '/chitter' do
    @user = User.find(session[:user_id])
    Peep.create_peep(params['peep'], @user.email)

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
end

# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/reloader'
require './database_connection_setup'
require './lib/peep'
require './lib/user'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    register Sinatra::Flash
  end

  enable :sessions

  before do
    @user = User.find(session[:user_id])
  end

  get '/chitter' do
    @peeps = Peep.all_in_time_order

    erb :index
  end

  post '/chitter/:email/new' do
    Peep.create_peep(params['peep'], params['email'])

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
    @user = User.authenticate(params['email'], params['password'])

    if @user.id
      session[:user_id] = @user.id
      redirect '/chitter'
    else
      flash[:notice] = 'Please check your email or password.'
      redirect '/sessions/new'
    end
  end

  get '/sessions/destroy' do
    session.clear

    redirect '/chitter'
  end
end

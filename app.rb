# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require './database_connection_setup'
require './lib/peep'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions

  get '/chitter' do
    @email = session[:email]
    @peeps = Peep.all_in_time_order

    erb :index
  end

  post '/chitter' do
    Peep.create_peep(params['peep'], session[:email])

    redirect '/chitter'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users/new' do
    session[:email] = params['email']
    session[:password] = params['password']

    redirect '/chitter'
  end
end

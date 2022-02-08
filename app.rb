# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require './database_connection_setup'
require './lib/peeps_manager'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/chitter' do
    @peeps = PeepsManager.new.all_in_time_order

    erb :index
  end

  post '/chitter' do
    PeepsManager.new.create_peep(params['peep'])

    redirect '/chitter'
  end

  get '/users/new' do
    erb :'users/new'
  end
end

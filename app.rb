# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require_relative './database_connection_setup'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/chitter/new' do
    erb :'chitter/new'
  end

  post '/chitter/new' do
    "#{params['peep']}"
  end
end

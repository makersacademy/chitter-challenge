require 'sinatra/base'
require_relative './lib/Chitter'
require './database_connection_setup'

class Chitter < Sinatra::Base
  get '/chitter' do
    erb (:index)
  end

  run! if app_file == $0
end

require 'sinatra/base'
require_relative './database_connection_setup.rb'

class Chitter < Sinatra::Base

  get '/' do
    'Chitter'
  end

  run! if app_file == $0
end

ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/' do
    @peep = params[:peep]
  end

  run! if app_file == $0
end

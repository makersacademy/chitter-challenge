ENV["RACK_ENV"] ||= 'development'

require 'sinatra/base'
require 'data_mapper'
require './app/data_mapper_setup'

class Chitter < Sinatra::Base

  get '/' do
    erb: index
  end

  run! if app_file == $0
end

ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require './app/models/data_mapper_setup'
require './app/models/peep'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end


run! if app_file == $0

end

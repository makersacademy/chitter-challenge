ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative './lib/peep'
require './config/datamapper'
require 'pry'
require_relative 'data_mapper'

class Chitter < Sinatra::Base
  set :sessions, true


  # get '/' do
  #   erb :index
  # end
  #

  run! if app_file == $0

end

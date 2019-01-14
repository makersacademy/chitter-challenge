ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative './lib/user'
require_relative './lib/peep'
require './config/data_mapper'
require 'pry'

class Chitter < Sinatra::Base
  set :sessions, true


  # get '/' do
  #   erb :index
  # end
  #

  run! if app_file == $0

end

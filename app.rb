ENV['RACK_ENV'] ||= 'development'

require './config/data_mapper'
require 'sinatra/base'
require 'pry'

class Chitter < Sinatra::Base
  
  enable :sessions
  enable :method_override

end

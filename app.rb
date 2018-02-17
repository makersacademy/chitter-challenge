require 'sinatra/base'
require 'sinatra/flash'
require_relative 'lib/cheet'
require 'rubygems'
require 'data_mapper'
require_relative 'database_connection_setup'

class Chitter < Sinatra::base
  register Sinatra::Flash
  enable :sessions


end

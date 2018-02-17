require 'sinatra/base'
require 'sinatra/flash'
require_relative 'lib/cheet'
require 'rubygems'
require 'data_mapper'

class Chitter < Sinatra::base
  register Sinatra::Flash
  enable :sessions

end

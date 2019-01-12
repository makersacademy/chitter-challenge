ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
# require './lib/chitter'
# require './config/data_mapper'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    "Is this thing on?"
  end

end

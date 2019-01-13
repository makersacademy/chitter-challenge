ENV['RACK_ENV'] = 'development'

require 'pry'
require 'sinatra/base'
require './config/data_mapper'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    "Hello World"
  end

end

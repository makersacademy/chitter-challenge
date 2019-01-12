ENV['RACK_ENV'] = 'development'

require './config/data_mapper'
require 'pry'
require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions
  enable :method_override

  get '/' do
    erb :index
  end
end

ENV['RACK_ENV'] = 'development'

require 'pry'
require 'sinatra/base'
require './config/data_mapper'

class Chitter < Sinatra::Base
  enable :sessions
  enable :method_override

  get '/' do
    erb :index
  end
end

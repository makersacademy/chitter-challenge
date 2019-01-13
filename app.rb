ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './lib/message'
require './config/data_mapper'


class Chitter < Sinatra::Base
  enable :sessions
  enable :method_override

  get '/' do
    erb :index
  end

end

ENV['RACK_ENV'] = 'development'

require 'pry'
require 'sinatra/base'
require './config/datamapper'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    "Hello World"
  end

end

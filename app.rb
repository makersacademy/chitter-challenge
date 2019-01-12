require 'sinatra/base'
require './lib/user'
require './config/data_mapper'
require 'pry'

class Chitter < Sinatra::Base
  ENV['RACK_ENV'] ||= 'development'

  enable :sessions
  enable :method_override

  get '/' do
    erb :index
  end

  run! if app_file == $0
end

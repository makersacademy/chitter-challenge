ENV["RACK_ENV"] ||= 'development'

require 'data_mapper'
require 'pry'
require 'sinatra/base'

load './config/datamapper_setup.rb'

class Chitter < Sinatra::Base
  enable :sessions
  set :method_override, true

  get '/' do
    erb :index
  end

  run! if app_file == $0
end

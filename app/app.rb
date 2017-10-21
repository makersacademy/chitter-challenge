 ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_set_up'

class Chitter < Sinatra::Base

  get '/' do
    @chits = Chit.all
    erb(:index)
  end
  
  run! if app_file == $0
end

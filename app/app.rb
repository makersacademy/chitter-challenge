require 'sinatra/base'
require './app/data_mapper_setup'

class Chitter < Sinatra::Base

  run! if app_file == $PROGRAM_NAME

  get '/' do
    erb :index
  end

end

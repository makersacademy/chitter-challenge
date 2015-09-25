require 'sinatra/base'
require './app/data_mapper_setup'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

end

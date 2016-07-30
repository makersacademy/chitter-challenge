require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  get '/' do
    @messages = Message.all
    erb :'homepage'
  end

  run! if app_file == $0
end

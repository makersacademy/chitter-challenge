require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  get '/' do
    @messages = Message.all
    erb :'homepage'
  end

  post '/' do
    message = Message.new(message: params[:message])
    message.save
    redirect to '/'
  end

  run! if app_file == $0
end

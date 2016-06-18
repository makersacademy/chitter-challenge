ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative 'models/message'

class Chitter < Sinatra::Base
  get '/' do
    erb(:'index')
  end

  get '/messages' do
    @messages = Message.all
    erb(:'messages/index')
  end

  get '/messages/new' do
    erb :'messages/new'
  end

  post '/messages' do
    Message.create(message: params[:message])
    redirect '/messages'
  end

  run! if app_file == $0
end

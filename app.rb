require 'sinatra/base'
require './lib/message'

class Chitter < Sinatra::Base
  get '/' do
    'Chitter'
  end

  get '/messages' do
    @messages = Message.all
    erb :'messages/index'
  end

  get '/messages/new' do
    erb :'messages/new'
  end

  post '/messages' do
    Message.create(message: params['message'])
    redirect '/messages'
  end

  run if app_file == $0
end

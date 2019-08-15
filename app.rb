require 'sinatra/base'
require './lib/chat.rb'

class Chitter < Sinatra::Base
  get '/' do
    "Hello Chitter"
  end

  get '/messages' do

    @messages = Chat.all
    erb :'/messages/index'

  end

  get '/messages/new' do
    erb :'messages/new'
  end

  post '/messages' do
    Chat.create(text: params[:text])
    redirect '/messages'
  end


  run! if app_file == $0
end
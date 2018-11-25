require 'sinatra'
require './lib/message'


class ChitterChatter < Sinatra::Base

  get '/messages' do
    @messages = Message.all
    erb :'messages/index'
  end

  get '/messages/new' do
    erb :'messages/new'
  end

  post '/messages' do
    Message.add(title: params[:message_title], body: params[:message_body])
    redirect '/messages'
  end


  run! if app_file == $0
end
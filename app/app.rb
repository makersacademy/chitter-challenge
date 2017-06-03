require 'sinatra/base'
require './app/datamapper_setup'

class Chitter < Sinatra::Base

  get '/messages' do
    @messages = Message.all
    erb :index
  end

  get '/messages/new' do
    #message = Message.all
    erb :post_message
  end

  post '/messages' do
    message = Message.create(content: params[:content])
    message.save
    redirect '/messages'
  end

end

require 'sinatra/base'
require './lib/message'

class Chitter < Sinatra::Base

  get '/' do
    'Hello'
  end

  get '/messages/new' do
    erb :'messages/new'
  end

  post '/messages/new' do
    Message.post(text: params[:message])
    redirect '/messages'
  end

  get '/messages' do
    @messages = Message.all
    erb :'messages/index'
  end

end

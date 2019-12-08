require 'sinatra/base'
require './lib/message'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/messages' do
    @messages = Message.all
    erb :messages
  end

  get '/messages/new' do
    erb :"messages/new"
  end

  post '/messages/new' do
    Message.create(msg: params['msg'])
    redirect :messages
  end

  run! if app_file == $0

end
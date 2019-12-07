require 'sinatra/base'
require './lib/message'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/message' do
    @messages = Message.all
    erb :message
  end

  get'/messages/new' do
    erb :"messages/new"
  end

  run! if app_file == $0

end
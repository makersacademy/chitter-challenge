require 'sinatra/base'
require 'pg'
require './lib/message'
require './database_connection_setup'

class Chitter < Sinatra::Base

  get '/chitter' do
    @messages = Message.all
    erb :'chitter/index'
  end

  post '/chitter/create' do
    Message.create(text: params[:text])
    redirect '/chitter'
  end
end

require 'sinatra/base'
require_relative './lib/message'
require './database_connection_setup'

class Chitter < Sinatra::Base

  get '/' do
    @messages = Message.all
    p @messages
     erb(:'index')
  end

  post '/new_post' do
    Message.create(text: params[:text])
    redirect '/'
  end
end
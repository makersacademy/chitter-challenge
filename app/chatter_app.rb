require 'sinatra/base'
require './lib/chat.rb'
require './lib/database_connection.rb'

class Chatter < Sinatra::Base

  get '/' do
    @chats = Chat.all
    erb(:index)
  end

  post '/add' do
    Chat.add(params[:text])
    redirect '/'
  end

  run! if app_file == $PROGRAM_NAME
end

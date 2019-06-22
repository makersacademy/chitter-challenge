require 'sinatra/base'
require './lib/message'

class Chitter < Sinatra::Base

  enable :sessions

  get '/messages' do
    @messages = Message.all
    erb(:view_messages)
  end

  get '/messages/new' do
    erb(:new_message)
  end

  post '/messages' do
    Message.create(user_message: params[:message])
    redirect '/messages'
  end

  run! if app_file ==$0

end

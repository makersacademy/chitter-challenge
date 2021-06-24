require 'sinatra/base'
require 'sinatra/reloader'
require './lib/message.rb'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :session
  

  get '/' do
    redirect '/messages'
  end

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
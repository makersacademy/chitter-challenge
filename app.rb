require 'sinatra'
require 'sinatra/reloader'
require './lib/message'
require 'pg'
require_relative 'database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader 
  end

  get '/' do
    'Hello World'
  end

  get '/messages' do
    @messages = Message.all
    erb :'messages/index'
  end

  post '/messages/post' do
    Message.post(params[:content])
    redirect '/messages'
  end

  run! if app_file == $0

end
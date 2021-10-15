require 'sinatra/base'
require 'sinatra/reloader'
require './lib/message.rb'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    @messages = Message.all
    erb :index
  end

  post '/' do
    Message.add(username: params[:username], content: params[:message])
    redirect('/')
  end

  run! if app_file == $0
end
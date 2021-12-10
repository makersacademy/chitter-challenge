require 'sinatra/base'
require 'sinatra/reloader'
require './lib/message'

class Chitter < Sinatra::Base 
  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  post '/post_message' do
    Message.add(params[:message])
    redirect '/home'
  end

  get '/home' do
    @message = Message.view
    erb :messages
  end

  run! if app_file == $0
end

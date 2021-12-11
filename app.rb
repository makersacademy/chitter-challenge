require 'sinatra/base'
require 'sinatra/reloader'
require './lib/message'
require './database_connection_setup'

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
    p @peeps = Message.view_all
    erb :messages
  end

  run! if app_file == $0
end

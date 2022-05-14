require 'sinatra'
require 'sinatra/reloader'
require './lib/message'

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

  run! if app_file == $0

end
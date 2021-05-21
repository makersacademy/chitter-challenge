require 'sinatra/base'
require 'sinatra/reloader'
require './lib/message.rb'

class Chitter < Sinatra::Base
  enable :sessions
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Welcome to chitter'
  end

  get '/chitter' do
    @messages = Message.all
    erb(:'chitter/index')
  end

  get '/chitter/new' do
    erb(:'chitter/new')
  end

  post '/chitter' do

    redirect ('/chitter')
  end
  
end
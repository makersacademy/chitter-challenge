require 'sinatra/base'
require 'sinatra/reloader'
require './lib/message.rb'

class Chitter < Sinatra::Base
  enable :sessions
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb(:'/chitter/home')
  end

  get '/chitter' do
    @messages = Message.all
    erb(:'/chitter/index')
  end

  get '/chitter/new' do
    erb(:'/chitter/new')
  end

  post '/chitter' do
    Message.create(params[:text])
    redirect ('/chitter')
  end
  
end
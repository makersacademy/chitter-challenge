require 'sinatra/base'
require 'sinatra/reloader'
require './lib/message.rb'
require 'time'
require './database_connection_setup.rb'

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
    @time_stamp = Time.now.strftime("%k:%M %d/%m/%Y")
    Message.create(params[:text], params[:user_name], @time_stamp)
    redirect ('/chitter')
  end
  
end
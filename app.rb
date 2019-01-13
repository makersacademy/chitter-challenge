ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './config/data_mapper'
require 'pry'

class Chitter < Sinatra::Base

  enable :sessions
  enable :method_override

  get '/' do 
    @messages = Message.all
    erb :index
  end 

  post '/messages' do 
    Message.create(content: params[:content])
    redirect '/'
  end

  get '/messages/:id' do 
    @message = Message.get(params[:id])
    erb :messages
  end

  get '/signup' do 
    erb :signup
  end


end

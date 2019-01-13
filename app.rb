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

  post '/signup' do 
    user = User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    redirect '/signin'
  end

  get '/signin' do 
    erb :signin
  end



end

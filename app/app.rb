require 'sinatra/base'
require './lib/DBTools.rb'

class Chitter < Sinatra::Base 
  get '/' do 
    'hello'
  end 

  get '/home' do 
    @messages = DBTools.all
    erb(:home)
  end 

  post '/home' do 
    user_name = params[:user_name]
    message = params[:message]
    # timestamp = params[:timestamp]
    DBTools.insert(user_name, message)
    redirect '/home'
  end

  get '/signup' do 
    erb(:signup)
  end

  run! if app_file == $0
end

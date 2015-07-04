require 'sinatra/base'
require './app/data_mapper_setup.rb'

class Chitter < Sinatra::Base
  
  get '/' do 
    'Chitter-Challenge'
    erb :'index'
  end

  get '/user/new' do
    erb :'user/new'
  end

  post '/main' do
    erb :'/main'
  end


 
#   # post '/user' do 
#   #   user = User.new
#   #   user.name = params[:name]
#   #   user.email = params[:email]

#   #   erb :'/user/new'
#   # end

 
#   # start the server if ruby file executed directly
#   run! if app_file == $0


 end

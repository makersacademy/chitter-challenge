require 'sinatra/base'
require './app/data_mapper_setup.rb'
require './app/models/user'

class Chitter < Sinatra::Base
  
# set :views, proc { File.join(root, '..', 'views') 
  
  get '/' do 
    erb :'index'
  end

  get '/user/new' do
    erb :'user/new'
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

require 'sinatra/base'
require 'sinatra/activerecord'
require './lib/user'

class Chitter < Sinatra::Base

  get '/' do 
    erb(:index)
  end

  get '/signup' do
    erb(:signup)
    
  end

  post '/signup' do
    user = User.create({firstname: params[:firstname], surname: params[:surname], email: params[:email], password: params[:password]})
  end

end
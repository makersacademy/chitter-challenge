ENV['RACK_ENV'] = 'development'
require 'sinatra/base'
require './models/data_mapper_setup.rb'

class Chitter < Sinatra::Base

  get '/' do
    redirect 'users/new'
  end

  get '/users/new' do
    erb :'user/new'
  end

  post '/users' do
    User.create(user_name: params[:user_name],
    name: params[:name],
    email: params[:email],
    password: params[:password])
    redirect to('/peeps')
  end

  get '/peeps' do
    erb :'/welcome'
  end



# start the server if ruby file executed directly
run! if app_file == $0
end

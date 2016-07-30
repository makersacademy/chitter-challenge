require 'sinatra/base'

require_relative'data_mapper_setup'
class Chitter < Sinatra::Base

  get '/users' do
    erb :'users/new'
  end

  post '/users/new' do
    user = User.create(email: params[:email], password: params[:password],
    username: params[:username],
    name: params[:name] )

  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

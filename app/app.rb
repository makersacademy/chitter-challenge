require 'sinatra/base'
require './app/data_mapper_setup'
class Chitter < Sinatra::Base
  get '/user/new' do
    erb :'sessions/new'
  end

  post '/users' do
    @current_user = User.create(username: params[:username],
                email: params[:email])
    erb :index
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

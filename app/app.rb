require 'sinatra/base'
require './app/data_mapper_setup'
class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    erb :index
  end

  get '/user/new' do
    erb :'sessions/new'
  end

  post '/users' do
    user = User.create(username: params[:username],
                email: params[:email])
    session[:user_id] = user.id
    redirect to('/')
  end

  def current_user
    User.get(session[:user_id])
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

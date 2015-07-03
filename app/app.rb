require 'sinatra/base'
require './app/data_mapper_setup'
require 'sinatra/flash'
class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/user/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(username: params[:username],
                email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      redirect to('/')
    else
      flash.now[:notice] = "Passwords do not match"
      erb :'/users/new'
    end
  end

  def current_user
    User.get(session[:user_id])
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

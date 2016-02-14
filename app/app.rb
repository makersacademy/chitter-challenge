ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative 'models/chitter'
require 'sinatra/flash'


class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  register Sinatra::Flash

  get '/chits' do
    @chits = Chit.all
    erb :'chits/index'
  end

  get '/chits/new' do 
    erb :'chits/new'
  end

  post '/chits' do
    Chit.create(chitter_post: params[:chitter_post], user: params[:user])
    redirect to('/chits')
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(email: params[:email],
                     password: params[:password], 
                     password_confirmation: params[:password_confirmation])

    if @user.save # #save returns true/false depending on whether the model is successfully saved to the database.
      session[:user_id] = @user.id
      redirect to('/chits')
    # if it's not valid,
    # we'll render the sign up form again
    else
      flash.now[:notice] = "Password and confirmation password do not match"
      erb :'users/new'
    end
  end

  helpers do
    def current_user
   @current_user ||= User.get(session[:user_id])
  end


  run! if app_file == $0
end
end
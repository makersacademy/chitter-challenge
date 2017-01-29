ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'

class Chitter < Sinatra::Base

  register Sinatra::Flash

  enable :sessions
  set :session_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
      # defining the current user as whomever is in the session
    end
  end

  get '/' do
    redirect 'sign_up'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(email: params[:email],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation],
                        name: params[:name],
                        user_name: params[:user_name])
     #setting the session equal to the user id, so that they stay logged in.
    #session equal to user id, NOT THE OTHER WAY AROUND
    if @user.save #the save method returns a boolean depending on whether the instance of user is saved.
      session[:user_id] = @user.id
      redirect to('/peeps')
    else
      flash.now[:notice] = 'Passwords do not match!'
      erb :'users/new'
    end
    #   session[:user_id] = @user.id
    #   redirect to('/peeps')
    # else
    #   flash.now[:notice] = "Passwords do not match"
  end

  get '/peeps' do
    erb :peeps
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
    else
      flash.now[:errors] = ["Incorrect email or password"]
      erb :'sessions/new'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  run! if app_file == $0

end

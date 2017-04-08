ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash


  get '/users/new' do #sign up
    # @user = User.new
    erb :'users/new'
  end

  post '/users' do # user goes to this page after signing up
    @user = User.create(email: params[:email],
                     password: params[:password],
                     password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to "/hub"
    else
      flash.now[:notice] = "Password does not match the confirmation"
      erb :'users/new'
    end
  end

  get '/hub' do
    erb :hub
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

end
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
    end
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    @user = User.create(email: params[:email],
              password: params[:password],
              password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/peeps')
    else
      flash.now[:notice] = "Password and confirmation password do not match"
      erb :signup
    end
  end

  get '/peeps'  do
    erb :peeps
  end

  run! if app_file == $0
end

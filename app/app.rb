# ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
# require_relative 'data_mapper_setup'
# require 'sinatra/flash'

class Kitter < Sinatra::Base
  enable :sessions
  # set :session_secret, 'super secret'
  # register Sinatra::Flash
  #
  # helpers do
  #   def current_user
  #     @current_user ||= User.get(session[:user_id])
  #   end
  # end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(email: params[:email],
                      username: params[:username]
                      password: params[:password],
                      password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/meows'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end

  run! if app_file == $0
end

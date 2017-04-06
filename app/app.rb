ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require_relative 'models/user'

class Chitter < Sinatra::Base
  enable :sessions
  set    :session_secret, 'super secret'
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/peeps' do
    @user = User.first
    erb :'peeps/index'
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
    if @user.save
      session[:user_id] = @user.id
      redirect '/peeps', 303
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  run! if app_file == $0

end

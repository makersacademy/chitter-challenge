require_relative 'data_mapper_setup'
require 'sinatra/base'
require 'sinatra/flash'

class Chitter < Sinatra::Base 

  enable :sessions
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id]) if session[:user_id]  
    end
  end

  get '/' do
    erb :feed
  end

  get '/sessions/sign_up' do
    @signing_up = true
    erb :'sessions/new_user'
  end

  post '/sessions/sign_up' do
    @user = User.create(username: params[:username],
                        email: params[:email],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect('/')
    else
      flash[:errors] = @user.errors.full_messages
      erb :'sessions/new_user'
    end
  end

  run! if app_file == $0
end

require 'sinatra/base'
require 'sinatra/flash'

ENV['RACK_ENV'] ||= 'development'

require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    erb :index
  end

  get '/signup' do
    erb :signup
  end

  post '/profile' do
    @user = User.new(username: params[:username], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect('/profile')
    else
      flash.now[:message] = "Passwords do not match"
      erb :signup
    end
  end

  get '/profile' do
    erb :profile
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

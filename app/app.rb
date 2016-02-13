ENV['RACK_ENV'] = 'development'
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super-secret'
  register Sinatra::Flash

  get '/' do
    erb(:index)
  end

  get '/sign-up' do
    @user = User.new
    erb(:sign_up)
  end

  post '/sign-up' do
    @user = User.new(
      name: params[:name],
      username: params[:username],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if @user.save 
      session[:user_id] = user.id
      redirect '/home'
    else
      flash.now[:notice] = "Passwords do not match"
      erb :sign_up
    end
  end

  get '/home' do
    erb :home
  end

  helpers do
    def current_user
      @current_user = User.get(session[:user_id]) 
    end
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end

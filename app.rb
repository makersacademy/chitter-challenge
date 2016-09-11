ENV["RACK_ENV"]  ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class ChitterApp < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    'Hello ChitterApp!'
  end

  get '/users/new' do
    @user = User.new
    erb :'/users/new'
  end

  post '/users/new' do
    @user = User.create(username: params[:username],
                        email: params[:email],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/timeline'
    else
      flash.now[:error] = "Error"
      erb :'/users/new'
    end
  end

  get '/timeline' do
    erb :timeline
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end

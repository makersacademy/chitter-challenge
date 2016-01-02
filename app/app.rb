ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require_relative 'models/data_mapper_setup'

class Chitter < Sinatra::Base
  register Sinatra::Flash
  register Sinatra::Partial

  enable :sessions
  enable :partial_underscores

  set :session_secret, "secret message"
  set :partial_template_engine, :erb

  get '/' do
    erb :index
  end

  get '/users/new' do
    @user = User.new
    erb :'/users/new'
  end

  post '/users' do
    @user = User.create(email: params[:email],
                      password: params[:password],
                      password_confirmation: params[:password_confirm])
    if @user.save
      session[:user_id]=@user.id
      redirect '/'
    else
      flash.now[:error]=@user.errors.full_messages
      erb :'/users/new'
    end
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end

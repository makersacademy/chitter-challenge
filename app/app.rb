require 'sinatra/base'
require './app/data_mapper_setup'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'potato'
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/signup' do
    @user = User.new
    erb :signup
  end

  post '/signup' do
    @user = User.create(username: params[:username],
                        password: params[:password],
                        password_confirmation: params[:password_check],
                        email: params[:email],
                        name: params[:name])
    if @user.save
      session[:user_id] = @user.id
      redirect :home
    else
      @error = true
      erb :signup
    end
  end


  get '/login' do
    redirect :home
  end

  get '/index' do
    erb :index
  end

  get '/home' do
    erb :home
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end

    def time_now
      @time_now = Time.now.strftime("%I:%M:%S")
    end
  end

  run! if app_file == $PROGRAM_NAME
end

ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
$LOAD_PATH << "#{Dir.pwd}"
require 'app/data_mapper_setup'
require 'sinatra/flash'

class ChitterApp < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/user_sign_up' do
    @user = User.new
    erb :user_sign_up
  end

  post '/create_user' do
    @user = User.new(username: params[:username],
                      email: params[:email],
                      password: params[:password],
                      password_confirmation: params[:password_confirmation])
    if @user.save
      session[:id] = @user.id
      redirect '/welcome'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :user_sign_up
    end
  end

  get '/welcome' do
    @user = User.last(session[:id])
    erb :welcome
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:id])
    end
  end

  get '/user_log_in' do
    erb :user_log_in
  end

  post '/user_log_in' do
    redirect '/welcome'
  end

  run! if app_file == $0

end

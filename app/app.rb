ENV['RACK_ENV'] ||= 'development'
require_relative 'data_mapper_setup'
require 'sinatra/base'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super_secret'

  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||=User.get(session[:user_id])
    end
  end

  get '/' do
    erb :index
  end

  get '/sign_up' do
    erb :sign_up
  end

  get '/chitters' do
    erb :chitters
  end

  post '/chitters' do
    @user = User.new(name: params[:name], email: params[:email], password: params[:passsword], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/chitters')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :sign_up
    end
  end

  get '/log_in' do
    erb :log_in
  end

  post '/sessions' do
    @user = User.authenticate(params[:email], params[:password])
  if @user
    session[:user_id] = @user.id
    redirect to('/')
  else
    flash.now[:errors] = ['The email or password is incorrect']
    erb :log_in
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'data_mapper'
require 'sinatra/flash'
require_relative 'datamapper_setup'

class Chitter < Sinatra::Base
  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'super secret'
  use Rack::MethodOverride

  get '/' do
    erb :index
  end

  get '/signup' do
    @user = User.new
    erb :'/users/new'
  end

  post '/signup' do
    @user = User.new(email: params[:email], user_name: params[:user_name],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    if @user.save
      flash.keep[:message] = 'Thank you for signing up, please sign in to continue'
      redirect '/'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'/users/new'
    end
  end

  get '/signin' do
    erb :'/users/signin'
  end

  post '/session' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/peeps')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'/users/signin'
    end
  end

  get '/peeps' do
    erb :index
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:message] = 'signed out!'
    redirect to('/')
  end


  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end

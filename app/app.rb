require 'sinatra/base'
require 'sinatra/flash'
require_relative 'models/user'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  get '/' do
    'Hello Chitter! please go to signup'
  end

  get '/signup' do
    erb :signup_page
  end

  post '/users' do
    @user = User.create(user_email: params[:user_email], password: params[:password], password_confirmation: params[:password_confirmation], user_full_name: params[:user_full_name], user_name: params[:user_name])
    if @user.save
        # session[:user_id] = user.id
        session[:id] = @user.id
        redirect to('/welcome')
      else
        flash.now[:errors] = @user.errors.full_messages
        erb :signup_page
      end
  end

  get '/welcome' do
    erb :welcome_page
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:id])
    end
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end

ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'

require_relative 'datamapper_setup'

EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

class Chitter < Sinatra::Base

  enable :sessions
  set    :session_secret, 'super secret'

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
    if session[:email].nil?
      erb :'signup'
    else
      @email = session[:email]
      erb :'signup'
    end
  end

  post '/registration' do
    user = User.new(name: params[:name],
                    email: params[:email],
                    password: params[:password],
                    password_confirmation: params[:confirm_password])
    if user.save
      session[:user_id] = user.id
      redirect '/chat'
    else
      flash[:mismatch] ='Password and confirmation password do not match' if params[:password] != params[:confirm_password]
      flash[:missing_email] = 'No email entered' if params[:email].empty?
      flash[:invalid_email] = 'Invalid email entered' if !(params[:email] =~ EMAIL_REGEX)
      flash[:duplicate_email] = 'This email is already in use'
      session[:email] = params[:email]
      redirect '/signup'
    end
  end

  get '/chat' do
    @user  = current_user
    erb :chat
  end

  run! if app_file == $0
end

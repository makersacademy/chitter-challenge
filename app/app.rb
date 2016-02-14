ENV['RACK_ENV'] ||= 'development'

require_relative 'data_mapper_setup.rb'
require 'sinatra/base'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  use Rack::Session::Pool, :expire_after => 4000000
  set :session_secret, 'super secret'
  register Sinatra::Flash

  get '/home' do
    erb :home
  end


  get '/home/sign-up' do
    @user = User.new
    erb :signup
  end

  post '/home/sign-up' do
    @user = User.create(name: params[:name],
                        username: params[:username],
                        email: params[:email],
                        password: params[:password],
                        password_confirmation: params[:confirm_password])
    if @user.save
      session[:user_id] = @user.id
      redirect '/home'
    else
      flash.now[:errors] = @user.errors.full_messages # "Password and confirmation password don't match"
      erb :signup
    end
  end

  get '/home/log-in' do
    @user = User.new
    erb :login
  end

  post '/home/log-in' do
    user = User.authenticate(params[:username_or_email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/home'
    else
      flash.now[:errors] = 'Username or password is incorrect.'
      erb :login
    end
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0
end

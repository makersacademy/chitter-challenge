ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require_relative 'models/data_mapper_setup'
require 'byebug'

class Chitter < Sinatra::Base
  register Sinatra::Flash
  register Sinatra::Partial

  use Rack::MethodOverride

  enable :sessions
  enable :partial_underscores

  set :session_secret, "secret message"
  set :partial_template_engine, :erb

  get '/' do
    @peeps = Peep.all
    erb :'/peeps/index'
  end

  get '/users/new' do
    @user = User.new
    erb :'/users/new'
  end

  post '/users' do
    @user = User.create(name: params[:name],
                      username: params[:username],
                      email: params[:email],
                      password: params[:password],
                      password_confirmation: params[:password_confirm])
    if @user.id
      session[:user_id]=@user.id
      redirect '/'
    else
      flash.now[:error]=@user.errors.full_messages
      erb :'/users/new'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id]=user.id
      flash.next[:success]='You are now logged in.'
      redirect '/'
    else
      flash.now[:notice]='The email or password was incorrect'
      erb :'/sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice]='You are now signed out'
    redirect to '/'
  end

  post '/peeps' do
    peep = Peep.create(message: params[:peep], user: current_user)
    current_user.peeps << peep
    current_user.save
    redirect to '/'
  end

  get '/users/recover' do
    erb :'/users/recover'
  end

  post '/users/recover' do
    user = User.first(email: params[:email])
    if user
      user.generate_token
    end
    flash.next[:notice]="Please check your inbox to set a new password."
    redirect '/'
  end

  get '/users/reset_password' do
    @user = User.find_by_valid_token(params[:token])
    if(@user)
      erb :'users/reset_password'
    else
      "Your token is invalid"
    end
  end

  patch '/users' do
    user = User.find_by_valid_token(params[:token])
    user.update(password: params[:password],
                        password_confirmation: params[:password_confirmation])
    redirect '/sessions/new'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end

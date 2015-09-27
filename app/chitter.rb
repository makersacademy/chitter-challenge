require './app/data_mapper_setup'
require 'securerandom'
require 'sinatra/base'
require 'sinatra/partial'
require 'tilt/erb'


class Chitter < Sinatra::Base
  register Sinatra::Partial
  register Sinatra::Flash
  set :partial_template_engine, :erb
  enable :sessions
  set :session_secret, 'super secret'
  use Rack::MethodOverride

  get '/' do
    redirect '/chits'
  end

  get '/chits' do
    @chits =  Chit.all.sort_by{|chit| chit.time}.reverse
    erb :'chits/view'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users/new' do
    User.all
    @user = User.new( email: params[:sign_up_email],
                      real_name: params[:real_name],
                      user_name: params[:user_name],
                      password: params[:sign_up_password],
                      password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/chits'
    else
      flash[:errors] = @user.errors.full_messages
      redirect '/chits'
    end
  end

  get '/sessions/new' do
    redirect '/chits'
  end

  post '/sessions/new' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/chits'
    else
      flash.next[:errors] = ['The email or password is incorrect']
      redirect '/chits'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.next[:notice] = "Goodbye!"
    redirect '/chits'
  end

  get '/password_reset' do
    erb :'/users/password_reset'
  end

  post '/password_reset' do
    user = User.first(email: params[:email])
    user.password_token = SecureRandom.urlsafe_base64(32)
    user.save
    erb :'/users/check_your_email'
  end


  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $PROGRAM_NAME
end

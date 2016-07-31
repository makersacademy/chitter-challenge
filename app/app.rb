ENV["RACK_ENV"] ||= "development"


require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/send_email'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  use Rack::MethodOverride
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  get '/' do
    'Welcome to Chitter!'
    redirect to('/peeps')
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(user_name: params[:user_name], email: params[:email],
    name: params[:name], password_confirmation: params[:password_confirmation],
    password: params[:password])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/users/new')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:user_name], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/peeps')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'goodbye!'
    redirect to '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    user = User.get(session[:user_id])
    time = Time.new
    post_time = time.strftime("Posted on %d/%m/%Y, at %I:%M%p")
    peep = Peep.create(peep: params[:peep], author:
    user.user_name, time: post_time)
    peep.user << user
    peep.save
    redirect '/peeps'
  end

  get '/users/recovery' do
    erb :'users/recovery'
  end

  post '/users/recovery' do
    user = User.first(email: params[:email])
    if user
      user.generate_token
      SendEmail.call(user)
    end
    erb :'users/acknowledgement'
  end

  get '/users/reset_password' do
    @user = User.find_by_valid_token(params[:token])
    if @user
      session[:token] = params[:token]
      erb :'users/reset_password'
    else
      "Your token is invalid"
    end
  end

  patch '/users' do
    user = User.find_by_valid_token(session[:token])
    if user.update(password: params[:password], password_confirmation: params[:password_confirmation])
      session[:token] = nil
      user.update(password_token: nil)
      redirect "/sessions/new"
    else
      flash.now[:errors] = user.errors.full_messages
      erb :'users/reset_password'
    end
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end

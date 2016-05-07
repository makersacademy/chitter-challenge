ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'tilt/erb'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  use Rack::MethodOverride

  enable :sessions
  set :session_secret, 'super secret'

  register Sinatra::Flash

  get '/' do
    @user = User.new
    @peeps = Peep.all
    erb :'sessions/index'
  end

  post '/peeps' do
    time = Time.now
    peep = Peep.create(post: params[:peep], time: time.strftime('%H:%M'), user: User.get(session[:user_id]))
    peep.save
    redirect to('/home')
  end

  get '/home' do
    if session[:user_id] == nil
      redirect to('/')
    else
      @peeps = Peep.all
      erb :'sessions/home'
    end
  end

  get '/users/new' do
    @user = User.new
    erb :'users/sign_up'
  end

  post '/users' do
    @user = User.create(name: params[:name],
            user_name: params[:user_name],
            email: params[:email],
            password: params[:password],
            password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/home')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb(:'users/sign_up')
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:user_name], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/home')
    else
      flash.now[:error] = 'The username and/or password is incorrect'
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Goodbye!'
    redirect to '/'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end

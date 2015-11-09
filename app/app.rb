ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './app/data_mapper_setup'
require 'bcrypt'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'super secret'
  use Rack::MethodOverride

  get '/' do
    redirect '/peeps'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
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
    flash.next[:notice] = 'Goodbye!'
    redirect to '/peeps'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(email: params[:email],
                      password: params[:password],
                      password_confirmation: params[:password_confirmation],
                      name: params[:name],
                      user_name: params[:user_name])
    if @user.save
      #session[:user_id] = @user.id
      session[:user_id] = nil
      redirect '/users/new'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    if session[:user_id]
      erb :'peeps/new'
    else
      flash.next[:notice] = 'User not logged in'
      redirect '/peeps'
    end
  end

  post '/peeps' do
    Peep.create(message: params[:message], name: current_user.name,
      user_name: current_user.user_name, time_stamp: Time.now)
    redirect to('/peeps')
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0
end
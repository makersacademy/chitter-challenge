ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require 'sinatra/flash'
require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'models/user'
require_relative 'models/peep'
require_relative 'data_mapper_setup'
require 'byebug'

class Chitter < Sinatra::Base
  use Rack::MethodOverride
  enable :sessions
  set :session_secret, 'super secret'
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
    @user = User.new
    erb :signup
  end

  post '/signup' do
    @user = User.new(name: params[:name],
                     email: params[:email],
                     username: params[:username],
                     password: params[:password],
                     password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/peeps'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :signup
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash.next[:errors] = ['The email or password is incorrect']
      redirect 'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.next[:notice] = 'Goodbye!'
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    # byebug
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(message: params[:peep], time: Time.now, user_id: current_user.id)
    redirect '/peeps'
  end


end

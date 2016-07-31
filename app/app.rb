ENV['RACK_ENV'] = 'development'


require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'

class Chitter < Sinatra::Base

  use Rack::MethodOverride
  register Sinatra::Flash

  enable :sessions
  set :session_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    redirect 'peeps'
  end

  get '/users/new' do
     @user = User.new
    erb :'/users/new'
  end

  post '/users' do
    @user = User.create(full_name: params[:full_name],
    username: params[:username], email: params[:email],
    password: params[:password],
    password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/peeps'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/sessions/new' do
     erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/peeps')
    else
      flash.now[:errors] = ['The username or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Goodbye!'
    redirect to '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all(order: [:id.desc])
    erb :'/peeps/index'
  end

  post '/peeps' do
    if current_user
      peep = Peep.create(message: params[:message])
      current_user.peep << peep
      current_user.save
      redirect to '/peeps'
    else
      flash.next[:errors] = ["You must be logged in to peep."]
      redirect to 'sesions/new'
    end
  end

  run! if app_file == $0
end

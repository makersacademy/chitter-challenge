require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require_relative 'models/lib/time_string'

class ChitterCore < Sinatra::Base

  use Rack::MethodOverride
  enable :sessions
  set :session_secet, 'super secret'
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get session[:user_id]
    end
  end

  get '/' do
    @chits = Chit.all
    @user = User.new
    if current_user
      flash.now[:message] = ["Welcome #{current_user.name}."]
    end
    erb :index
  end

  post '/user' do
    @user = User.create name: params[:name],
                email: params[:email],
                password: params[:password],
                password_confirmation: params[:confirm]
    if @user.save
      session[:user_id] = @user.id
      redirect to'/user'
    else
      flash.now[:message] = @user.errors.full_messages
      erb :index
    end
  end

  get '/user' do
    redirect to'/'
  end

  get '/sessions/new' do
    erb :'/sessions/new'
  end

  post '/sessions' do
    user = User.authenticate params[:email], params[:password]
    if user
      session[:user_id] = user.id
      redirect to '/'
    else
      flash.now[:message] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions/new' do
    flash[:message] = ["Goodbye #{current_user.name}."]
    session[:user_id] = nil
    redirect to '/'
  end

  post '/chits/new' do
    Chit.create(message: params[:chit], chitee: current_user.name, date: TimeString.date, time: TimeString.time)
    redirect to'/'
  end

  run! if app_file == $0
end

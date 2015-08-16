require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  register Sinatra::Flash
  use Rack::MethodOverride
  set :views, proc { File.join(root, 'views') }
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :index
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'/peeps/index'
  end

  post '/peeps' do
    message = params[:message]
    user_id = session[:user_id]
    Peep.create(handle:current_user.handle,
                message: message,
                time: current_time,
                user_id: user_id)
    redirect to('/peeps')
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(email: params[:handle],
                    handle: params[:handle],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/peeps')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/sessions/new' do
    erb :'/sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:handle], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/peeps')
    else
      flash.now[:errors] = ['The handle or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session.clear
    flash[:notice] = ['goodbye!']
  end

  helpers do
    def current_user
      current_user ||= User.get(session[:user_id])
    end

    def current_time
      Time.now.strftime("%d/%m/%Y %H:%M")
    end
  end

  run! if app_file == $0
end

ENV['RACK_ENV'] ||= 'production'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

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
    @peeps = Peep.all
    @message = params[:message]
    # @owner = User.get(session[:user_id])
    erb :index
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(username: params[:username],
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :"users/new"
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect to '/'
    else
      flash.now[:errors] = ['The username or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Goodbye'
    redirect '/'
  end

  get '/peeps/new' do
    if !!User.get(session[:user_id])
      erb :'peeps/new'
    else
      flash.now[:errors] = ['You must be logged in to Peep']
      erb :'sessions/new'
    end
  end

  post '/' do
    peep = Peep.create(message: params[:message], owner: User.get(session[:user_id]).username, time: Time.now)
    peep.save
    redirect '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end

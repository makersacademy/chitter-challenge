ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash
  use Rack::MethodOverride

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    erb :'sessions/new'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(email: params[:email],
                       password: params[:password],
                       password_confirmation: params[:password_confirmation],
                       name: params[:name],
                       user_name: params[:user_name])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/peeps')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
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
    flash.keep[:notice] = 'Signed out'
    redirect to :'/sessions/new'
  end

  get '/peeps' do
    @peeps = Peep.all
    @users = User.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps/add' do
    peep =Peep.new(message: params[:message], user_id: session[:user_id])
    if peep.save
      redirect '/peeps'
    else
      flash.keep[:notice] = 'Please sign in to Peep'
      redirect '/peeps'
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

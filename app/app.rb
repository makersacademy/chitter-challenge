
ENV['RACK_ENV'] ||= 'development'


require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

require_relative 'data_mapper_setup'


class App < Sinatra::Base

  use Rack::MethodOverride

  register Sinatra::Flash

  enable :sessions
  set :sessions_secret, "This is really secret"

  get '/' do
    redirect to'/users/new'
  end

  get '/users/new' do
    @user = User.new
    erb(:'users/new')
  end

  post '/users' do
    @user = User.create(email: params[:email], password: params[:password], name: params[:name], user_name: params[:user_name])

    if @user.save
      session[:user_id] = @user.id
      redirect to('/cheeps')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end

  end

  get '/sessions/new' do
    erb(:'/sessions/new')
  end

  post '/sessions' do
    user = User.authenticate(params[:user_name], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/cheeps')
    else
      flash.now[:errors] = ['The user name or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'goodbye!'
    redirect to '/cheeps'
  end

  get '/cheeps' do
    @cheeps = Cheep.all
    erb :'cheeps/index'
  end

  post '/cheeps/new' do

    if current_user
      cheep = Cheep.create(cheep: params[:cheep], time: Time.new, user_id: current_user.id)
      redirect to'/cheeps'
    else
      flash.keep[:errors] = ['Murray says no, you need to be signed in!!!!!']
      redirect to '/'
    end

  end



  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end

    def get_user_by_id(user_id)
      User.first(id: user_id)
    end

  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end

require 'sinatra/base'
require 'sinatra/flash'
require_relative '../datamapper_setup.rb'
require_relative './models/user'

class App < Sinatra::Base
  set :views, proc { File.join(root, '..', 'views') }
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  post '/users' do
  	@user = User.create(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation], name: params[:name], username: params[:username])
  	if @user.save
  	  session[:user_id] = @user.id
      redirect to('/')
    else
      flash.now[:error] = @user.errors.full_messages#'Password does not match'
      session[:user_id] = nil
      erb :'/users/new'
    end
  end

  get '/users/new' do
  	@user = User.new
    erb :'users/new'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/')
    else
      flash.now[:error] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  helpers do
  	def current_user
      @user = User.first(id: session[:user_id])
    end
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end

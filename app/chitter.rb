require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup.rb'
require 'byebug'

class Chitter < Sinatra::Base
  
	enable :sessions
	register Sinatra::Flash
	set :session_secret, 'super secret'

	helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
	end

  get '/' do
    # 'Hello Chitter!'
    erb :index
  end

  get '/users/new' do
  	@user = User.new
  	erb :'users/new'
  end

  post '/users' do
  	@user = User.new(email: params[:email],
  										 password: params[:password],
  										 password_confirmation: params[:password_confirmation])
  	if @user.save
  		session[:user_id] = @user.id
  		redirect to('/')
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
  		redirect to('/')
  	else
   		flash.now[:errors] = ['The email or password is incorrect']
   		erb :'sessions/new'
  	end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end

ENV["RACK_ENV"] ||= "development"
require_relative 'data_mapper_setup'
require 'sinatra/base'
require 'sinatra/flash'

class Chitter < Sinatra::Base
	 enable :sessions
	 set :session_secret, 'super secret'
	 register Sinatra::Flash

	 get '/' do
 		 erb :index
 	end

	 get '/user/new' do
 		 erb :'user/new'
 	end

	 post '/user/new' do
 		 user = User.new(
  		email: params[:email],
  		username: params[:username],
  		password: params[:password],
  		password_confirmation: params[:password_confirmation]
  		)
 		 if user.save
  			 session[:user_id] = user.id
  			 redirect '/'
  		else
  			 flash.now[:errors] = user.errors.full_messages
  			 erb :'user/new'
  		end
 	end

	 get '/user/login' do
 		 erb :'user/login'
 	end

	 post '/user/login' do
 		 user = User.authenticate(params[:email], params[:password])
 		 if user
  			 session[:user_id] = user.id
  			 redirect '/'
  		else
  			 flash.now[:errors] = ["Incorrect email or password, please try again."]
  			 erb :'user/login'
  		end
 	end

	 helpers do
 		 def current_user
  			 @current_user ||= User.get(session[:user_id])
  		end
 	end

	 run! if app_file == $0
end

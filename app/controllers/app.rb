ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require './app/data_mapper_setup'


class Chitter < Sinatra::Base
	enable :sessions
	set :session_secret, 'secret'
	register Sinatra::Flash
	use Rack::MethodOverride

	def current_user
		@current_user = User.first(id: session[:user_id])
	end

	get '/' do
		erb :index
	end

	get '/users/new' do
		erb :sign_up
	end

	get '/session/new' do
		erb :sign_in
	end

	delete '/session' do
		session[:user_id] = nil
		flash[:signed_out] = 'You are now signed out'
		redirect '/'
	end

	post '/session' do
		user = User.auth(params[:username], params[:password])
 		if user
 			session[:user_id] = user.id
			redirect '/account' 
		else
			flash[:failed] = "Invalid username or password"
			redirect '/session/new'
		end
	end

	get '/account' do
		@current_user = current_user
		erb :account
	end

	post '/users' do
		if User.first(username: params[:username])
			flash[:error] = "Username already in use"
			redirect '/users/new'
		elsif User.first(email: params[:email])
			flash[:error] = "Email already in use"
			redirect '/users/new'
		else
			user = User.create(
				name: params[:name], 
				email: params[:email], 
				username: params[:username], 
				password: params[:password])
			session[:user_id] = user.id
			redirect '/account'
		end
	end

	post '/messages' do
		unless params[:message].empty?
			message = Message.create(
				text: params[:message], 
				date_time: Time.now,
				user_id: current_user.id)
			redirect '/'
		end
	end

	get 'messages/new' do
		if current_user
			erb :message_new
		else
			erb :sign_in
		end
	end

end


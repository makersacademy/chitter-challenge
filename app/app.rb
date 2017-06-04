ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'datamapper_setup'

class Critter < Sinatra::Base
	enable :sessions
	register Sinatra::Flash
	set :session_secret, 'super secret'

	helpers do
		def current_user
			@current_user ||= User.get(session[:user_id])
		end
	end

	get '/' do
	 	erb :index	
	end

	get '/signup' do
		erb :signup
	end

	post '/signup' do
		user = User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password], password_confirmation: params[:confirmation])
		if user.valid?
			session[:user_id] = user.id
			redirect '/creets'
		else
			flash.now[:confirm] = 'Passwords do not match! Please try again.'
			erb :signup
		end
	end
	
	get '/signin' do
		erb :signin
	end
		
	post '/signin' do
		user = User.authenticate(params[:email], params[:password])
		if user
			session[:user_id] = user.id
			redirect '/creets'
		else
			flash.now[:authenticate] = "Username and password do not match!"
			erb :signin
		end

	#	unless User.authentic_name?(params[:email])
	#		flash.now[:user] = "Username does not exist!"	
	#		erb :signin
	#	end
	#	
	#	if User.authentic_pass?(params[:email], params[:password]) 
	#		erb :creets
	#	else
	#		flash.now[:authenticate] = "Username and password do not match!"
	#		erb :signin
	#	end
	end

	get '/creets' do
		@messages = Message.all
		erb :creets
	end

	post '/messages' do
		message = Message.create(text: params[:message], time: Message.set_time)
		message.user = current_user 
		message.save!
		redirect '/creets'
	end
end

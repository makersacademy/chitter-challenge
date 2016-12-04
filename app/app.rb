ENV['RACK_ENV'] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

	enable :sessions
	set :session_secret, 'super secret'
	register Sinatra::Flash
	use Rack::MethodOverride

	get '/' do
		erb :'index'
	end

	get '/users/new' do
		@user = User.new
		erb :'users/new'
	end

	post '/users/add' do
		@user = User.create(firstname: params[:firstname],
			surname: params[:surname],
			email: params[:email],
			username: params[:username],
			password: params[:password],
			password_confirmation: params[:password_confirmation])
		if @user.save
			session[:user_id] = @user.id
			redirect '/'
		else
			flash.now[:errors] = @user.errors.full_messages
			erb :'users/new'
		end
	end

	get '/sessions/new' do
		erb :'sessions/new'
	end

	post '/sessions' do
		@user = User.authenticate(params[:email],
			params[:password])
		if @user
			session[:user_id] = @user.id
			redirect '/'
		else
			flash.now[:errors] = ['Email address or password is incorrect']
			erb :'sessions/new'
		end
	end

	delete '/sessions' do
		session[:user_id] = nil
		flash.keep[:notice] = 'See you again soon!'
		redirect to '/'
	end

	helpers do

		def current_user
			@current_user ||= User.get(session[:user_id])
		end

	end

	run! if app_file == $0

end
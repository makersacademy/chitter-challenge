ENV['RACK_ENV'] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

	enable :sessions
	set :session_secret, 'super secret'
	register Sinatra::Flash

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

	helpers do

		def current_user
			@current_user ||= User.get(session[:user_id])
		end

		def error?(field)
			flash.now[:errors].include?(field) if flash.now[:errors]
		end

	end

	run! if app_file == $0

end
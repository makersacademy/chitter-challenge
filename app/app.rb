ENV['RACK_ENV'] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

	enable :sessions
	set :session_secret, 'super secret'

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
		session[:user_id] = @user.id
		redirect '/'
	end

	helpers do

		def current_user
			@current_user ||= User.get(session[:user_id])
		end

	end

	run! if app_file == $0

end
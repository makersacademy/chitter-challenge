ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra-flash'
require './app/data_mapper_setup'

class Chitter < Sinatra::Base
	enable :sessions
	set :session_secret, 'secret'

	def current_user
		@current_user = User.get(session[:user_id])
	end

	get '/' do
		erb :index
	end

	get '/users/new' do
		erb :register
	end

	get '/login' do
		erb :login
	end

	post '/authenticate' do
		if user = User.first(username: params[:username], password: params[:password])
			session[:user_id] = user.id
			redirect '/account' 
		else
			flash.now['Invalid username or password']
		end
	end

	get '/account' do
		erb :account
	end

	post '/users' do
		user = User.create(name: params[:name], email: params[:email], username: params[:username], password_digest: params[:password])
		session[:user_id] = user.id
		redirect '/account'
	end

end

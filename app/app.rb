ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './app/data_mapper_setup'
require 'bcrypt'
require 'sinatra/flash'
require_relative 'helpers'

class Chitter < Sinatra::Base
	register Sinatra::Flash
	enable :sessions
	set :sessions_secret,'super secret'
	use Rack::MethodOverride
	helpers Helpers

	get '/users/register' do
		@user = User.new
		erb :'users/register'
	end

	post '/users' do
		@user = User.new(name: params[:name], username: params[:username],
						email: params[:email], password: params[:password], 
						password_confirmation: params[:password_confirmation])
		if @user.save
			session[:user_id] = @user.id
			redirect '/homepage'
		else
			flash.now[:errors] = @user.errors.full_messages
			erb :'users/register'
		end
	end

	post '/sessions' do
		user = User.authenticate(params[:username1], params[:password1])
		if user
			session[:user_id] = user.id
		else
			flash.next[:notice] = ['The email or password is incorrect']
		end
		redirect '/homepage'
	end

	get '/homepage' do
		@messages = Message.all
		@users = User.all
		erb :'messages/homepage'
	end

	post '/message' do
		user = current_user
    user.messages << Message.create(peep: params[:peep], user_id: session[:user_id])
    user.save
    redirect '/homepage'
  end

	delete '/sessions' do
		session[:user_id] = nil
		redirect '/homepage'
	end

  run! if app_file == $0
end
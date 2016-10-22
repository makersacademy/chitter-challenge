ENV['RACK_ENV'] ||= "development"

require 'sinatra/base'

require_relative 'data_mapper_setup'
require_relative 'server.rb'

class Chitter < Sinatra::Base

	enable :sessions
  set :session_secret, 'super secret'
  
  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end


	get '/' do
		erb :index
	end

	get '/users' do
		erb :users
	end

	post '/users/new' do
		user = User.create(name: params[:name],
											 email: params[:email],
											 username: params[:username],
											 password: params[:password],
											 password_confirmation: params[:password_confirmation])
		if user.save
			session[:user_id] = user.id 
			redirect '/peeps'
		else 
			redirect '/users'
		end
	end

	get '/peeps' do
		erb :peeps
	end

end
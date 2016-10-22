require 'sinatra/base'
require 'sinatra/flash'
ENV["RACK_ENV"] ||= 'development'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  register Sinatra::Flash

	get '/' do
		erb :index
	end

	get '/users/new' do
	  erb :signup
	end

  post '/users' do
  	user = User.new(email: params[:email], password: params[:password],
  		              password_confirmation: params[:password_confirmation])
  	if user.save
  	  flash.now[:notice] = "Sign Up Successful"
  	  erb :index
  	else 
  		flash.now[:notice] = "Password and confirmation don't match"
  	  erb :signup
  	end
	end

	run! if app_file == $0
end
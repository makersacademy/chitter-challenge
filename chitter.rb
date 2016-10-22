require 'sinatra/base'
ENV["RACK_ENV"] ||= 'development'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

	get '/' do
		erb :index
	end

	get '/users/new' do
	  erb :signup
	end

  post '/users' do
  	User.create(email: params[:email], password: params[:password])
  	redirect '/'
	end

	run! if app_file == $0
end
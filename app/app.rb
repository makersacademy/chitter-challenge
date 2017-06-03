ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'

require_relative 'datamapper_setup'

class Critter < Sinatra::Base

	get '/' do
	 	erb :index	
	end
	
	post '/signup' do
		user = User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
		redirect '/creets'
	end

	get '/creets' do
		@messages = Message.all
		erb :creets
	end

	post '/messages' do
		time = Time.now.strftime("%H:%M:%S").to_s
		message = Message.create(text: params[:message], time: time)
		redirect '/creets'
	end
end

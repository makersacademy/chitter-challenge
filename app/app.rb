ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'

require_relative 'datamapper_setup'

class Critter < Sinatra::Base

	get '/' do
		@messages = Message.all
		erb :index
	end

	post '/messages' do
		message = Message.create(text: params[:message])
		redirect '/'
	end
end

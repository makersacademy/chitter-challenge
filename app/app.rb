ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'

require_relative 'models/message'

class Critter < Sinatra::Base

	get '/' do
		@messages = Message.all
		erb :index
	end

	post '/messages' do
		message = Message.create(text: params[:text])
		redirect '/'
	end
end

ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'

require_relative 'datamapper_setup'

class Critter < Sinatra::Base

	get '/' do
		@messages = Message.all
		erb :index
	end

	post '/messages' do
		time = Time.now.strftime("%H:%M:%S").to_s
		message = Message.create(text: params[:message], time: time)
		redirect '/'
	end
end

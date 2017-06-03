ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'

require_relative 'models/message'

class Critter < Sinatra::Base

	get '/messages' do
		'Test!'
	end
end

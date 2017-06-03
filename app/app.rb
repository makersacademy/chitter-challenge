ENV['RACK_ENV'] = 'development'
require 'sinatra/base'
# require_relative 'initializer'

class Critter < Sinatra::Base

	get '/' do
		'Test!'
	end
end

ENV["RACK_ENV"] ||= 'development'

require 'sinatra/base'

class Chitter < Sinatra::Base

	get '/' do
	end
end
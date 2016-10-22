ENV["RACK_ENV"] ||= 'development'

require 'sinatra/base'
require_relative 'lib/user'

class Chitter < Sinatra::Base

	get '/' do
		erb :index
	end

	get '/users/new' do
	  erb :signup
	end

	run! if app_file == $0
end
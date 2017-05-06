ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'

class Chitter < Sinatra::Base

	get '/' do
		erb :index
	end

	get '/users/new' do
		erb :register
	end

	get '/account' do
		erb :account
	end

end

require 'sinatra/base'
require './lib/peeps'

class Chitter < Sinatra::Base 
		get '/' do 
				"Welcome to chitter!"
		end 

		get '/peeps' do
			@peeps = Peeps.all
			erb :index
		end 

		run if app_file == $0

end 

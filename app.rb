require 'sinatra/base'
require './lib/peep'

class Chitter < Sinatra::Base 
		get '/' do 
				"Welcome to chitter!"
		end 

		get '/peeps' do
			p ENV
			@peeps = Peep.all
			erb :index
		end 

		run if app_file == $0

end 

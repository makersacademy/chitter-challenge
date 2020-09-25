require 'sinatra/base'

class Chitter < Sinatra::Base 
		get '/' do 
				"Welcome to chitter!"
		end 

		get '/peeps' do
			peeps = [
				"Well its friday!",
				"Ready for the weekened?"
			]
			peeps.join
		end 

		run if app_file == $0

end 
